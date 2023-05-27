
-----------------------------------------------------
local function ClientDoVoice(id)
	net.Start('rp.DoVoice')
		net.WriteInt(id, 8)
	net.SendToServer()
end

chatsound_fr = chatsound_fr or nil
chatsound_scroll = chatsound_scroll or nil
local cur_team = cur_team or nil
local c = c or 0
buttons = buttons or {}

hook('ContextMenuCreated', function(cont)
	chatsound_fr = ui.Create('ui_frame', function(self, p)
		self:SetPos(ScrW() - self:GetWide() - 5 , ScrH() / 2 - self:GetTall() / 2)
		self:ShowCloseButton(false)
		self:SetTitle("Речь")
		self:SetSize(150, ScrH() * 0.8)
		self:SetPos(ScrW() - self:GetWide() - 5, ScrH() / 2 - self:GetTall() / 2)
	end, cont)

	chatsound_scroll = ui.Create('ui_scrollpanel', function(self)
		self:DockMargin(0, 3, 0, 0)
		self:Dock(FILL)
	end, chatsound_fr)
	c = 0

end)

hook('OnContextMenuOpen', function()
	if cur_team != LocalPlayer():Team() and IsValid(chatsound_fr) and IsValid(chatsound_scroll) then
	
		for k,v in pairs(buttons) do
			v:Remove()
		end
		
		c = 0
		cur_team = LocalPlayer():Team()
		
		for k, v in ipairs(rp.Voices[cur_team] || rp.Voices[0]) do

			buttons[c] = ui.Create('DButton', function(self)
				self:SetSize(90, 30)
				self:SetText(v.label)
				self.DoClick = function() ClientDoVoice(k) end
				chatsound_scroll:AddItem(self)
				--	print(v.label)
				if v.broadcast then
				--	print(1)
					self:SetBackgroundColor(Color(200, 0, 0))
				end
			end)

			c = c + 1
		end
	end
end)
