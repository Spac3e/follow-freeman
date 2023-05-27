include('shared.lua')
local LocalPlayer = LocalPlayer
local Color = Color
local cam = cam
local draw = draw
local Angle = Angle
local Vector = Vector
local color_white = Color(255, 255, 255)
local color_black = Color(0, 0, 0)

function ENT:Draw()
	self:DrawModel()
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local mypos = LocalPlayer():GetPos()
	local dist = pos:Distance(mypos)
	if dist > 350 or (mypos - mypos):DotProduct(LocalPlayer():GetAimVector()) < 0 then return end
	local owner = IsValid(self:Getowning_ent()) and self:Getowning_ent():Name() or 'unknown'
	color_white.a = 350 - dist
	color_black.a = 350 - dist
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 76.5)
	cam.Start3D2D(pos + (ang:Right() * -20) + (ang:Up() * -14.51), ang, 0.0225)
	draw.SimpleTextOutlined(owner, '3d2d', 0, -80, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)
	draw.SimpleTextOutlined('Пожертвования: $' .. self:Getmoney(), '3d2d', 0, -80, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, color_black)
	cam.End3D2D()
end


net.Receive('rp.OpenDonateWindow', function()
	ui.StringRequest('Пожертвование', 'Сколько вы хотите пожертвовать?', '', function(a)
		rp.RunCommand('donate', tostring(a))
	end)
end)