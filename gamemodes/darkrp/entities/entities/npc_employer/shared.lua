ENT.Base = 'base_ai'

ENT.Type = 'ai'

ENT.PrintName = 'Employer'

ENT.AutomaticFrameAdvance = true

ENT.Spawnable = true

ENT.Category = 'RP NPCs'



function ENT:SetupDataTables()

	self:NetworkVar('Int', 0, 'Faction')

end