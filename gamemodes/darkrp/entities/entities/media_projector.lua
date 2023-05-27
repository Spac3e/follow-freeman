AddCSLuaFile()

ENT.Base				= 'media_base'
ENT.PrintName			= 'Projector'
ENT.Category 			= 'RP Media'
ENT.Spawnable			= true

ENT.RemoveOnJobChange 	= true

ENT.Model = 'models/props/cs_office/projector.mdl'

if (SERVER) then
	function ENT:CanUse(pl)
		return pl:IsSuperAdmin() or (pl:Team() == TEAM_CINEMAOWNER)
	end

	hook.Add('InitPostEntity', 'theater.InitPostEntity', function()
		local proj = ents.Create('media_projector')
		proj:SetPos(rp.cfg.Theaters[game.GetMap()].Projector.Pos)
		proj:SetAngles(rp.cfg.Theaters[game.GetMap()].Projector.Ang)
		proj:Spawn()
		proj:SetMoveType(MOVETYPE_NONE)
	end)
else
	function ENT:Draw()
		self:DrawModel()
	end

	local proj
	local dat = rp.cfg.Theaters[game.GetMap()].Screen
	hook.Add('PostDrawOpaqueRenderables', 'theater.PostDrawOpaqueRenderables', function()
		if IsValid(proj) then
			cam.Start3D2D(rp.cfg.Theaters[game.GetMap()].Screen.Pos, rp.cfg.Theaters[game.GetMap()].Screen.Ang, rp.cfg.Theaters[game.GetMap()].Screen.Scale)
				proj:DrawScreen(-360,400,1920,1080)
			cam.End3D2D()
		else
			proj = ents.FindByClass('media_projector')[1]
		end
	end)
end