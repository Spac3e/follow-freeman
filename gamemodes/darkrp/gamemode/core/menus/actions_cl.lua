
-----------------------------------------------------
local menus = {
	{
		Name = 'Жесты',
		DoClick = function(p)
			local m = ui.DermaMenu(p)

			for k, v in ipairs({'cheer', 'laugh', 'muscle', 'zombie', 'robot', 'dance', 'agree', 'becon', 'disagree', 'salute', 'wave', 'forward', 'pers'}) do
				m:AddOption(v, function()
					RunConsoleCommand('act', v)
				end)
			end

			m:Open()
		end
	},
	--{
	--	Name = 'Насрать',
	--	DoClick = function(p)
	--		rp.RunCommand('poop')
	--	end
	--},
	{
		Name = 'Умереть',
		DoClick = function(p)
			RunConsoleCommand('kill')
		end
	},
	{
		Name = 'Чаты',
		DoClick = function(p)
			RunConsoleCommand('rp_chats')
		end
	}
}

hook('ContextMenuCreated', function(cont)
	local fr = ui.Create('ui_frame', function(self, p)
		self:SetPos(5, ScrH() / 2 - self:GetTall() / 2)
		self:ShowCloseButton(false)
		self:SetTitle('Действия')
	end, cont)

	local x, y = fr:GetDockPos() -- TODO: FIX
	local c = 0

	for k, v in ipairs(menus) do
		fr:SetSize(100, ((c + 1) * 29) + y + 5)
		fr:SetPos(5, ScrH() / 2 - fr:GetTall() / 2)

		ui.Create('DButton', function(self)
			self:SetPos(5, (c * 29) + y)
			self:SetSize(100 - 10, 30)
			self:SetText(v.Name)
			self.DoClick = v.DoClick
		end, fr)

		c = c + 1
	end
end)