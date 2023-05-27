ba.AddTerm('ScreengrabStarted', 'Снимок экрана # сделан, началась передача, подождите 20 секунд.')

if SERVER then
	util.AddNetworkString('sg.request');
	util.AddNetworkString('sg.upload');
	util.AddNetworkString('sg.pushToAdmin');
end

local blocksize = 32768

local function receiveStream(callback)
	local streams = {};
	return function()
		local txnid = net.ReadUInt(16)
		if streams[txnid] then
			local b = streams[txnid]
			local size = net.ReadUInt(16)
			local data = net.ReadData(size)
			b[#b+1] = data

			if #b == b.len then
				b.len = nil
				streams[txnid] = nil;
				callback(txnid, table.concat(b))
			end
		else
			streams[txnid] = {}
			streams[txnid].len = net.ReadUInt(32)
		end
	end
end

local function writeStream(msgid, txnid, data, targs)
	local send
	if CLIENT then
		send = net.SendToServer
	else
		send = function() net.Send(targs) end
	end

	net.Start(msgid);
		net.WriteUInt(txnid, 16);
		net.WriteUInt(math.ceil(string.len(data)/blocksize), 32)
	send()

	for i = 1, math.ceil(string.len(data)/blocksize) do
		local window = i * blocksize
		timer.Simple(i * 0.1, function()
			local block = data:sub(window - blocksize + 1, window)
			local size = block:len()
			net.Start(msgid)
				net.WriteUInt(txnid, 16)
				net.WriteUInt(size, 16)
				net.WriteData(block, size)
			send()
		end)
	end
end

local screengrabs = {}
local uniqueid = 0

-------------------------------------------------
-- Screengrab
-------------------------------------------------
ba.cmd.Create('SG', function(pl, args)
	net.Start('ba.cmd.sg.request')
		net.WriteUInt(uniqueid, 16)
		screengrabs[uniqueid] = pl
		uniqueid = (uniqueid + 1) % 0xFFFF
	net.Send(args.target)

	ba.notify(pl, ba.Term('ScreengrabStarted'), args.target)
end)
:AddParam('player_entity', 'target')
:SetFlag('A')
:SetHelp('Shows you your targets screen')
:SetIcon('icon16/eye.png')


if SERVER then
	util.AddNetworkString('ba.cmd.sg.request');
	util.AddNetworkString('ba.cmd.sg.display');
	util.AddNetworkString('ba.cmd.sg.upload');

	net.Receive('ba.cmd.sg.upload', function(_, pl)
		local txnid = net.ReadUInt(16)
		if not screengrabs[txnid] then return end
		
		net.ReadStream(pl, function(data)
			net.Start('ba.cmd.sg.display')
				net.WriteEntity(pl)
				net.WriteStream(data, screengrabs[txnid])
			net.Send(screengrabs[txnid])
		end)
	end)
else
	local rc = render.Capture

	net.Receive('ba.cmd.sg.request', function()
		local txnid = net.ReadUInt(16)

		-- capture
		local data = rc({
			format = 'jpeg',
			h = ScrH(),
			w = ScrW(),
			quality = 15,
			x = 0,
			y = 0
		})

		net.Start('ba.cmd.sg.upload')
			net.WriteUInt(txnid, 16)
			net.WriteStream(data)
		net.SendToServer()
	end)

	net.Receive('ba.cmd.sg.display', function()
		local pl = net.ReadEntity()
		net.ReadStream(function(data)
			local w, h = ScrW() *.95, ScrH() *.95

			local fr = ui.Create('ui_frame', function(self)
				self:SetSize(w, h)
				self:MakePopup()
				self:Center()
				self:SetTitle('Screen Capture: ' .. pl:NameID())
			end)
			
			ui.Create('DHTML', function(self)
				self:SetPos(-5, 23)
				self:MoveToBack()
				self:SetSize(w + 5, 10000)
				self:SetHTML(string.format([[
					<center>
					<img src='data:image/jpeg; base64, %s' alt='ERROR' height='%d' width='%d' />
					</center>]], util.Base64Encode(data), h - 32, w - 5))
			end, fr)
		end)
	end)
end
