
-----------------------------------------------------
include("player_infocard.lua")
local surface = surface
local color_white = Color(250, 250, 250)
local texGradient = surface.GetTextureID("gui/center_gradient")

local function scoreboard_DrawNameArea(self)
	surface.SetFont('ui.18')
	surface.SetTextPos(92, 3)
	surface.SetTextColor(color_white)
	local text = self.NameText or ''
	local text_w, text_h = self.NameTextW, self.NameTextH --surface.GetTextSize(text)

	if (not self.Player:Alive()) and LocalPlayer():IsAdmin() then
		surface.SetTextColor(ui.col.Black)
	elseif (self.Player:IsWanted()) then
		surface.SetTextColor(255, math.sin(CurTime() * math.pi) * 255, math.sin(CurTime() * math.pi) * 255, 255)
	else
		surface.SetTextColor(ui.col.White)
	end

	surface.DrawText(text)

	if (not self.Player:Alive()) and LocalPlayer():IsAdmin() then
		surface.SetDrawColor(ui.col.Black)
		surface.DrawRect(92, 3 + (text_h / 2) + 1, text_w, 1)
	end
end

local function scoreboard_DrawJobArea(self)
	local t = self.JobName or ''
	local w, h = self.JobNameW, self.JobNameH --surface.GetTextSize(t)
	local x = self.lblTeam[1]
	local y = self.lblTeam[2]
	surface.SetTextColor(color_white)
	surface.SetTextPos(x - w / 2, y)
	surface.DrawText(t)
end

local function scoreboard_DrawTimeArea(self)
	local t = self.PlayTime or ''
	local w, h = self.PlayTimeW, self.PlayTimeH --surface.GetTextSize(t)
	local x = self.lblHours[1]
	local y = self.lblHours[2]
	surface.SetTextPos(x - w / 2, y)
	surface.DrawText(t)
end

local function scoreboard_DrawPingArea(self)
	local t = self.Ping or ''
	local w, h = self.PingW, self.PingH --surface.GetTextSize(t)
	local x = self.lblPing[1]
	local y = self.lblPing[2]
	surface.SetTextPos(x - w / 2, y)
	surface.DrawText(t)
end

local PANEL = {}
--[[---------------------------------------------------------
   Name: Paint
---------------------------------------------------------]]
local pcol100 = Color(100, 100, 100)
local pcol125 = Color(125, 125, 125)
local pcol100lite = Color(100, 100, 100, 155)
local pcol255lite = Color(255, 255, 255, 120)
local pcol200lite = Color(200, 200, 200, 200)
local pcol200liter = Color(200, 200, 200, 100)
local pcol50lite = Color(50, 50, 50, 100)

function PANEL:Paint(w, h)
	if not IsValid(self.Player) then
		self:Remove()
		SCOREBOARD:InvalidateLayout()

		return
	end

	local color = pcol100

	if self.Player:GetJob() == TEAM_CONNECTING then
		color = pcol100lite
	elseif IsValid(self.Player) then
		if self.Player:GetJob() ~= TEAM_UNASSIGNED then
			color = self.Player:GetJobColor()
		end
	end

	if self.Open or self.Size ~= self.TargetSize then
		draw.Box(0, 16, self:GetWide(), self:GetTall() - 16, color)
		draw.Box(2, 16, self:GetWide() - 4, self:GetTall() - 16 - 2, pcol255lite)
		surface.SetTexture(texGradient)
		surface.SetDrawColor(pcol200lite)
		surface.DrawTexturedRect(0, 16, self:GetWide(), self:GetTall() - 18)
	end

	draw.Box(0, 0, self:GetWide(), 25, color)
	surface.SetTexture(texGradient)
	surface.SetDrawColor(pcol200liter)
	surface.DrawTexturedRect(0, 0, w, 25)
	surface.SetDrawColor(pcol50lite)
	surface.DrawOutlinedRect(1, 0, w - 2, 25)
	surface.DrawLine(24, 0, 24, 25)
	surface.DrawLine(41, 0, 41, 25)
	surface.DrawLine(68, 0, 68, 25)
	surface.DrawLine(87, 0, 87, 25)
	surface.SetAlphaMultiplier(1)
	-- Draw name?
	scoreboard_DrawNameArea(self)
	scoreboard_DrawJobArea(self)
	scoreboard_DrawTimeArea(self)
	scoreboard_DrawPingArea(self)

	return true
end

--[[---------------------------------------------------------
   Name: SetPlayer
---------------------------------------------------------]]
function PANEL:SetPlayer(ply)
	self.Player = ply
	self.infoCard:SetPlayer(ply)
	self:UpdatePlayerData()
	self.imgAvatar:SetPlayer(ply)
end

--[[---------------------------------------------------------
   Name: UpdatePlayerData
---------------------------------------------------------]]
function PANEL:UpdatePlayerData()
	local ply = self.Player
	if not IsValid(ply) then return end
	local badgeimg = (ply:IsRoot() and 'icon16/tux.png') or (ply:GetRank() == 'globaladmin' and 'icon16/world.png') or (ply:GetRank() == 'superadmin' and 'icon16/shield_add.png') or (ply:IsAdmin() and 'icon16/shield.png') or (ply:GetRank() == 'manager' and 'icon16/key.png') or (ply:GetRank() == 'superadmin' or ply:GetRank() == 'headadmin' and 'icon16/shield_add.png') or (ply:IsVIP() and ((ply:GetPlayTime() > 800 * 3600 and 'icon16/award_star_gold_1.png') or (ply:GetPlayTime() > 500 * 3600 and 'icon16/award_star_silver_3.png') or (ply:GetPlayTime() > 300 * 3600 and 'icon16/award_star_bronze_2.png') or 'icon16/star.png')) or 'icon16/user.png'

	if (not self.BadgeImg or self.BadgeImg ~= badgeimg) then
		self.Badge:SetImage(badgeimg)
		self.BadgeImg = badgeimg
	end

	local countryimg = 'flags16/' .. ply:GetCountry() .. '.png'

	if (not self.CountryImg or self.CountryImg ~= countryimg) then
		self.Country:SetImage(countryimg)
		self.CountryImg = countryimg
	end

	local osimg = (ply:GetOS() == 'linux' and 'icon16/tux.png') or 'sup/os/' .. ply:GetOS() .. '.png'

	if (not self.OSImg or self.OSImg ~= osimg) then
		self.OS:SetImage(osimg)
		self.OSImg = osimg
	end

	local name = (self.Player:IsValid() and self.Player:Name()) or ""
	self.NameText = ((self.Player:GetNickName() and self.Player:GetNickName() ~= '') and (name .. ' (' .. self.Player:GetNickName() .. ')') or name)
	self.PlayTime = ba.str.FormatTime(self.Player:GetPlayTime())
	self.Ping = self.Player:Ping()
	self.JobName = self.Player:GetJobName()
	surface.SetFont('ui.18')
	self.NameTextW, self.NameTextH = surface.GetTextSize(self.NameText)
	self.PlayTimeW, self.PlayTimeH = surface.GetTextSize(self.PlayTime)
	self.PingW, self.PingH = surface.GetTextSize(self.Ping)
	self.JobNameW, self.JobNameH = surface.GetTextSize(self.JobName)
end

--[[---------------------------------------------------------
   Name: Init
---------------------------------------------------------]]
function PANEL:Init()
	self.Size = 20
	self:OpenInfo(false)
	self.infoCard = ui.Create("suiscoreplayerinfocard", self)
	self.imgAvatar = ui.Create("ui_avatarbutton", self)
	self.Badge = ui.Create('DImage', self)
	self.Country = ui.Create('DImage', self)
	self.OS = ui.Create('DImage', self)
	self.btnMute = ui.Create('DImageButton', self)
	self.btnMute:SetImage('icon32/unmuted.png')

	self.btnMute.DoClick = function()
		if self.Player:IsMuted() then
			self.Player:SetMuted(false)
			self.btnMute:SetImage('icon32/unmuted.png')
		else
			self.Player:SetMuted(true)
			self.btnMute:SetImage('icon32/muted.png')
		end
	end
end

--[[---------------------------------------------------------
   Name: ApplySchemeSettings
---------------------------------------------------------]]
function PANEL:ApplySchemeSettings()
end

--[[---------------------------------------------------------
   Name: DoClick
---------------------------------------------------------]]
function PANEL:DoClick()
	self:OpenInfo(not self.Open)
end

--[[---------------------------------------------------------
   Name: OpenInfo
   ---------------------------------------------------------]]
function PANEL:OpenInfo(open)
	if open then
		self.TargetSize = 135
	else
		self.TargetSize = 25
	end

	self.Open = open
end

--[[---------------------------------------------------------
   Name: Think
---------------------------------------------------------]]
function PANEL:Think()
	if self.Size ~= self.TargetSize then
		self.Size = math.Approach(self.Size, self.TargetSize, (math.abs(self.Size - self.TargetSize) + 1) * 10 * FrameTime())
		self:PerformLayout()
		SCOREBOARD.PlayerFrame:InvalidateLayout()

		if (self.y + self.Size > SCOREBOARD.PlayerFrame:GetTall() + SCOREBOARD.PlayerFrame.yOffset) then
			SCOREBOARD.PlayerFrame:ScrollTo(-(SCOREBOARD.PlayerFrame:GetTall() - (self.y + self.Size)))
		end
	end

	if not self.PlayerUpdate or self.PlayerUpdate < CurTime() then
		self.PlayerUpdate = CurTime() + 1
		self:UpdatePlayerData()
	end
end

--[[---------------------------------------------------------
   Name: PerformLayout
---------------------------------------------------------]]
function PANEL:PerformLayout()
	self:SetSize(self:GetWide(), self.Size)
	self.imgAvatar:SetPos(2, 2)
	self.imgAvatar:SetSize(21, 21)
	self.Badge:SetSize(16, 16)
	self.Badge:SetPos(25, 5)
	self.Country:SetSize(24, 16)
	self.Country:SetPos(43, 5)
	self.OS:SetSize(16, 16)
	self.OS:SetPos(70, 5)
	local p1x = self:GetParent():GetParent().x
	local p2 = self:GetParent():GetParent():GetParent()
	self.lblTeam = {p2.lblTeam.x + (p2.lblTeam:GetWide() / 2) - p1x - 3, 3}
	self.lblHours = {p2.lblHours.x + (p2.lblHours:GetWide() / 2) - p1x - 3, 3}
	self.lblPing = {p2.lblPing.x + (p2.lblPing:GetWide() / 2) - p1x - 3, 3}
	self.btnMute:SetPos(self:GetWide() - 24, 2)
	self.btnMute:SetSize(21, 21)

	if self.Open or self.Size ~= self.TargetSize then
		self.infoCard:SetVisible(true)
		self.infoCard:SetPos(2, 25)
		self.infoCard:SetSize(self:GetWide() - 4, self:GetTall() - 27)
		self.infoCard:ApplySchemeSettings()
	else
		self.infoCard:SetVisible(false)
	end
end

--[[---------------------------------------------------------
   Name: HigherOrLower
---------------------------------------------------------]]
function PANEL:HigherOrLower(row)
	if self.Player:GetJob() == TEAM_CONNECTING or row.Player:GetJob() == TEAM_CONNECTING then return false end
	local team1 = self.Player:GetJob()
	local team2 = row.Player:GetJob()

	if (team1 == TEAM_RAPIST) then
		team1 = TEAM_CITIZEN
	end

	if (team2 == TEAM_RAPIST) then
		team2 = TEAM_CITIZEN
	end

	if team1 ~= team2 then return team1 < team2 end
	if (self.Player:Frags() == row.Player:Frags()) then return self.Player:Deaths() < row.Player:Deaths() end

	return self.Player:Frags() > row.Player:Frags()
end

vgui.Register("suiscoreplayerrow", PANEL, "DButton")