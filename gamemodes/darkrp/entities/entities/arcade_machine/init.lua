AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')
include('shared.lua')

resource.AddFile('models/custom/slot.mdl')
resource.AddFile('materials/models/custom/slot.vmt')
resource.AddFile('materials/models/custom/slot_nm.vtf')

util.AddNetworkString('rp.ArcadeMenu')

function ENT:Initialize()
	self:SetModel('models/custom/slot.mdl')
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:EnableMotion(false)
	end
end 

function ENT:Use(pl)
	if ((not pl.LastArcadeUse) or (pl.LastArcadeUse <= CurTime())) and (self:GetPos():Distance(pl:GetPos()) < 80) then
		rp.Notify(pl, NOTIFY_GREEN, rp.Term('ArcadeMachineUse'))

		net.Start('rp.ArcadeMenu')
			net.WriteEntity(self)
		net.Send(pl)
		pl.LastArcadeUse = CurTime() + 2
	end
end 

hook.Add('InitPostEntity', function()
	for k, v in ipairs(rp.cfg.Arcades[game.GetMap()]) do
		local ent = ents.Create('arcade_machine')
		ent:SetPos(v.Pos)
		ent:SetAngles(v.Ang)
		ent:Spawn()
		ent:Activate()
		ent:GetPhysicsObject():EnableMotion(false)
		if v.Game then
			ent:SetMode(k)
		end
	end
end)