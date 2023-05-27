--[[
	� 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

ENT.Type = "anim";
ENT.Spawnable = true;

-- Called when the datatables are setup.
function ENT:SetupDataTables()
	self:NetworkVar('Int', 0, 'State')
end;