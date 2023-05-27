ba.AddTerm('StaffReqSent', 'Жалоба отправлена!')
ba.AddTerm('StaffReqPend', 'У вас уже есть активная Жалоба!')
ba.AddTerm('StaffReqLonger', 'Пожалуйста опишите причину (<10+ букв)!')
ba.AddTerm('AdminTookPlayersRequest', '# ответил на Жалобу #.')
ba.AddTerm('AdminTookYourRequest', '# откликнулся на вашу жалобу и скоро с вами свяжется.')
ba.AddTerm('AdminClosedPlayersRequest', '# отклонил Жалобу #(а)')
ba.AddTerm('AdminClosedYourRequest', '# отклонил вашу Жалобу.')

if (SERVER) then
	util.AddNetworkString 'ba.AdminChat'
	util.AddNetworkString 'ba.AdminChatDelayed'
	util.AddNetworkString 'ba.GetStaffRequest'
	util.AddNetworkString 'ba.PurgeStaffRequests'
	
	function PLAYER:HasStaffRequest()
		return (self:GetBVar('StaffRequest') and (CurTime() - self:GetBVar('StaffRequestTime') < 600))
	end

	hook.Add('PlayerSay', 'ba.AdminChat', function(pl, text)
		if (text[1] == '@') then
			if (hook.Call('PlayerCanUseAdminChat', ba, pl) ~= false) then
				text = text:sub(2):Trim()
				
				if pl:HasStaffRequest() then
					ba.notify_err(pl, ba.Term('StaffReqPend'))
				elseif (not pl:IsAdmin() and text:len() < 10) then
					ba.notify_err(pl, ba.Term('StaffReqLonger'))
				else
					net.Start('ba.AdminChat')
						net.WriteEntity(pl)
						net.WriteString(pl:SteamID())
						net.WriteString(text)
						net.WriteFloat(CurTime())
					net.Send(ba.GetStaff())
					
					if (not pl:IsAdmin()) then
						ba.notify(pl, ba.Term('StaffReqSent'))
						pl:SetBVar('StaffRequest', true)
						pl:SetBVar('StaffRequestReason', text)
						pl:SetBVar('StaffRequestTime', CurTime())
						
						hook.Call("PlayerSitRequestOpened", GAMEMODE, pl, text)
					end
				end
				
				return ''
			end
		end
	end)
	
	hook.Add('playerRankLoaded', 'ba.NetworkRequests', function(pl)
		if (!pl:IsAdmin()) then return end
		
		for k, v in ipairs(player.GetAll()) do
			if (v:HasStaffRequest()) then
				net.Start('ba.AdminChatDelayed')
					net.WriteUInt(v:EntIndex(), 8)
				net.Send(pl)
			end
		end
	end)
	
	hook.Add('PlayerDisconnected', 'ba.PurgeStaffRequests', function(pl)
		if (pl:HasStaffRequest()) then
			net.Start('ba.PurgeStaffRequests')
				net.WriteString(pl:SteamID())
			net.Send(ba.GetStaff())
		end
	end)
	
	net.Receive('ba.GetStaffRequest', function(len, pl)
		local targ = net.ReadEntity()
		
		if (!IsValid(targ) or !pl:IsAdmin() or !targ:HasStaffRequest()) then return end
		
		net.Start('ba.AdminChat')
			net.WriteEntity(targ)
			net.WriteString(targ:SteamID())
			net.WriteString(targ:GetBVar('StaffRequestReason'))
			net.WriteFloat(targ:GetBVar('StaffRequestTime'))
		net.Send(pl)
	end)
else
	cvar.Register 'AdminChatSound'
		:SetDefault(true)
		:AddMetadata('BAMenu', 'Включить звуковое оповещение')
		
	local color_white = Color(235,235, 235)
	local fr
	local PANEL = {}
	function PANEL:Init()
		local w, h = chat.GetChatBoxSize()
		local x, y = chat.GetChatBoxPos()
		h = h * .75
		y = y - (h + 5)
		
		self.w, self.h = w * .5, h
		self.h3 = self.h * 1.5

		self.Requests = {}
		self.Visible = true

		self.btnMaxim:Remove()
		self.btnMinim:Remove()
		self.btnClose:Remove()
		
		self.lblTitle:SetText('Жалобы:')
		
		self.PlayerList = ui.Create('ui_scrollpanel', self)
		self.PlayerList:SetPadding(-1)

		self:SetSkin('bAdmin')
		self:SetDraggable(true)

		self:SetSize(self.w, self.h)
		self:SetPos(x, y)
	end

	function PANEL:PerformLayout()
		self.lblTitle:SizeToContents()
		self.lblTitle:SetPos(5, 4)

		self.PlayerList:SetPos(5, 32)
		self.PlayerList:SetSize(self.w - 10, self.h - 37)
	end

	function PANEL:ApplySchemeSettings()
		self.lblTitle:SetTextColor(ui.col.Close)
		self.lblTitle:SetFont('ba.ui.22')
	end

	function PANEL:SetStage(state)
		if (state == 1) then
			self:SizeTo(self.w, self.h, 0.175, 0, 0.25, cback)
		elseif (state == 2) then
			self:SizeTo(self.w * 2, self.h, 0.175, 0, 0.25, cback)
		else
			self:SizeTo(self.w * 2, self.h3, 0.175, 0, 0.25)
		end
	end

	function PANEL:AddRequest(pl, msg, startTime)
		local pnl = ui.Create('ba_menu_player')
		pnl.SteamID = pl:SteamID()
		pnl:SetPlayer(pl)
		pnl:SetStartTime(startTime)
		pnl.Checkbox.DoClick = function()
			if (self.Player ~= pnl) then
				if (self.Player ~= nil and IsValid(self.Player)) then
					self.Player.Selected = false
				end
				self.Player = pnl
				pnl.Selected = true
				self:SetStage(2)
				self:OpenRequest(pnl.ID)
			else
				self.Player = nil
				pnl.Selected = false
				self:SetStage(1)
			end
			self.ID = pnl.ID
		end
		pnl.OT = pnl.Think
		pnl.Think = function(s)
			if (not self.Requests[s.ID]) or (CurTime() - startTime >= 600) then
				self:RemoveRequest(s.ID)
				return
			end
			
			s:OT()
		end
		self.PlayerList:AddItem(pnl)
		pnl.ID = #self.Requests + 1
		pnl.Message = msg
		self.Requests[pnl.ID] = pnl
	end

	function PANEL:RemoveRequest(id)
		self.Requests[id]:Remove()
		table.remove(self.Requests, id)
		self.Player = nil
		if (self.ID == id) then
			self:SetStage(1)
		end
		
		for k, v in ipairs(self.Requests) do
			v.ID = k
		end
	end

	function PANEL:OpenRequest(id)
		if IsValid(self.CurRequest) then self.CurRequest:Remove() end

		local pnl = self.Requests[id]

		self.CurRequest = ui.Create('ui_panel', function(s, p)
			s:SetPos(self.w, 32)
			s:SetSize(self.w - 5, self.h - 37)
		end, self)
		ui.Create('DButton', function(s, p)
			s:SetPos(5, 5)
			s:SetSize(p:GetWide() * .5 - 7.5, 25)
			s:SetText('Ответить')
			s.DoClick = function()
				if (IsValid(pnl.Player)) then
					RunConsoleCommand('ba', 'Treq', pnl.Player:SteamID())
				end
			end
		end, self.CurRequest)
		ui.Create('DButton', function(s, p)
			s:SetPos(p:GetWide() * .5 + 2.5, 5)
			s:SetSize(p:GetWide() * .5 - 7.5, 25)
			s:SetText('Закрыть')
			s.DoClick = function()
				if (IsValid(pnl.Player)) then
					RunConsoleCommand('ba', 'Rreq', pnl.Player:SteamID())
				end
			end
		end, self.CurRequest)

		ui.Create('DButton', function(s, p)
			s:SetPos(5, 35)
			s:SetSize(p:GetWide() - 10, 25)
			s:SetText('Копировать SteamID')
			s.DoClick = function()
				SetClipboardText(pnl.Player:SteamID())
				LocalPlayer():ChatPrint('Скопировано!')
			end
		end, self.CurRequest)

		local l = ba.ui.Label(pnl.Message, self.CurRequest, {font = 'ba.ui.22', color = ui.col.Close, wrap = true})
		l:SetSize(pnl:GetWide() - 10, pnl:GetTall() - 70)
		l:SetPos(5, 65)
	end
	vgui.Register('ba_adminchat', PANEL, 'DFrame')

	local staffRequestQueue = {}
	hook.Add('Think', 'AdminChat.Think', function()
		if IsValid(fr) then
			if (#fr.Requests <= 0) and fr.Visible then
				fr.Visible = false
				fr:SetVisible(fr.Visible)
			elseif (#fr.Requests > 0) and (not fr.Visible) then
				fr.Visible = true
				fr:SetVisible(fr.Visible)
			end
		end
		
		for k, v in ipairs(staffRequestQueue) do
			local pl
			if (type(v) == 'string') then
				pl = ba.FindPlayer(v)
			else
				pl = ents.GetByIndex(v)
			end
			
			if (IsValid(pl)) then
				net.Start('ba.GetStaffRequest')
					net.WriteEntity(pl)
				net.SendToServer()
			
				table.remove(staffRequestQueue, k)
				
				return
			end
		end
	end)
	
	net.Receive('ba.PurgeStaffRequests', function()
		if (!IsValid(fr)) then return end
		
		local stid = net.ReadString()
		for k, v in ipairs(fr.Requests) do
			if (v.SteamID == stid) then
				fr:RemoveRequest(k)
			end
		end
	end)

	net.Receive('ba.AdminChat', function()
		fr = fr or ui.Create('ba_adminchat')
		local pl = net.ReadEntity()
		local stid = net.ReadString()
		if IsValid(pl) then
			if (pl:IsAdmin()) then
				local msg = net.ReadString()
				
				if (IsValid(CHATBOX)) then CHATBOX.DoEmotes = pl:IsVIP() end
				chat.AddText(Color(255,100,100), '| ', ui.col.SUP, '[Админ Чат] ', pl, color_white, ': ', msg)
				hook.Call("PlayerUseAdminChat", GAMEMODE, pl, msg)
			elseif IsValid(fr) then
				fr:AddRequest(pl, net.ReadString(), net.ReadFloat())

				if (not pl:IsAdmin()) and cvar.GetValue('AdminChatSound') then
					surface.PlaySound('funmania/req.wav')
				end
			end
		else
			table.insert(staffRequestQueue, stid)
		end
	end)
	
	net.Receive('ba.AdminChatDelayed', function()
		table.insert(staffRequestQueue, net.ReadUInt(8))
	end)
	
	concommand.Add('adr', function(pl, cmd, args)
		fr = fr or ui.Create('ba_adminchat')
		fr:AddRequest(pl, table.concat(args, ' '), CurTime())
	end)
	
	concommand.Add('rer', function(pl, cmd, args)
		fr = fr or ui.Create('ba_adminchat')
		local id = tonumber(args[1] or 0)
		
		if (!fr.Requests[id]) then return end
		
		fr:RemoveRequest(id)
	end)
end

ba.cmd.Create('Treq', function(pl, args)
	if args.target:HasStaffRequest() then
		net.Start 'ba.PurgeStaffRequests'
			net.WriteString(args.target:SteamID())
		net.Send(ba.GetStaff())
		ba.notify_staff(ba.Term('AdminTookPlayersRequest'), pl, args.target)
		ba.notify(args.target, ba.Term('AdminTookYourRequest'), pl)
		args.target:SetBVar('StaffRequest', nil)
		args.target:SetBVar('StaffRequestReason', nil)
		args.target:SetBVar('StaffRequestTime', nil)
		
		hook.Call("PlayerSitRequestTaken", GAMEMODE, args.target, pl)
	end
end)
:AddParam('player_entity', 'target')
:SetFlag('M')
:SetHelp('Takes an admin rquest')


ba.cmd.Create('Rreq', function(pl, args)
	if args.target:HasStaffRequest() then
		net.Start 'ba.PurgeStaffRequests'
			net.WriteString(args.target:SteamID())
		net.Send(ba.GetStaff())
		ba.notify_staff(ba.Term('AdminClosedPlayersRequest'), pl, args.target)
		ba.notify(args.target, ba.Term('AdminClosedYourRequest'), pl)
		args.target:SetBVar('StaffRequest', nil)
		args.target:SetBVar('StaffRequestReason', nil)
		args.target:SetBVar('StaffRequestTime', nil)
		
		hook.Call("PlayerSitRequestClosed", GAMEMODE, args.target, pl)
	end
end)
:AddParam('player_entity', 'target')
:SetFlag('M')
:SetHelp('Removes an admin rquest')