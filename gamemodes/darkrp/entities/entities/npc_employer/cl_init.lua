
-----------------------------------------------------
include('shared.lua')

local ipairs = ipairs

local CurTime = CurTime

local LocalPlayer = LocalPlayer

local math_sin = math.sin

local math_pi = math.pi

local cam_Start3D2D = cam.Start3D2D

local cam_End3D2D = cam.End3D2D

local draw_SimpleTextOutlined = draw.SimpleTextOutlined

local ents_FindByClass = ents.FindByClass

local vec = Vector(0, 0, 82)

local color_white = Color(255, 255, 255)

local color_black = Color(0, 0, 0)



local function Draw(self)

	local pos = self:GetPos()

	local ang = self:GetAngles()

	local dist = pos:Distance(LocalPlayer():GetPos())

	if (dist > 350) then return end
    
	local t = rp.Factions[self:GetNWInt("Faction",1)].printName

	color_white.a = 350 - dist

	color_black.a = 350 - dist

	ang:RotateAroundAxis(ang:Forward(), 90)

	ang:RotateAroundAxis(ang:Right(), -90)

	ang:RotateAroundAxis(ang:Right(), math_sin(CurTime() * math_pi) * -45)

	cam_Start3D2D(pos + vec + ang:Right() * 1.2, ang, 0.065)

	draw_SimpleTextOutlined(t, '3d2d', 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)

	cam_End3D2D()

	ang:RotateAroundAxis(ang:Right(), 180)

	cam_Start3D2D(pos + vec + ang:Right() * 1.2, ang, 0.065)

	draw_SimpleTextOutlined(t, '3d2d', 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)

	cam_End3D2D()

end



hook.Add('PostDrawOpaqueRenderables', function()

	for k, v in ipairs(ents_FindByClass('npc_employer')) do

		Draw(v)

	end

end)



net.Receive('rp.EmployerMenu', function()
	local ent = net.ReadEntity()
	

	local fr = ui.Create('ui_frame', function(self, p)
		self:SetSize(ScrW() * 0.65, ScrH() * 0.6)
		
		self:SetTitle(rp.Factions[ent:GetNWInt("Faction",1)].printName)
		self:Center()
		self:MakePopup()
end)



	ui.Create('rp_faction_jobslist', function(self, p)
		print(ent)
		self:SetFaction(ent:GetNWInt("Faction",1))
		self:SetPos(5, 25)
		self:SetSize(p:GetWide() - 10, p:GetTall() - 30)
	end, fr)
end)