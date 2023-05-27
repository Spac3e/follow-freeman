include("shared.lua")

ENT.PrintName = "Поле Альянса - Малое"
ENT.Category = "За Фрименом"

function ENT:Initialize()
	self:SetCustomCollisionCheck(true)
end

function ENT:Think()
	self:CollisionRulesChanged()
	
	self:NextThink( CurTime() + 5 )
	return true
end

ENT.isForceField = true