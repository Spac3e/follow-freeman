ENT.Type 		= 'anim' 
ENT.Base		= 'base_anim' 
ENT.PrintName	= 'Arcade Machine'
ENT.Author		= 'aStonedPenguin'
ENT.Spawnable	= true
ENT.Category 	= 'RP'

function ENT:SetupDataTables()
	self:NetworkVar('Int', 0, 'Mode')
end

function ENT:GetGame()
	return rp.cfg.Arcades[self:GetMode()] and rp.cfg.Arcades[self:GetMode()].Game or 'http://agar.io/'
end