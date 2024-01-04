
-----------------------------------------------------
include'shared.lua'

function ENT:Draw()
	self:DrawModel()
end

function rp.DisguiseMenu()
	local ent = net.ReadEntity()
	local faction = net.ReadInt(4)

	local fr = ui.Create('ui_frame', function(self, p)
		self:SetSize(ScrW() * 0.65, ScrH() * 0.6)
		self:SetTitle('Disguise')
		self:Center()
		self:MakePopup()
	end)

	ui.Create('rp_jobslist', function(self, p)
		self:SetPos(5, 25)
		self:SetSize(p:GetWide() - 10, p:GetTall() - 30)

		self.DoClick = function()
			if IsValid(ent) then
				net.Start('DisguiseToServer')
				net.WriteEntity(ent)
				net.WriteInt(self.job.team, 8)
				net.SendToServer()
			else
				net.Start('PlayerDisguise')
				net.WriteInt(self.job.team, 8)
				net.SendToServer()
			end
		end

		for k, v in pairs(rp.Factions[faction].jobsMap) do
			if LocalPlayer():CanTeam(rp.TeamByID(v)) then
				self:AddJob(v)
			end
		end
	end, fr)
end

net.Receive('DisguiseMenu', rp.DisguiseMenu)

function rp.DisguiseMenuF4()
	local faction = LocalPlayer():GetTeamTable().disguise_faction

	local fr = ui.Create('ui_frame', function(self, p)
		self:SetSize(ScrW() * 0.65, ScrH() * 0.6)
		self:SetTitle('Disguise')
		self:Center()
		self:MakePopup()
	end)

	ui.Create('rp_jobslist', function(self, p)
		self:SetPos(5, 25)
		self:SetSize(p:GetWide() - 10, p:GetTall() - 30)

		self.DoClick = function()
			net.Start('PlayerDisguise')
			net.WriteInt(self.job.team, 8)
			net.SendToServer()
		end

		for k, v in pairs(rp.Factions[faction].jobsMap) do
			if LocalPlayer():CanTeam(rp.TeamByID(v)) then
				self:AddJob(v)
			end
		end
	end, fr)
end