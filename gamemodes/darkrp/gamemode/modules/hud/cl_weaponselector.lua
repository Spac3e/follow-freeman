
-----------------------------------------------------
local draw, surface, IsValid, Lerp, LocalPlayer, CurTime, ScrW = draw, surface, IsValid, Lerp, LocalPlayer, CurTime, ScrW

//local function getTextWidth(text, font)
//	surface.SetFont(font)
//	return surface.GetTextSize(text)
//end

local switch = nil

hook.Add( "CreateMove", "WeaponSwitch", function( cmd )
	if ( !IsValid( switch ) ) then return end

	cmd:SelectWeapon( switch )

	if ( LocalPlayer():GetActiveWeapon() == switch ) then
		switch = nil
	end
end )

surface.CreateFont( "WeaponSelectorFont", {
	font = "Open Sans Light",
	size = 32,
	extended = true,
	antialias = true,
	weight = 600
})

surface.CreateFont( "WeaponSelectorFontBlur", {
	font = "Open Sans Light",
	size = 32,
	extended = true,
	antialias = true,
	weight = 600,
	blursize = 1
})

local color, activeColor, focusColor = Color(255,255,255), Color(94,209,241), Color(241,209,94)

local function sort(a, b)
	return IsValid(a) && IsValid(b) && (a:GetSlot() < b:GetSlot() || (a:GetSlot() == b:GetSlot() && a:GetSlotPos() > b:GetSlotPos()))
end

local focus, active = 1, 1
local visible, opacity = 0, 0
local temp_weapons
hook('HUDPaint', 'rp.WeaponSelector', function()
	if LocalPlayer():InVehicle() then return end
	if !(LocalPlayer():Alive()) then return end

	if visible > CurTime() then 
		opacity = Lerp(0.15, opacity, 255)
	else 
		opacity = Lerp(0.15, opacity, 0) 
	end

	local activeWeapon = IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon()
	local weps = LocalPlayer():GetWeapons()

	table.sort(weps, sort)
	temp_weapons = weps

	if opacity < 10 then return end

	if (!weps[focus]) then
		focus = active
	end
	local max = 0
	for k=1, #weps do
		local v = weps[k]
		if !(v && IsValid(v)) then continue end

		local textColor
		if focus == k then 
			textColor = focusColor
		elseif activeWeapon == v then
			active = k
			textColor = activeColor
		else 
			textColor = color
		end

		local text = string.utf8upper(v:GetPrintName())
		surface.SetFont('WeaponSelectorFont')
		local width, height = surface.GetTextSize(text)
		if width > max then
			max = width
		end
		surface.SetFont('WeaponSelectorFont')
		surface.SetTextPos(ScrW()-20 - width + 1, (height-3 )*k + 3 )
		surface.SetTextColor(0, 0, 0, opacity)
		surface.DrawText(text)	

		surface.SetTextPos(ScrW()-20 - width + 1, (height-3 )*k + 3 )
		surface.SetTextColor(0, 0, 0, opacity)
		surface.DrawText(text)

		surface.SetFont('WeaponSelectorFont')

		surface.SetTextColor(textColor.r, textColor.g, textColor.b, opacity)
		surface.SetTextPos(ScrW()-20 - width + 1 - 1, (height-3 )*k + 3 - 1 )
		surface.DrawText(text)

		if focus == k then

		end
	end
end)

local function fadeIn()
	visible = CurTime() + 1
end

local function fadeOut()
	visible = 0
end

local hoverSound = Sound("garrysmod/ui_hover.wav")
local tick = Sound('common/talk.wav')
local playSound = surface.PlaySound

local last, oldlast = 0, 0

local function physgun()
	return (IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" && input.IsMouseDown(MOUSE_LEFT))
end

local function selectWeapon(index)
	if !temp_weapons[index] then return false end
	switch = temp_weapons[index]
	playSound(tick)
	active = index
end

local bind_table = {
	invprev = function()
		if physgun() then 
			return false 
		end
		playSound(hoverSound)
		focus = focus <= 1 && #temp_weapons || focus - 1
		fadeIn()
		return true
	end,
	invnext = function()
		if physgun() then 
			return false 
		end
		playSound(hoverSound)
		focus = focus >= #temp_weapons && 1 || focus + 1
		fadeIn()
		return true
	end,

}
bind_table['+attack'] = function()
	if visible > CurTime() then
		last = active
		selectWeapon(focus)
		fadeOut()
		return true
	else
		return false
	end
end
bind_table['lastinv'] = function()
	oldlast = last
	last = active
	selectWeapon(oldlast)
	return true
end

for i=1, 9 do
	bind_table['slot'..i] = function()
		selectWeapon(i)
	end
end

hook("PlayerBindPress", 'rp.WeaponSelector', function(ply, bind, pressed)
	if !(ply:Alive()) then return end
	if bind_table[bind] && pressed then
		return bind_table[bind]()
	end
end)

hook("HUDShouldDraw", function(name)
	if name == 'CHudWeaponSelection' then return false end
end)