
-----------------------------------------------------
--cvar.Register'render_distance_disable':SetDefault(false):AddMetadata('State', 'RPMenu'):AddMetadata('Menu', 'Отключить ограничение прорисовки (только для мощных ПК)')
cvar.Register'render_distance':SetDefault(1):AddMetadata('State', 'RPMenu'):AddMetadata('Menu', 'Дальность прорисовки - чем ниже тем выше FPS (поставьте на максимум, чтобы отключить)'):AddMetadata('Type', 'number')
local cvar_Get = cvar.GetValue

local LocalPlayer 			= LocalPlayer
local GetPos 				= ENTITY.GetPos
local DistToSqr 			= VECTOR.DistToSqr
local ents_GetAll = ents.GetAll
local player_GetAll = player.GetAll
local print = function() end
 
local lp
local whitelist = {
	['prop_physics'] = true,
	['prop_dynamic'] = true
}
local ent_draw = {}
local disable = true
local renderDistance = 0
local value = 1
local renderMultiplayer = 20000000

function ENTITY:InRenderDistance()
	return false
end

function PLAYER:InRenderDistance()
	return false
end

hook.Add('Think', 'RenderCheck', function()
	if IsValid(LocalPlayer()) then
		lp = LocalPlayer()

		function ENTITY:InRenderDistance()
			print(DistToSqr(GetPos(self), GetPos(lp)))
			return (DistToSqr(GetPos(self), GetPos(lp)) < renderDistance)
		end

		function PLAYER:InRenderDistance()
			return (DistToSqr(GetPos(self), GetPos(lp)) < renderDistance)
		end

		hook.Remove('Think', 'RenderCheck')
	end
end)

timer.Create('ChangeRenderDistance', 1, 0, function()
	value =  cvar_Get('render_distance')
	disable = value == 1
	renderDistance = (value) * renderMultiplayer
end)

local function ToggleDraw(ent)
	local what = !(ent:InRenderDistance() or disable)
	if ent_draw[ent] != what then 
		ent:SetNoDraw(what) 
		ent_draw[ent] = what 
	end
end
hook.Add('PreRender','Draw',function()
	for k,v in pairs(ents_GetAll()) do
		if !(whitelist[v:GetClass()]) then continue end
		ToggleDraw(v)
	end
	for k,v in pairs(player_GetAll()) do 
		if v == lp then continue end 
		ToggleDraw(v) 
	end
end)