PLAYER = FindMetaTable'Player'
ENTITY = FindMetaTable'Entity'
VECTOR = FindMetaTable'Vector'

local INCLUDE_SH = 0
local INCLUDE_SV = 1
local INCLUDE_CL = 2

rp = rp or {

	cfg = {},

	inv = {

		Data = {},

		Wl = {}

	}

}

rp.meta = rp.meta or {}
rp.meta.item = rp.meta.item or {}
rp.meta.inventory = rp.meta.inventory or {}
rp.db = rp.db or {}
rp.net = rp.net or {}

rp.item = rp.item or {}
rp.item.shop = {}

concommand.Add( "player_position", function( ply, cmd, args )
	chat.AddText( Color( 255, 255, 255 ), "Ваша позиция была скопирована. CTRL+V,чтобы вставить")
	SetClipboardText(("Vector(%s)"):format(string.gsub(tostring(ply:GetPos())," ", ",")))
end)
hook.Add("InitPostEntity", "ResetPlayerStartAngles", function()
	for _, ent in pairs(ents.FindByClass("info_player_start")) do
	  ent:SetAngles(Angle(0, 0, 0))
	end
end)

translates = translates or {
	Get = function(str, ...)
		if ( ({...})[1] ) then
			return string.format( str, ... )
		else
			return str
		end
	end
}


if (SERVER) then
	require'mysql'
else
	require'cvar'
	require'wmat'
	wmat.SetHandler'http://urf.im/wmathandler.php?url='
end

require'nw'
require'pon'
require'pcolor'
require'xfn'

rp.include_sv = (SERVER) and include or function() end
rp.include_cl = (SERVER) and AddCSLuaFile or include

rp.include_sh = function(f)
	rp.include_sv(f)
	rp.include_cl(f)
end


rp.include = function(f)
	if string.find(f, '_sv.lua') then
		-- if SERVER and includeDebug then print( "[rp.include :: sv] -> " .. f ) end
		rp.include_sv(f)
	elseif string.find(f, '_cl.lua') then
		-- if SERVER and includeDebug then print( "[rp.include :: cl] -> " .. f ) end
		rp.include_cl(f)
	else
		-- if SERVER and includeDebug then print( "[rp.include :: sh] -> " .. f ) end
		rp.include_sh(f)
	end
end

rp.include_dir = function(dir, recursive)
	local fol = GM.FolderName .. '/gamemode/' .. dir .. '/'
	local files, folders = file.Find(fol .. '*', 'LUA')

	for _, f in ipairs(files) do
		rp.include(fol .. f)
	end

	if (recursive ~= false) then
		for _, f in ipairs(folders) do
			rp.include_dir(dir .. '/' .. f)
		end
	end
end


function rp.LoadModules(dir)
	local fol = GM.FolderName .. '/gamemode/' .. dir .. '/'

	local files, folders = file.Find(fol .. '*', 'LUA')

	for _, f in ipairs(files) do
		rp.include(fol .. f)
	end

	for _, folder in ipairs(folders) do
		local files, _ = file.Find(fol .. folder .. '/sh_*.lua', 'LUA') -- TODO: FIX

		for _, File in ipairs(files) do
			rp.include_sh(fol .. folder .. '/' .. File)
		end

		local files, _ = file.Find(fol .. folder .. '/sv_*.lua', 'LUA')

		for _, File in ipairs(files) do
			rp.include_sv(fol .. folder .. '/' .. File)
		end

		local files, _ = file.Find(fol .. folder .. '/cl_*.lua', 'LUA') -- TODO: FIX

		for _, File in ipairs(files) do
			rp.include_cl(fol .. folder .. '/' .. File)
		end
	end
end


GM.Name = 'DarkRP'
GM.Author = 'band0'
GM.Website = 'SuperiorServers.co'

rp.include_sv'db.lua'
rp.include_sh'cfg/cfg.lua'
rp.include_sh'cfg/info.lua'
rp.include_sh'cfg/colors.lua'
rp.include_dir'util'
rp.include_dir('core', false)
rp.include_dir'core/sandbox'
rp.include_dir('core/chat', false)
rp.include_dir('core/customtime', false)
rp.include_dir'core/player'
rp.include_dir'core/credits'
rp.include_dir('core/doors', false)
rp.include_dir'core/ui'
rp.include_dir('core/prop_protect', false)
rp.include_dir'core/cosmetics'
rp.include_dir('core/orgs', false)
rp.include_dir('core/makethings', false)
rp.include_dir('core/events', false)
rp.include_dir'core/menus'
rp.include_dir'core/capture'
rp.LoadModules('modules') --Depricated
rp.include_sv'cfg/content.lua'
rp.include_sh'cfg/factions.lua'
rp.include_sh'cfg/jobs.lua'
rp.include_dir('jobs', false)
rp.include_sh'cfg/entities.lua'
rp.include_sh'cfg/cosmetics.lua'
rp.include_sv'cfg/events.lua'
rp.include_sh'cfg/upgrades.lua'
rp.include_sh'cfg/terms.lua'
rp.include_sv'cfg/limits.lua'

hook.Call('ConfigLoaded')

rp.include_sh'util/medialib/medialib.lua'
rp.include_sh'util/medialib/volume3d.lua'
rp.include_sh'util/medialib/services/youtube.lua'
rp.include_sh'util/medialib/services/webradio.lua'
--rp.include_sh 'util/medialib/services/webm.lua'
rp.include_sh'util/medialib/services/vimeo.lua'
rp.include_sh'util/medialib/services/twitch.lua'
rp.include_sh'util/medialib/services/soundcloud.lua'
rp.include_sh'util/medialib/services/mp4.lua'

local loadmsg1 = {
[[ 
╭━━━┳╮╱╭┳━━━┳━━━┳━━━┳━━┳━━━┳━━━╮╭╮╱╭┳╮╱╱╭━━━┳━━━┳━━━╮
┃╭━╮┃┃╱┃┃╭━╮┃╭━━┫╭━╮┣┫┣┫╭━╮┃╭━╮┃┃┃╱┃┃┃╱╱┃╭━╮┃╭━╮┃╭━╮┃
┃╰━━┫┃╱┃┃╰━╯┃╰━━┫╰━╯┃┃┃┃┃╱┃┃╰━╯┃┃╰━╯┃┃╱╱╰╯╭╯┃╰━╯┃╰━╯┃
╰━━╮┃┃╱┃┃╭━━┫╭━━┫╭╮╭╯┃┃┃┃╱┃┃╭╮╭╯┃╭━╮┃┃╱╭┳━╯╭┫╭╮╭┫╭━━╯
┃╰━╯┃╰━╯┃┃╱╱┃╰━━┫┃┃╰┳┫┣┫╰━╯┃┃┃╰╮┃┃╱┃┃╰━╯┃┃╰━┫┃┃╰┫┃
╰━━━┻━━━┻╯╱╱╰━━━┻╯╰━┻━━┻━━━┻╯╰━╯╰╯╱╰┻━━━┻━━━┻╯╰━┻╯
Credits: -Spac3
]]
}
for _, v in ipairs(loadmsg1) do
	MsgC(rp.col.White, v .. '\n')
end

if CLIENT then
	surface.CreateFont("CaptureBig",{
		font = "Open Sans Light",
		extended = true,
		size = 23,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = true,
		additive = false,
		outline = false,
	})
	
	surface.CreateFont("CaptureSmall",{
		font = "Open Sans Light",
		extended = true,
		size = 28,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = true,
		additive = false,
		outline = false,
	})
	
	surface.CreateFont("3d2d",{font = "Open Sans Light",size = 130,weight = 1700,shadow = true, antialias = true, extended = true,})
	surface.CreateFont("Trebuchet22", {size = 22,weight = 500,antialias = true,shadow = false,font = "Trebuchet MS"})
	
	timer.Create("CleanBodys", 60, 0, function()
		RunConsoleCommand("r_cleardecals")
		for k, v in ipairs(ents.FindByClass("class C_ClientRagdoll")) do
			v:Remove()
		end
		for k, v in ipairs(ents.FindByClass("class C_PhysPropClientside")) do
			v:Remove()
		end
	end)
	
	hook("InitPostEntity", function()
		//Material('logos/sup'):SetTexture('$basetexture',Material('models/debug/debugwhite'):GetTexture('$basetexture'))
		LocalPlayer():ConCommand("stopsound; cl_updaterate 16; cl_cmdrate 16;")
	
		timer.Simple(10, function()
			for k, v in pairs(rp.cfg.MaterialOverride[game.GetMap()] or {}) do
				timer.Simple(k, function()
					wmat.Create(game.GetMap()..'_override_'..k, {
						URL = v[2],
						W 	= 1000,
						H 	= 1000,
					}, function(material)
						Material(v[1]):SetTexture('$basetexture',material:GetTexture('$basetexture'))
					end)
				end)
			end
		end)
	end)
	
	
	local GUIToggled = false
	local mouseX, mouseY = ScrW() / 2, ScrH() / 2
	function GM:ShowSpare1()
		if LocalPlayer():IsBanned() then return end
		GUIToggled = not GUIToggled
	
		if GUIToggled then
			gui.SetMousePos(mouseX, mouseY)
		else
			mouseX, mouseY = gui.MousePos()
		end
		gui.EnableScreenClicker(GUIToggled)
	end
	
	local FKeyBinds = {
		["gm_showhelp"] = "ShowHelp",
		["gm_showteam"] = "ShowTeam",
		["gm_showspare1"] = "ShowSpare1",
		["gm_showspare2"] = "ShowSpare2"
	}
	
	function GM:PlayerBindPress(ply, bind, pressed)
		if LocalPlayer():IsBanned() then return end
		local bnd = string.match(string.lower(bind), "gm_[a-z]+[12]?")
		if bnd and FKeyBinds[bnd] and GAMEMODE[FKeyBinds[bnd]] then
			GAMEMODE[FKeyBinds[bnd]](GAMEMODE)
		end
		return
	end
	
end