ENT.Base = "base_entity"
ENT.PrintName = "Base NPC"
ENT.Instructions = "Base entity"
ENT.Author = "Vend"

ENT.Spawnable = true
ENT.Base 					= 'base_ai'
ENT.Type 					= 'ai'
ENT.PrintName 				= 'JobNPC'  
ENT.AutomaticFrameAdvance 	= false
ENT.Spawnable 			 	= false
ENT.Category 				= 'RP NPCs'


function ENT:SetupDataTables()
	self:NetworkVar('Int', 0, 'Faction')
end



function ENT:SetAutomaticFrameAdvance( bUsingAnim )
	self.AutomaticFrameAdvance = bUsingAnim
end