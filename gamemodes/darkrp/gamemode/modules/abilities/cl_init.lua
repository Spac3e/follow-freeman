
-----------------------------------------------------
cvar.Register'enable_ability':SetDefault(true):AddMetadata('State', 'RPMenu'):AddMetadata('Menu', 'Включить уведомление о доступных бонусах при заходе')

local PANEL = {}

function PANEL:Init()
	self:SetText('')
	self:SetTall(50)
	self.Model = ui.Create('rp_modelicon', self)

	self.Model.DoClick = function(s)
		s.DoClick(self)
	end
end

function PANEL:Paint(w, h)
	draw.OutlinedBox(0, 0, w, h, self.ability.color, ui.col.Outline)

	if self:IsHovered() then
		draw.OutlinedBox(0, 0, w, h, self.ability.color, ui.col.Hover)
	end

	local x = 60

	if self.ability:IsVIP() then
		x = x + draw.SimpleTextOutlined('[VIP]', 'rp.ui.22', x, h * 0.5, ui.col.Orange, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, ui.col.Black) + 5
	end

	draw.SimpleTextOutlined(self.ability:GetName(), 'rp.ui.22', x, h * 0.5, ui.col.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, ui.col.Black)

	if self.ability:GetPlayTime(LocalPlayer()) > LocalPlayer():GetPlayTime() then
		draw.SimpleTextOutlined(ba.str.FormatTime(self.ability:GetPlayTime(LocalPlayer())-LocalPlayer():GetPlayTime()), 'rp.ui.22', w - 10, h * 0.5, ui.col.White, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, ui.col.Black)
	elseif self.ability:InCooldown(LocalPlayer()) then
		draw.SimpleTextOutlined(ba.str.FormatTime(self.ability:GetRemainingCooldown(LocalPlayer())), 'rp.ui.22', w - 10, h * 0.5, ui.col.White, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, ui.col.Black)
	end
end

function PANEL:PerformLayout()
	self.Model:SetPos(0, 0)
	self.Model:SetSize(50, 50)
end

function PANEL:DoClick()
	self.Parent.ability = self.ability
	self.Parent.btnPurchase.ability = self.ability

	self.Parent.btnPurchase:SetDisabled(false)
	self.Parent.btnPurchase:SetText("Использовать бонус")

	if self.ability:InCooldown(LocalPlayer()) then
		self.Parent.btnPurchase:SetDisabled(true)
		self.Parent.btnPurchase:SetText("Бонус перезаряжается")
	end

	if self.ability:GetPlayTime(LocalPlayer()) > LocalPlayer():GetPlayTime() then
		self.Parent.btnPurchase:SetDisabled(true)
		self.Parent.btnPurchase:SetText("Отыграно недостаточно времени")
	end

	if self.ability:IsVIP() && !LocalPlayer():IsVIP() then
		self.Parent.btnPurchase:SetDisabled(true)
		self.Parent.btnPurchase:SetText("Бонус доступен только для VIP")
	end

	self.Parent.btnPurchase.DoClick = function(s)
		net.Start('AbilityUse')
			net.WriteInt(self.ability:GetID(), 6)
		net.SendToServer()
		self.Parent.btnPurchase:SetDisabled(true)
		self.Parent.btnPurchase:SetText("Бонус перезаряжается")
	end
end

function PANEL:SetAbility(ability)
	self.ability = ability
	self.ability.color = Color(ability:GetColor().r, ability:GetColor().g, ability:GetColor().b, 125)
	self.Model:SetModel(ability:GetModel())
end

vgui.Register('rp_ability', PANEL, 'Button')

PANEL = {}

function PANEL:Init()
	self:BaseInit()
	
	for k, v in ipairs(rp.abilities.list) do
		local btn = ui.Create('rp_ability')
		btn:SetAbility(v)
		btn.Parent = self
		self.AbilitiesList:AddItem(btn)
	end
end

function PANEL:BaseInit()
	self.ability = rp.abilities.Get(1)
	self.AbilitiesList = ui.Create('ui_scrollpanel', self)

	self.InfoPanel = ui.Create('ui_scrollpanel', self)

	self.btnPurchase = ui.Create("DButton", function(self)
		self:SetText("Использовать способность")
		self:SetSize(0, 25)
		self:DockMargin(5, 5, 5, 5)
		self:Dock(BOTTOM)
	end, self.InfoPanel)
	
	self.Info = ui.Create('ui_panel', self.InfoPanel)
	self.Info.Paint = function(s, w, h)
		if self.last != self.ability:GetID() then
			self.last = self.ability:GetID()
			self.text = string.Wrap('rp.ui.20', self.ability:GetDescription(), w - 10)
			s:SetTall(#self.text * 30 + 50)
			self.InfoPanel:ScrollTo(0)
		end
		draw.OutlinedBox(0, 0, w, 50, self.ability:GetColor(), ui.col.Outline)
		draw.SimpleTextOutlined(self.ability:GetName(), 'rp.ui.24', w * 0.5, 25, ui.col.White, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, ui.col.Black)
	
		for k, v in ipairs(self.text) do
			draw.SimpleTextOutlined(v, 'rp.ui.20', 5, 35 + (k * 26), ui.col.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, ui.col.Black)
		end
	end
	self.InfoPanel:AddItem(self.Info)
end

function PANEL:PerformLayout()
	self.AbilitiesList:SetPos(5, 5)
	self.AbilitiesList:SetSize(self:GetWide() * 0.5 - 7.5, self:GetTall() - 10)
	self.AbilitiesList:SetSpacing(1)
	self.InfoPanel:SetPos(self:GetWide() * 0.5 + 2.5, 5)
	self.InfoPanel:SetSize(self:GetWide() * 0.5 - 7.5, self:GetTall() - 10)
	self.InfoPanel:SetSpacing(1)
end

vgui.Register('rp_abilitieslist', PANEL, 'Panel')

hook.Add('PopulateF4Tabs',function(tabs) tabs:AddTab('Бонусы', ui.Create('rp_abilitieslist')) end)

hook.Add('AbilitiesCooldownReceived', 'first', function()
	if !cvar.GetValue('enable_ability') then return end
	hook.Remove('AbilitiesCooldownReceived', 'first')
	timer.Simple(15, function()
	local count = 0
	for k, v in pairs(rp.abilities.list) do
		if v:GetPlayTime(LocalPlayer()) < LocalPlayer():GetPlayTime() && !v:InCooldown(LocalPlayer()) then
			count = count + 1
		end
	end
	if count == 0 then return end
	local fr = ui.Create('ui_frame', function(self)
		self:SetSize(520, 90)
		self:SetTitle(count.. ' неактивированных бонуса')
		self:MakePopup()
		self:Center()
		self:RequestFocus()
	end)

	ui.Create('DLabel', function(self, p) 
		self:SetText('Вам доступны '..count..' бонуса!')
		self:SetFont('ba.ui.24')
		self:SetTextColor(ui.col.Close)
		self:SizeToContents()
		self:SetPos((p:GetWide() - self:GetWide()) / 2, 32)
	end, fr)

	ui.Create('DButton', function(self, p)
		self:SetText('Хорошо')
		self:SetPos(5, 60)
		self:SetSize(p:GetWide()/2 - 7.5, 25)
		function self:DoClick()
			local fr = ui.Create('ui_frame', function(self, p)
				self:SetSize(ScrW() * 0.65, ScrH() * 0.6)
				self:SetTitle('Бонусы')
				self:Center()
				self:MakePopup()
			end)

			ui.Create('rp_abilitieslist', function(self, p)
				self:SetPos(5, 25)
				self:SetSize(p:GetWide() - 10, p:GetTall() - 30)
			end, fr)
			p:Close()
		end
	end, fr)

	ui.Create('DButton', function(self, p)
		self:SetText('Нет, спасибо')
		self:SetPos(p:GetWide()/2 + 2.5, 60)
		self:SetSize(p:GetWide()/2 - 7.5, 25)
		function self:DoClick()
			chat.AddText('Если передумаешь - бонусы ждут тебя в F4 меню, в разделе Бонусы.')
			p:Close()
		end
	end, fr)
	end)
end)