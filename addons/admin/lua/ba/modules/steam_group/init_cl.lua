ba.steamGroup = {}

ba.steamGroup.handler = 'https://urf.im/scp/steamgrouphandler.php'
ba.steamGroup.url = 'http://steamcommunity.com/groups/urfimofficial'
ba.steamGroup.vkUrl = 'https://vk.com/roleplayscp'

function ba.steamGroup.check()
	timer.Simple(20, function()
		http.Fetch(ba.steamGroup.handler..'?steamid=' .. LocalPlayer():SteamID64(), function(body)
			if (body == '1') then
				chat.AddText('Вы не вступили в нашу группу или ваш профиль Steam приватный! Напишите !steam, чтобы попробовать ещё раз.')
			elseif (body == '0') then
				RunConsoleCommand('sgr', 'request')
			end
		end)
	end)
end

function ba.steamGroup.checkVK()
	timer.Simple(20, function()
		RunConsoleCommand('sgr', 'vk')
	end)
end

function ba.steamGroup.OpenVKMenu()
	local fr = ui.Create('ui_frame', function(self)
		self:SetSize(520, 90)
		self:SetTitle('Вступить в нашу группу')
		self:MakePopup()
		self:Center()
		self:RequestFocus()
	end)

	ui.Create('DLabel', function(self, p) 
		self:SetText('Вступи в нашу группу ВК и получи т.1000!')
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
			gui.OpenURL(ba.steamGroup.vkUrl)
			ba.steamGroup.checkVK()
			p:Close()
		end
	end, fr)

	ui.Create('DButton', function(self, p)
		self:SetText('Нет, спасибо')
		self:SetPos(p:GetWide()/2 + 2.5, 60)
		self:SetSize(p:GetWide()/2 - 7.5, 25)
		function self:DoClick()
			p:Close()
			RunConsoleCommand('sgr', 'delay')
			chat.AddText('Если передумаешь - напиши !vk в чат.')
		end
	end, fr)
end


function ba.steamGroup.OpenMenu()
	local fr = ui.Create('ui_frame', function(self)
		self:SetSize(520, 90)
		self:SetTitle('Вступить в нашу группу')
		self:MakePopup()
		self:Center()
		self:RequestFocus()
	end)

	ui.Create('DLabel', function(self, p) 
		self:SetText('Встпуи в нашу группу и получи 30 кредитов!')
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
			gui.OpenURL(ba.steamGroup.url)
			ba.steamGroup.check()
			p:Close()
		end
	end, fr)

	ui.Create('DButton', function(self, p)
		self:SetText('Нет, спасибо')
		self:SetPos(p:GetWide()/2 + 2.5, 60)
		self:SetSize(p:GetWide()/2 - 7.5, 25)
		function self:DoClick()
			p:Close()
			RunConsoleCommand('sgr', 'delay')
			chat.AddText('Если передумаешь - напиши !steam в чат.')
		end
	end, fr)
end

local function Request()
	timer.Simple(30, function()
		http.Fetch(ba.steamGroup.handler..'?steamid=' .. LocalPlayer():SteamID64(), function(body, len, headers, code)
			if (body == '1') then
				ba.steamGroup.OpenMenu()
			elseif (body == '0') then
				RunConsoleCommand('sgr', 'request')
			elseif (body == '3') then
				ba.steamGroup.OpenVKMenu()
			end
		end, Request)
	end)
end

hook.Add('InitPostEntity', function()
	Request()
end)