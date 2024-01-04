AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')

include('shared.lua')

util.AddNetworkString('rp.EmployerMenu')
function ENT:Initialize()
	--self:SetModel('models/Barney.mdl') -- rp.Factions[ent:GetFaction()].model

	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER )
	self:SetMaxYawSpeed(90)
	self.NextUse = 0;
end

function ENT:AcceptInput( input, activator )
    if input == "Use" and activator:IsPlayer() and self.NextUse <= CurTime() then
       -- if self:IsHidden(activator) then return end
        
        net.Start( "rp.EmployerMenu" );
            net.WriteEntity( self );
        net.Send( activator );

        self.NextUse = CurTime() + 0.5;
    end
end

hook.Add('InitPostEntity', function()
	for k,v in pairs(rp.Factions) do
		local npc = ents.Create('npc_employer')
		local tab = v.npcs[game.GetMap()][1]
		npc:SetFaction(k)
		npc:SetNWInt("Faction",k)
		npc:SetPos(tab[1])
		npc:SetAngles(tab[2])
		npc:SetModel(tab[3])	
		npc:Spawn()
		print("NPC -",k,"Faction -",npc:GetNWInt("Faction",k))
	end
end)