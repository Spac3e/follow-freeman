local cvar_name = 'hidehud_' .. game.GetMap()
cvar.Register(cvar_name):SetDefault(false):AddMetadata('State', 'RPMenu'):AddMetadata('Menu', 'Отключить интерфейс')
local cvar_Get = cvar.Get
local draw_OutlinedBox = draw.OutlinedBox
local color_white = rp.col.White
local color_black = rp.col.Black
local color_red = rp.col.Red
local color_orange = rp.col.Orange
local color_blue = rp.col.SUP
local color_green = rp.col.Green
local color_purple = rp.col.Purple
local color_bg = rp.col.Background
local color_outline = table.Copy(rp.col.Outline)
local blur = Material("pp/blurscreen")
local surface = surface
local render = render
local LocalPlayer = LocalPlayer
local math = math
local upper = string.utf8upper or string.upper
local Lerp = Lerp
local RealTime = RealTime
local IsValid = IsValid
local isfunction = isfunction
local Color = Color
local draw_SimpleText = draw.SimpleText

local color_purple = rp.col.Purple
local color_red = Color(255, 32, 45, 200)
local color_white = Color(255,255,255)

local X, Y
local scrW, scrH = ScrW(), ScrH()
local textOffset = 20

local function drawBlur(x, y, w, h, layers, density, alpha)
	layers = layers or 3
	density = density or 6
	alpha = alpha or 255
	X, Y = 0,0

	surface.SetDrawColor(255, 255, 255, alpha)
	surface.SetMaterial(blur)

	for i = 1, 3 do
		blur:SetFloat("$blur", (i / layers) * density)
		blur:Recompute()

		render.UpdateScreenEffectTexture()

		render.SetScissorRect(x, y, x+w, y+h, true)
			surface.DrawTexturedRect(X * -1, Y * -1, scrW, scrH)
		render.SetScissorRect(0, 0, 0, 0, false)
	end
end

surface.CreateFont( "HUDBarFont", {
	font = "Bebas Neue", -- Open Sans Light
	size = 18,
	extended = true,
	weight = 100
})

surface.CreateFont( "HUDAmmoFont", {
	font = "Bebas Neue",
	size = 40,
	extended = true,
	antialias = true,
	weight = 300
})
surface.CreateFont( "HUDAmmoBigFont", {
	font = "Bebas Neue",
	size = 54,
	extended = true,
	antialias = true,
	weight = 300
})

surface.CreateFont( "HUDInfoFont", {
	font = "Bebas Neue",
	size = 32,
	extended = true,
	antialias = true,
	weight = 300
})

local function drawBar(x, y, width, height, r, g, b, a)
	x = x or 0
	y = y or 0
	surface.SetDrawColor(r, g, b, a)
	surface.DrawLine(x + 1, y, x + width - 2, y)
	surface.DrawLine(x, y + 1, x, y + height - 2)
	surface.DrawLine(x + width - 1, y + 2, x + width - 1, y + height - 2)
	surface.DrawLine(x + 1, y + height - 1, x + width - 2, y + height -1)
end

local function drawRect(x, y, width, height, r, g, b, a)
	surface.SetDrawColor(r, g, b, a)
	surface.DrawRect(x, y, width, height)
end

local colorBlack = Color(0,0,0)
local function drawShadow(text, font, x, y, color, shadowColor)
	surface.SetFont(font)

	if shadowColor then
		surface.SetTextColor(shadowColor.r, shadowColor.g, shadowColor.b, shadowColor.a)
	else
		surface.SetTextColor(colorBlack.r, colorBlack.g, colorBlack.b, 255)
	end

	surface.SetTextPos(x+1, y+1)
	surface.DrawText(text)

	surface.SetTextColor(color.r, color.g, color.b, color.a)
	surface.SetTextPos(x, y)
	surface.DrawText(text)

	return surface.GetTextSize(text) + textOffset
end

local bars = {
	{
		multiplier = 0,
		name = function() return LocalPlayer():Armor() > 100 && "броня ("..LocalPlayer():Armor()..")" or "броня" end,
		color = Color(4, 144, 145, 200),
		func = function(self)
			self.old = Lerp(0.1, self.old or 0, LocalPlayer():Armor() / 100)
			return math.min(self.old, 1) 
		end,
		check = function() return LocalPlayer():Armor() > 0 end
	},
	{
		multiplier = 0,
		name = function() return LocalPlayer():Health() > 100 && "здоровье ("..LocalPlayer():Health().." / "..LocalPlayer():GetMaxHealth()..")" or "здоровье" end,
		color = color_red,
		func = function(self)
			self.old = math.min(Lerp(0.1, self.old or 0, LocalPlayer():Health() / LocalPlayer():GetMaxHealth()), 1)
			return self.old
		end,
		check = function() return LocalPlayer():Health() != LocalPlayer():GetMaxHealth() end
	},
	{
		multiplier = 0,
		name = "сытость",
		color = Color(30, 176, 112, 200),
		func = function(self) return LocalPlayer():GetHunger() / 100 end,
		check = function() return LocalPlayer():GetHunger() < 75 end
	},
	{
		multiplier = 0,
		name = function() return LocalPlayer():IsStaminaRestoring() && "выносливость восстанавливается" || "выносливость расходуется ("..math.floor(rp.cfg.StaminaRestoreTime - LocalPlayer():GetLastDamageTime())..")" end,
		color = Color(224, 181, 65, 200),
		func = function(self)
			self.old = Lerp(0.1, self.old or 0, LocalPlayer():GetStamina() / LocalPlayer():GetMaxStamina())
			return self.old
		end,
		check = function()
			return !LocalPlayer():IsStaminaRestoring() || LocalPlayer():GetStamina() < LocalPlayer():GetMaxStamina() * 0.7
		end
	}
}

local offsetY, offsetX = 4, 10
local offsetX2 = offsetX * 2
local barHeight, barWidth = 30, 400
local outlineColor = Color(10, 10, 10, 220)

local last = RealTime()
local wallet = 0
local lp 
local i, delta, translate, plyTeam, width, alpha, x, y, info
local velocity = 10000
local last = RealTime()
local wallet = 0
local name

local sf_SetDrawColor = surface.SetDrawColor
local sf_DrawTexturedRect = surface.DrawTexturedRect
local sf_SetMat = surface.SetMaterial
local d_SimpleText = draw.SimpleText
local nw_GetGlobal = nw.GetGlobal

local blur = Material("pp/blurscreen");

local agenda_bar 	= Material("hud_elements/conteiner_urf/agenda_cont.png")

local r_UpdateScreenEffectTexture = render.UpdateScreenEffectTexture;
local r_SetScissorRect            = render.SetScissorRect;

local sf_DrawBlur = function(x, y, w, h)
	sf_SetDrawColor( color_white );
	sf_SetMat( blur );

	for i = 1, 3 do
		blur:SetFloat( "$blur", (i / 3) * 4 );
		blur:Recompute();

		r_UpdateScreenEffectTexture();

		r_SetScissorRect( x, y, x + w, y + h, true );
			sf_DrawTexturedRect( 0, 0, ScrW(), ScrH() );
		r_SetScissorRect( 0, 0, 0, 0, false );
	end
end


local ColValues = {}
local function varcol(name, val)
	if ColValues[name] == nil then
		ColValues[name] = {}
		ColValues[name].Old = val
		ColValues[name].Flash = SysTime()

		return color_white
	end

	if ColValues[name].Old ~= val then
		ColValues[name].Flash = SysTime() + 0.2
		ColValues[name].Old = val

		return color_blue
	end

	if ColValues[name].Flash > SysTime() then return color_blue end

	return color_white
end

function rp.DrawAgenda(h)
	LP = LocalPlayer()
	if (rp.agendas[LP:Team()] ~= nil) then
		local w = (sw * .175)
		local x = 2.5
		local text = string.Wrap('HudFont', (nw_GetGlobal('Agenda;' .. LP:Team()) or 'Повестка дня отсутствует!'), w - 6)
		draw_OutlinedBox(0, h+5, w, (#text * 18) + 10, color_bg, color_outline)

		for k, v in ipairs(text) do
			draw_SimpleText(v, 'HudFont', x, h + (k * 18), varcol('Agenda', nw_GetGlobal('Agenda' .. LP:Team())), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
	end
end

function rp.DrawLaws()
	local w = (sw * .175)
	local x = 2.5
	local text = string.Wrap('HudFont', (nw_GetGlobal('TheLaws') or rp.cfg.DefaultLaws), w - 6)
	draw_OutlinedBox(x, 25, w, (#text * 18) + 5, color_bg, color_outline)

	for k, v in ipairs(text) do
		draw_SimpleText(v, 'HudFont', x + 2.5, 17 + (k * 18), varcol('TheLaws', nw_GetGlobal('TheLaws')), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	return 25 + (#text * 18) + 5
end

local scrH = ScrH()
local lawsOffset = 25
sw, sh = ScrW(), ScrH()

hook('HUDPaint', 'rp.HUD', function()
	if cvar_Get(cvar_name).Value then return end
	
	lp = LocalPlayer()
	if !(IsValid(lp) && lp:Alive()) then return end

	i = 0

	delta = RealTime()-last

	for _, v in pairs(bars) do
		if !v.check() then
			v.multiplier = Lerp(0.09, v.multiplier, 0) --math.Clamp((v.multiplier or 0) - delta*2, 0, 1)
			i =  i + v.multiplier
		else
			v.multiplier = Lerp(0.09, v.multiplier, 1) --math.Clamp((v.multiplier or 0) + delta*2, 0, 1)
			i =  i + v.multiplier
		end
		width = barWidth * v.func(v)
		alpha = v.multiplier * 255

		if v.multiplier > 0.1 then
			drawBlur(offsetX, scrH - (barHeight + offsetY) * i + 1, barWidth - 1, barHeight, 3, 6, alpha*0.5)
		end

		drawRect(offsetX + 1, scrH - (barHeight + offsetY) * i + 1, width, barHeight - 1, v.color.r, v.color.g, v.color.b, alpha)

		surface.SetDrawColor(outlineColor.r, outlineColor.g, outlineColor.b, alpha)
		surface.DrawLine(offsetX + width, scrH - (barHeight + offsetY) * (i-1) - offsetY - 1, offsetX + width, scrH - (barHeight + offsetY)*i)

		drawBar(offsetX, scrH - (barHeight + offsetY) * i, barWidth, barHeight, outlineColor.r, outlineColor.g, outlineColor.b, alpha)

		--draw.SimpleText(v.name, 'TextFont', offsetX + 10+1, scrH - (barHeight + offsetY) * i + 5 + 1, Color(0,0,0,alpha))
		name = isfunction(v.name) && v.name() or v.name
		drawShadow(name, 'HUDBarFont', offsetX + 10, scrH - (barHeight + offsetY) * i + 5, Color(255,255,255,alpha), Color(0,0,0,alpha))

	end

	translate = velocity * (delta)

	wallet = math.min(wallet + math.floor(translate), lp:GetMoney())

	plyTeam = lp:GetTeamTable()
	x, y = (offsetX2 + barWidth) * math.min(i, 1), scrH - 35

	x = x + drawShadow(rp.GetTimeFormat(), 'HUDInfoFont', x, y, color_white)

	if plyTeam then
		local t = upper(lp:GetJobName() .. " "..rp.FormatMoney(wallet).. " (+"..rp.FormatMoney(plyTeam.salary)..")")

		x = x + drawShadow(t, 'HUDInfoFont', x, y, color_white)
	end
	local function GetCurrentPoint(ply)
		for i = 1, #rp.Capture.Points do
			v = rp.Capture.Points[i]
			
			if ply:InBox(v.box[1], v.box[2]) then
				return v
			end
		end
	end

	if lp:GetCurrentPoint() then
		x = x + drawShadow(string.utf8upper(lp:GetCurrentPoint().printName.." ("..rp.Capture.GetOwnerName(lp:GetCurrentPoint().id)..")"), 'HUDInfoFont', x, y, color_white)
	end

	if (lp:GetDisguiseTime() >= 1) then
		x = x + drawShadow('МАСКИРОВКА: ' .. lp:GetDisguiseTime(), 'HUDInfoFont', x, y, color_purple)
	end

	if lp:IsArrested() then
		info = lp:GetNetVar('ArrestedInfo')
		x = x + drawShadow('АРЕСТОВАН: ' .. math.ceil(info.Release - CurTime()), 'HUDInfoFont', x, y, color_red)
	elseif lp:IsWanted() then
		x = x + drawShadow(upper(lp:GetWantedReason()), 'HUDInfoFont', x, y, color_red)
	end

	if lp:GetNLRTime() && lp:GetNLRTime() > 0 && lp:InNLRZone() then
		x = x + drawShadow('ПОКИНЬТЕ ЗОНУ НЛР (' .. lp:GetNLRTime()..')', 'HUDInfoFont', x, y, color_red)
	end

	if LocalPlayerInsideGreenZone() then
		x = x + drawShadow('МИРНЫЙ СЕКТОР', 'HUDInfoFont', x, y, Color(30, 255, 30, 200))
	end
	
	last = RealTime()
end)

-- Функция рисования полоски с указанными параметрами
local function drawBar(x, y, w, h, value, maxvalue, color)
    -- Рассчитываем ширину полоски в соответствии с текущим значением
    local barWidth = math.floor(w * (value / maxvalue))
    
    -- Рисуем задний фон полоски
    surface.SetDrawColor(0, 0, 0, 200)
    surface.DrawRect(x, y, w, h)
    
    -- Рисуем заполненную часть полоски
    surface.SetDrawColor(color)
    surface.DrawRect(x, y, barWidth, h)
    
    -- Рисуем обводку полоски
    surface.SetDrawColor(255, 255, 255, 255)
    surface.DrawOutlinedRect(x, y, w, h)
end

-- Функция рисования HUD
local function drawHUD()
    -- Получаем игровые данные, такие как здоровье, броня и патроны
    local health = LocalPlayer():Health()
    local maxHealth = LocalPlayer():GetMaxHealth()
    local armor = LocalPlayer():Armor()
    local maxArmor = 100 -- Максимальное значение брони
    local ammo = LocalPlayer():GetActiveWeapon():Clip1()
    local maxAmmo = LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType())
    
    -- Задаем размеры и позиции элементов HUD
    local screenWidth, screenHeight = ScrW(), ScrH()
    local barHeight = 20
    local barMargin = 10
    local barY = screenHeight - barHeight - barMargin
    local healthBarWidth = 200
    local armorBarWidth = 150
    local ammoBarWidth = 100
    local healthBarX = barMargin
    local armorBarX = healthBarX + healthBarWidth + barMargin
    local ammoBarX = armorBarX + armorBarWidth + barMargin
    
    -- Рисуем полоску здоровья
    drawBar(healthBarX, barY, healthBarWidth, barHeight, health, maxHealth, Color(255, 0, 0))
    
    -- Рисуем полоску брони
    drawBar(armorBarX, barY, armorBarWidth, barHeight, armor, maxArmor, Color(0, 0, 255))
    
    -- Рисуем полоску патронов
    drawBar(ammoBarX, barY, ammoBarWidth, barHeight, ammo, maxAmmo, Color(255))
end
