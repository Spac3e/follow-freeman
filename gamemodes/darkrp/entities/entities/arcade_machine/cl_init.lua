include('shared.lua')


local color_bg = Color(20,20,20)
local color_text = Color(255,0,0)

local x = 128
local y = 95

function ENT:Draw() 
	self:DrawModel()

	local Ang = self:GetAngles()
	Ang:RotateAroundAxis(Ang:Forward(), 90)
	Ang:RotateAroundAxis(Ang:Right(), -90)

	cam.Start3D2D(self:GetPos() + Ang:Forward() * -13 + Ang:Right() * -68.5 + Ang:Up() * 20.3, Ang, 0.2)
		draw.RoundedBox(2, -5, -10, x + 20, y + 20, color_bg)
		draw.SimpleText('Press \'E\' to Play!', 'rp.ui.20', 2, 35, color_text)
	cam.End3D2D()
end

local fr
net.Receive('rp.ArcadeMenu', function()
	local ent = net.ReadEntity()

	if IsValid(fr) then fr:ExitGame() end

	fr = ui.Create('DFrame', function(self)
		self:SetTitle('')
		self:SetPos(0, 22)
		self:SetSize(ScrW(), ScrH() - 22)
		self:MakePopup()
		self.btnClose:SetVisible(false)
		self.Paint = function(self, w, h)
			draw.Box(0, 0, w, h, color_bg)
			draw.SimpleText('Loading...', 'rp.ui.22', w/2, h/2, color_text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		self.ExitGame = function(self)
			self:Close()
		end
	end)

	hook.Add('Think', fr, function()
		if (ent:GetPos():Distance(LocalPlayer():GetPos()) > 80) then
			fr:ExitGame()
		end

		if input.IsKeyDown(KEY_ESCAPE) and gui.IsGameUIVisible() then
			gui.HideGameUI()
		end
	end)

	local html = ui.Create('DHTML', function(self, p)
		self:SetPos(0, 0)
		self:SetSize(p:GetWide(), p:GetTall())
		self:OpenURL(ent:GetGame())
		self.ConsoleMessage = function() end
	end, fr)
	
	ui.Create('DButton', function(self, p)
		self:SetSize(100, 40)
		self:SetPos(0, 0)
		self:SetTextColor(Color(0,0,0))
		self:SetFont('rp.ui.22')
		self:SetText('EXIT GAME')
		self.DoClick = function()
			fr:ExitGame()
		end
		self.Paint = function(self, w, h)
			draw.Box(0, 0, w, h, color_text)
		end
	end, html)
end)