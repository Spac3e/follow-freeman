-----------------------------------------------------
include("player_row.lua")



if SuiScoreBoard then

	SuiScoreBoard:Remove()

	SuiScoreBoard = nil

end



surface.CreateFont("switchteambutton", {

	font = "coolvetica",

	size = 30,

	weight = 300

})



surface.CreateFont("suiscoreboardheader", {

	font = "coolvetica",

	size = 50,

	weight = 300

})



surface.CreateFont("suiscoreboardsubtitle", {

	font = "coolvetica",

	size = 20,

	weight = 100

})



surface.CreateFont("suiscoreboardlogotext", {

	font = "coolvetica",

	size = 75,

	weight = 100

})



surface.CreateFont("TextFontSmall", {

	font = "verdana",

	size = 12,

	weight = 100

})



surface.CreateFont("suiscoreboardplayername", {

	font = "trebuchet",

	size = 17,

	weight = 530

})



surface.CreateFont("suiscoreboardplayernamebold", {

	font = "trebuchet",

	size = 18,

	weight = 650

})



local texGradient = surface.GetTextureID("gui/center_gradient")

local PANEL = {}



--[[---------------------------------------------------------

   Name: Paint

---------------------------------------------------------]]

function PANEL:Init()

	SCOREBOARD = self

	self.Hostname = ui.Create("DLabel", self)

	self.Hostname:SetText(rp.cfg.ScoreboardName)

	self.SuiSc = ui.Create("DLabel", self)

	self.SuiSc:SetText("")

	self.Description = ui.Create("DLabel", self)

	self.Description:SetText("Наш Discord сервер - https://discord.gg/tAkd8Y99hS")

	self.Uptime = ui.Create("DLabel", self)

	self.Uptime:SetText("Сервер онлайн:")

	self.PlayerFrame = ui.Create("ui_scrollpanel", self)

	self.PlayerFrame:SetScrollSize(7)



	self.PlayerFrame.PerformLayout = function(self)

		local canvas = self:GetCanvas()



		if (canvas:GetWide() ~= self:GetWide()) then

			canvas:SetWide(self:GetWide())

		end



		local y = 0

		local PlayerSorted = {}



		for k, v in pairs(self:GetParent().PlayerRows) do

			if IsValid(k) then

				table.insert(PlayerSorted, v)

			end

		end



		table.sort(PlayerSorted, function(a, b) return a:HigherOrLower(b) end)



		for k, v in ipairs(PlayerSorted) do

			local childY = y + self.SpaceTop



			if (v.x ~= self.Padding or v.y ~= childY) then

				v:SetPos(self.Padding, y + self.SpaceTop)

			end



			v.y = childY



			if (v:GetWide() ~= self:GetWide() - self.Padding * 2) then

				v:SetWide(self:GetWide() - self.Padding * 2)

			end



			y = y + v:GetTall() - 1

		end



		y = math.Clamp(y - self.SpaceTop, 0, math.huge)

		canvas:SetTall(y)



		if (canvas:GetTall() <= self:GetTall()) then

			canvas:SetTall(self:GetTall())

			self.scrollBar:SetVisible(false)

		else

			self.scrollBar:SetVisible(true)

		end



		local maxOffset = (self:GetCanvas():GetTall() - self:GetTall())



		if (self.yOffset > maxOffset) then

			self.yOffset = maxOffset

		end



		if (self.yOffset < 0) then

			self.yOffset = 0

		end



		canvas:SetPos(0, -self.yOffset)

		self.scrollBar:InvalidateLayout()

	end



	self.PlayerFrame.Paint = function(self, w, h)

		--surface.SetDrawColor(200, 200, 200, 255)

		--surface.DrawRect(0, 0, w, h)

	end



	self.PlayerRows = {}

	self.lblPing = ui.Create("DLabel", self)

	self.lblPing:SetText("Пинг")

	self.lblHours = ui.Create("DLabel", self)

	self.lblHours:SetText("")

	self.lblTeam = ui.Create("DLabel", self)

	self.lblTeam:SetText("Профессия")

end



--[[---------------------------------------------------------

   Name: Paint

---------------------------------------------------------]]

function PANEL:AddPlayerRow(ply)

	local button = ui.Create("suiscoreplayerrow")

	button:SetPlayer(ply)

	self.PlayerFrame:AddItem(button)

	self.PlayerRows[ply] = button

end



--[[---------------------------------------------------------

   Name: Paint

---------------------------------------------------------]]

function PANEL:GetPlayerRow(ply)

	return self.PlayerRows[ply]

end



--[[---------------------------------------------------------

   Name: Paint

---------------------------------------------------------]]

function PANEL:Paint(w, h)

	draw.Blur(self)

	surface.SetAlphaMultiplier(self.AlphaMul or 0)

	--draw.RoundedBox(2, 0, 0, self:GetWide(), self:GetTall(), Color(0, 0, 0, 205))

	surface.SetTexture(texGradient)

	surface.SetDrawColor(100, 100, 100, 100)

	surface.DrawTexturedRect(0, 0, self:GetWide(), self:GetTall())

	surface.SetDrawColor(0, 0, 0, 170)

	surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())

	---- White Inner Box

	--draw.RoundedBox(2, 15, self.Description.y - 8, self:GetWide() - 30, self:GetTall() - self.Description.y - 8, Color(230, 230, 230, 100))

	--surface.SetTexture(texGradient)

	--surface.SetDrawColor(255, 255, 255, 50)

	--surface.DrawTexturedRect(15, self.Description.y - 8, self:GetWide() - 30, self:GetTall() - self.Description.y - 8)

	---- Sub Header

	--draw.RoundedBox(2, 151, self.Description.y - 4, self:GetWide() - 170, self.Description:GetTall() + 8, Color(100, 100, 100, 155))

	--surface.SetTexture(texGradient)

	surface.SetDrawColor(255, 255, 255, 50)

	--surface.DrawTexturedRect(151, self.Description.y - 4, self:GetWide() - 171, self.Description:GetTall() + 8)

	local tColor = Color(51, 128, 255, 255)



	if (tColor.r < 255) then

		tColorGradientR = tColor.r + 15

	else

		tColorGradientR = tColor.r

	end



	if (tColor.g < 255) then

		tColorGradientG = tColor.g + 15

	else

		tColorGradientG = tColor.g

	end



	if (tColor.b < 255) then

		tColorGradientB = tColor.b + 15

	else

		tColorGradientB = tColor.b

	end



	--draw.RoundedBox(2, 24, 12, 122, 80, Color(tColor.r, tColor.g, tColor.b, 200))

	--surface.SetTexture(texGradient)

	--surface.SetDrawColor(tColorGradientR, tColorGradientG, tColorGradientB, 225)

	--surface.DrawTexturedRect(24, 12, 122, 80)

	--surface.SetDrawColor(0, 0, 0, 200)

	--surface.DrawOutlinedRect(24, 12, 122, 80)

end



function PANEL:OpenAnimation()

	self.StartAnim = SysTime()

	self.StartY = self.ActualY or -(ScrH() * 0.85)

	self.EndY = (ScrH() - (ScrH() * 0.85)) / 2

	self.ActualY = self.StartY

	self.Opening = true

end



function PANEL:CloseAnimation()

	self.StartAnim = SysTime()

	self.StartY = self.ActualY or 0

	self.EndY = -self:GetTall()

	self.ActualY = self.StartY

	self.Opening = false

end



function PANEL:Think()

	self:UpdateScoreboard()

	local mul



	if (self.Opening) then

		mul = math.sin(math.Clamp((SysTime() - self.StartAnim) / .5, 0, 1) * (math.pi / 1.42)) * 1.25

	else

		mul = 1 - math.sin((math.Clamp((SysTime() - self.StartAnim) / .3, 0, 1) - 2.42) * (math.pi / 1.42)) * 1.25

	end



	self.ActualY = self.StartY + mul * (self.EndY - self.StartY)

	--self.ActualY = self.StartY + (math.sin(math.Clamp((SysTime() - self.StartAnim) / .3, 0, 1) * (math.pi / 1.5)) * (self.EndY - self.StartY)) * 1.2

	self:SetPos((ScrW() - self:GetWide()) / 2, self.ActualY)

	self.AlphaMul = ((self.ActualY - self.StartY) / (self.EndY - self.StartY))



	if (self.EndY < 0) then

		self.AlphaMul = 1 - self.AlphaMul

	end



	if (not self.Opening and math.Round(mul) == 1) then

		self:SetVisible(false)

	end

end



--[[---------------------------------------------------------

   Name: PerformLayout

---------------------------------------------------------]]

function PANEL:PerformLayout()

	self:SetSize(math.max(ScrW() * 0.45, 640), ScrH() * 0.85)

	self:SetPos((ScrW() - self:GetWide()) / 2, self.ActualY)

	self.Hostname:SizeToContents()

	self.Hostname:SetPos((self:GetWide() / 2) - (self.Hostname:GetWide() / 2), 5)

	self.Description:SizeToContents()

	self.Description:SetPos((self:GetWide() / 2) - (self.Description:GetWide() / 2), 45)

	self.lblHours:SetText("Онлайн")

	self.lblHours:SizeToContents()

	self.PlayerFrame:SetPos(20, self.Description.y + self.Description:GetTall() + 20)

	self.PlayerFrame:SetSize(self:GetWide() - 40, self:GetTall() - self.PlayerFrame.y - 21)



	if self.lblPing then

		self.lblPing:SizeToContents()

	else

		self.lblPing = ui.Create("DLabel", self)

		self.lblPing:SetText("Пинг")

		self.lblPing:SizeToContents()

	end



	self.lblHours:SizeToContents()

	self.lblTeam:SizeToContents()

	self.lblPing:SetPos(self:GetWide() - 15 - (self.lblPing:GetWide() * 1.5) - 24, self.PlayerFrame.y - self.lblPing:GetTall() - 3)

	self.lblHours:SetPos(self:GetWide() * .75, self.PlayerFrame.y - self.lblPing:GetTall() - 3)

	self.lblTeam:SetPos(self:GetWide() * .5, self.PlayerFrame.y - self.lblPing:GetTall() - 3)

end



--[[---------------------------------------------------------

   Name: ApplySchemeSettings

---------------------------------------------------------]]

function PANEL:ApplySchemeSettings()

	self.Hostname:SetFont("HeaderFont2")

	self.Description:SetFont("suiscoreboardsubtitle")

	self.SuiSc:SetFont("TextFontSmall")

	self.Uptime:SetFont("TextFontSmall")



	if self.lblPing then

		self.lblPing:SetFont("TextFontSmall")

	else

		self.lblPing = ui.Create("DLabel", self)

		self.lblPing:SetText("Пинг")

		self.lblPing:SizeToContents()

		self.lblPing:SetFont("TextFontSmall")

	end



	self.lblTeam:SetFont("TextFontSmall")

	self.lblHours:SetFont("TextFontSmall")

	-- self.Hostname:SetTextColor( tColor )

	self.Hostname:SetTextColor(Color(255,255,0))

	self.Description:SetTextColor(Color(160, 160, 160, 255))

	self.SuiSc:SetTextColor(Color(160,160,160))

	self.Uptime:SetTextColor(Color(160,160,160))

	self.lblPing:SetTextColor(Color(160,160,160))

	self.lblTeam:SetTextColor(Color(160,160,160))

	self.lblHours:SetTextColor(Color(160,160,160))

end



function PANEL:UpdateScoreboard(force)

	if not self or (not force and not self:IsVisible()) then return end



	for k, v in pairs(self.PlayerRows) do

		if not IsValid(k) then

			v:Remove()

			self.PlayerRows[k] = nil

		end

	end



	for id, pl in ipairs(player.GetAll()) do

		if not self:GetPlayerRow(pl) then

			self:AddPlayerRow(pl)

		end

	end



	-- Always invalidate the layout so the order gets updated

	self.PlayerFrame:InvalidateLayout()

	local total_players = 0

	local active_players = 0

	local total_staff = 0

	local active_staff = 0



	for k, v in ipairs(player.GetAll()) do

		total_players = total_players + 1



		if v:IsAdmin() then

			total_staff = total_staff + 1

		end



		if v:Alive() then

			active_players = active_players + 1



			if v:IsAdmin() then

				active_staff = active_staff + 1

			end

		end

	end



	local pOnline = 'Игроков онлайн: ' .. total_players



	if (LocalPlayer():IsAdmin()) then

		pOnline = pOnline .. ' (' .. active_players .. ' активных) | Админов онлайн:' .. total_staff .. ' (' .. active_staff .. ' активных)'

	end



	self.SuiSc:SetText(pOnline )

	self.SuiSc:SizeToContents()

	self.SuiSc:SetPos(self:GetWide() - self.SuiSc:GetWide() - 15, self:GetTall() - 15)

	local hours = math.floor(CurTime() / 3600)

	local minutes = math.floor((CurTime() % 3600) / 60)

	local seconds = math.floor(CurTime() - (hours * 3600) - (minutes * 60))



	if (minutes < 10) then

		minutes = "0" .. minutes

	end



	if (seconds < 10) then

		seconds = "0" .. seconds

	end



	self.Uptime:SetText("Онлайн сервера: " .. hours .. ":" .. minutes .. ":" .. seconds)

	self.Uptime:SizeToContents()

	self.Uptime:SetPos(15, self:GetTall() - 15)

end



vgui.Register("suiscoreboard", PANEL, "EditablePanel")