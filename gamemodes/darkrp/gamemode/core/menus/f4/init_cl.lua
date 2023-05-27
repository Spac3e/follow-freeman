
-----------------------------------------------------
local fr

function GM:ShowSpare2()
	if IsValid(fr) then
		fr:SetVisible(false)
	end

	local w, h = ScrW() * 0.75, ScrH() * 0.7

	fr = ui.Create('ui_frame', function(self)
		self:SetTitle('Меню Сервера')
		self:SetSize(w, h)
		self:MakePopup()
		self:Center()
		local keydown = false

		function self:Think()
			if input.IsKeyDown(KEY_F4) and keydown then
				self:Close()
			elseif (not input.IsKeyDown(KEY_F4)) then
				keydown = true
			end
		end
	end)

	local tabs = ui.Create('ui_tablist', fr)
	tabs:DockToFrame()
	-- Commands
	tabs:AddTab('Действия', ui.Create('rp_commandlist'), true)
	-- Jobs
	--tabs:AddTab('Профессии', ui.Create('rp_jobslist'))
	-- Shop
	tabs:AddTab('Магазин', ui.Create('rp_shoplist'))
	hook.Call('PopulateF4Tabs', GAMEMODE, tabs, fr) -- todo, remove
	-- Settings
	local s = ui.Create('ui_settingspanel')
	s:SetState('All')
	s:SetSize(fr:GetWide() - 165, fr:GetTall() - 35)
	tabs:AddTab('Настройки', s)


	tabs:AddButton('Справочник', function()
		fr:Close()
		LocalPlayer():ConCommand('say /rules')
	end)

	if rp.Discount == 1 then
		tabs:AddButton('Донат', function()
			fr:Close()
			rp.RunCommand('upgrades')
		end)
	else
		tabs:AddButton('Донат (-' .. (1 - rp.Discount)* 100 ..'%)', function()
			fr:Close()
			rp.RunCommand('upgrades')
		end)
	end

end