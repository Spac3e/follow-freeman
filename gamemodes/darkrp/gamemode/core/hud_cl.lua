local CurTime = CurTime
local IsValid = IsValid
local ipairs = ipairs
local Color = Color
local DrawColorModify = DrawColorModify
local nw_GetGlobal = nw.GetGlobal
local cvar_Get = cvar.GetValue
local table_Filter = table.Filter
local player_GetAll = player.GetAll
local hook_Call = hook.Call
local rp_FormatMoney = rp.FormatMoney
local math_ceil = math.ceil
local math_sin = math.sin
local draw_SimpleText = draw.SimpleText
local draw_SimpleTextOutlined = draw.SimpleTextOutlined
local draw_OutlinedBox = draw.OutlinedBox
local draw_Box = draw.Box
local surface_SetDrawColor = surface.SetDrawColor
local surface_DrawLine = surface.DrawLine
local surface_DrawTexturedRect = surface.DrawTexturedRect
local surface_GetTextSize = surface.GetTextSize
local surface_SetFont = surface.SetFont
local surface_SetMaterial = surface.SetMaterial
local surface_DrawOutlinedRect = surface.DrawOutlinedRect -- TODO: FIX
local surface_SetTextPos = surface.SetTextPos
local surface_SetTextColor = surface.SetTextColor
local surface_DrawText = surface.DrawText
local color_white = rp.col.White
local color_black = rp.col.Black
local color_red = rp.col.Red
local color_orange = rp.col.Orange
local color_blue = rp.col.SUP
local color_green = rp.col.Green
local color_purple = rp.col.Purple
local color_bg = rp.col.Background
local color_outline = table.Copy(rp.col.Outline)

local function mat(texture)
	return Material(texture, 'smooth')
end

local material_org = mat'sup/hud/multiple25.png'
local material_job = mat'sup/hud/office-worker2.png'
local material_health = mat'sup/hud/heart298.png'
local material_armor = mat'sup/hud/shields16.png'
local material_hunger = mat'sup/hud/burger11.png'
local material_karma = mat'sup/hud/taoism.png'
local material_money = mat'sup/hud/wallet33.png'
local material_licence = mat'sup/hud/guns4.png'
local material_lockdown = mat'sup/hud/lock24.png'
local material_mic = mat'sup/hud/speaker100.png'
local sw, sh
local LP
cvar.Register'enable_lawshud':SetDefault(true):AddMetadata('State', 'RPMenu'):AddMetadata('Menu', 'Enable laws HUD')
cvar.Register'enable_agendahud':SetDefault(true):AddMetadata('State', 'RPMenu'):AddMetadata('Menu', 'Enable agenda HUD')
cvar.Register'disable_complicated_playertags':SetDefault(false):AddMetadata('State', 'RPMenu'):AddMetadata('Menu', 'Disable complicated player nametag code (increases FPS)')

surface.CreateFont("DarkRPHudMicro", {
	font = "EuropaNuovaExtraBold",
	extended = true,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
})

surface.CreateFont("HeaderFont2", {
	font = "EuropaNuovaExtraBold",
	extended = true,
	size = 40,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

surface.CreateFont("HudFont2", {
	font = "EuropaNuovaExtraBold",
	extended = true,
	size = 15,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})
surface.CreateFont("ContentHeader", {
	font = "EuropaNuovaExtraBold",
	extended = true,
	size = 15,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})


surface.CreateFont('PlayerInfo', {
	font = 'Open Sans Light',
	size = 20,
	weight = 300,
	antialias = true,
	extended = true,
})

surface.CreateFont('PlayerInfoBig', {
	font = 'Open Sans Light',
	size = 40,
	weight = 300,
	antialias = true,
	extended = true,
})

surface.CreateFont('HudFont', {
	font = 'Open Sans Light',
	size = 21,
	weight = 500,
	antialias = true,
	extended = true,
})

surface.CreateFont('HudFontSmall', {
	font = 'Open Sans Light',
	size = 18,
	weight = 650,
	antialias = true,
	extended = true,
})

surface.CreateFont('HudFont2', {
	font = 'Open Sans Light',
	size = 24,
	weight = 700,
	extended = true,
})

surface.CreateFont('NLRFont', {
	font = 'Open Sans Light',
	size = 42,
	weight = 700,
	extended = true,
})

local Talkers = {}

hook('PlayerStartVoice', 'rp.hud.PlayerStartVoice', function(pl)
	Talkers[pl] = true
end)

hook('PlayerEndVoice', 'rp.hud.PlayerEndVoice', function(pl)
	Talkers[pl] = nil
end)

timer.Simple(1, function()
	Material('voice/icntlk_pl'):SetFloat('$alpha', 0) -- hacky voice bubble fix
end)

-- utils
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

local color_cache = Color(0, 0, 0, 255)

local function perccol(num)
	num = math.Clamp(num / 100, 0, 1)
	color_cache.r = 255 - (num * 200)
	color_cache.g = (num * 200)
	color_cache.b = 50

	return color_cache
end

local Days = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'}
local MinLen = 5
local HourLen = MinLen * 60
local DayLen = HourLen * 24
local WeekLen = DayLen * 7

local function Time()
	local t = CurTime()
	local WeekStart = t % WeekLen
	local DayStart = WeekStart % DayLen
	local HourStart = DayStart % HourLen
	local Day = math_ceil(WeekStart / DayLen)
	local Hour = math_ceil(DayStart / HourLen)
	local Minute = math_ceil(HourStart / MinLen)
	local PM = ' AM'

	if (Minute == 60) then
		Hour = Hour + 1
		Minute = 0
	end

	if (Hour == 24) then
		Day = Day + 1
		Hour = 0
	end

	if (Day >= 8) or (Day == 0) then
		Day = 1
	end

	if (Minute < 10) then
		Minute = '0' .. Minute
	end

	if (Hour > 11) then
		if (Hour > 12) then
			Hour = Hour - 12
		end

		PM = ' PM'
	elseif (PM == ' AM') and (Hour == 0) then
		Hour = 12
	end

	return (Days[Day] .. ' ' .. Hour .. ':' .. Minute .. PM)
end

-- Draw utils
local function DrawOutlinedText(text, font, x, y, colour, outline, align)
	local w, h = draw_SimpleTextOutlined(text, font, (align and (x - 5) or (x + 5)), y, colour, (align and TEXT_ALIGN_RIGHT or TEXT_ALIGN_LEFT), TEXT_ALIGN_CENTER, 1, outline or color_black)

	return (w + 10)
end

local function DrawCenteredText(text, font, x, y, colour, xalign)
	surface_SetFont(font)
	local w, h = surface_GetTextSize(text)
	x = x - w * 0.5
	y = y + (h * (xalign - 1))
	surface_SetTextPos(x, y)
	surface_SetTextColor(colour)
	surface_DrawText(text)

	return w, h
end -- rodo

local function DrawCenteredTextOutlined(text, font, x, y, colour, xalign, outlinewidth, outlinecolour)
	local steps = (outlinewidth * .75)

	if (steps < 1) then
		steps = 1
	end

	for _x = -outlinewidth, outlinewidth, steps do
		for _y = -outlinewidth, outlinewidth, steps do
			DrawCenteredText(text, font, x + (_x), y + (_y), outlinecolour, xalign)
		end
	end

	return DrawCenteredText(text, font, x, y, colour, xalign)
end

local function DrawLine(w, h, x, color)
	surface_SetDrawColor(color)
	surface_DrawLine(x + w, x, x + w, x + h)
end

local height = 26
local left_x = 3
local right_x = ScrW() - 3

local function drawlefticon(icon, color_icon, text, color_text)
	surface_SetFont('HudFont')
	surface_SetMaterial(icon)
	surface_SetDrawColor(color_icon)
	surface_DrawTexturedRect(left_x, 3, 20, 20)
	left_x = left_x + 24
	local w = surface_GetTextSize(text)
	surface_SetTextPos(left_x, 2)
	surface_SetTextColor(color_text)
	surface_DrawText(text)
	left_x = left_x + (w + 4)
	surface_SetDrawColor(color_outline)
	surface_DrawLine(left_x, 0, left_x, height - 1)
	left_x = left_x + 4
end

local function drawrightext(text, color)
	local w = surface_GetTextSize(text)
	right_x = right_x - (w + 4)
	surface_SetTextPos(right_x, 2)
	surface_SetTextColor(color.r, color.g, color.b, color.a)
	surface_DrawText(text)
	right_x = right_x - 5
	surface_SetDrawColor(color_outline)
	surface_DrawLine(right_x, 0, right_x, height - 1)
end

-- gm funcs
local NoDraw = {
	CHudHealth = true,
	CHudBattery = true,
	CHudSuitPower = true
}

function GM:HUDShouldDraw(name)
	if NoDraw[name] or ((name == 'CHudDamageIndicator') and (not LP:Alive())) then return false end

	return true
end

function GM:HUDDrawTargetID()
	return false
end

function GM:DrawDeathNotice(x, y)
	return false
end

-- Info bar
local function InfoBar()
	left_x = 4
	right_x = sw - 4
	draw_OutlinedBox(0, 0, sw, height, color_bg, color_outline)

	if (LP:GetOrg() ~= nil) then
		drawlefticon(material_org, LP:GetOrgColor(), LP:GetOrg(), LP:GetOrgColor())
	end

	drawlefticon(material_job, LP:GetJobColor(), LP:GetJobName(), LP:GetJobColor())
	drawlefticon(material_health, perccol(LP:Health()), LP:Health() .. '%', varcol('hp', LP:Health()))

	if (LP:Armor() > 0) then
		drawlefticon(material_armor, color_blue, LP:Armor() .. '%', varcol('ar', LP:Armor()))
	end

	drawlefticon(material_hunger, perccol(LP:GetHunger()), LP:GetHunger() .. '%', varcol('h', LP:GetHunger()))
	drawlefticon(material_karma, perccol(LP:GetKarma()), LP:GetKarma(), varcol('k', LP:GetKarma()))
	drawlefticon(material_money, color_green, rp_FormatMoney(LP:GetMoney()) .. '+' .. LP:GetSalary() .. '/hr', varcol('m', LP:GetMoney()))

	if LP:HasLicense() then
		drawlefticon(material_licence, color_green, 'Licensed', color_white)
	end

	surface_SetFont('HudFont')
	surface_SetDrawColor(color_outline)
	local alpha = (math_sin(CurTime()) + 1) / 0.5 * 255
	local w = surface_GetTextSize('SuperiorServers.co')
	right_x = right_x - w
	surface_SetTextPos(right_x, 2)
	surface_SetTextColor(color_blue.r, color_blue.g, color_blue.b, alpha)
	surface_DrawText('Sup')
	surface_SetTextPos(right_x, 2)
	surface_SetTextColor(color_white.r, color_white.g, color_white.b, 255 - alpha)
	surface_DrawText('Sup')
	surface_SetTextColor(color_white.r, color_white.g, color_white.b, color_white.a)
	surface_DrawText('eriorServers.co')
	right_x = right_x - 4
	surface_DrawLine(right_x, 0, right_x, height)
	drawrightext(Time(), varcol('Time', LP:GetKarma()))

	if (IsValid(LP:GetNetVar('Employer'))) then
		drawrightext('Employer: ' .. LP:GetNetVar('Employer'):Name(), LP:GetNetVar('Employer'):GetJobColor())
	end

	if (IsValid(LP:GetNetVar('Employee'))) then
		drawrightext('Employee: ' .. LP:GetNetVar('Employee'):Name(), LP:GetNetVar('Employee'):GetJobColor())
	end

	if (LP:GetDisguiseTime() >= 1) then
		drawrightext('Disguise: ' .. LP:GetDisguiseTime(), color_purple)
	end

	if nw_GetGlobal('mayorGrace') and (nw_GetGlobal('mayorGrace') > CurTime()) then
		drawrightext('Mayor Grace: ' .. math_ceil(nw_GetGlobal('mayorGrace') - CurTime()), color_orange)
	end

	if (LP:GetNLRTime()) then
		drawrightext('NLR: ' .. LP:GetNLRTime(), color_red)

		if LP:InNLRZone() then
			draw_SimpleText('You are in an NLR zone. Please leave!', 'NLRFont', sw * .5, sh * .25, color_red, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
end

local function BannedHUD()
	right_x = sw - 4
	draw_OutlinedBox(0, 0, sw, height, color_bg, color_outline)
	surface_SetFont('HudFont')
	surface_SetDrawColor(color_outline)
	drawrightext('You are banned from the server. Appeal @ SuperiorServers.co', color_white)
end

-- Agenda
local function Agenda(h)
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

-- Laws
local function Laws()
	local w = (sw * .175)
	local x = 2.5
	local text = string.Wrap('HudFont', (nw_GetGlobal('TheLaws') or rp.cfg.DefaultLaws), w - 6)
	draw_OutlinedBox(x, 25, w, (#text * 18) + 5, color_bg, color_outline)

	for k, v in ipairs(text) do
		draw_SimpleText(v, 'HudFont', x + 2.5, 17 + (k * 18), varcol('TheLaws', nw_GetGlobal('TheLaws')), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end
	return 25 + (#text * 18) + 5
end

-- Hits
local function Hits()
	if LocalPlayer():IsHitman() then
		local w = (sw * .175)
		local x = 2.5
		local hits = table_Filter(player_GetAll(), function(pl) return pl:HasHit() and (pl ~= LP) end)

		if (#hits >= 1) then
			draw_OutlinedBox(0, 25, w, (#hits * 18) + 5, color_bg, color_outline)
			local c = 1

			for k, v in ipairs(hits) do
				if IsValid(v) then
					draw_SimpleText(v:Name(), 'HudFont', x, 17 + (c * 18), color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
					local cost = rp_FormatMoney(v:GetHitPrice())
					draw_SimpleText(cost, 'HudFont', (w - 5 - surface_GetTextSize(cost)), 17 + (c * 18), color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
					c = c + 1
				end
			end
		else
			draw_OutlinedBox(0, 25, w, (#hits * 18) + 23, color_bg, color_outline)
			draw_SimpleText('No Hits!', 'HudFont', x, 35, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
	end
end

-- Lockdown
local function LockDown()
	if nw_GetGlobal('lockdown') then
		color_outline = CurTime() % 2 < 1 and color_red or color_white
		surface_SetFont('HudFont')
		local w = surface_GetTextSize('Объявлен комендантский час, вернитесь в свой дом!') + (24 * 2) + 10
		local x, y = sw * .5 - w * .5, (height - 1)
		draw_OutlinedBox(x, y, w, height, color_bg, color_outline)
		surface_SetMaterial(material_lockdown)
		surface_SetDrawColor(color_outline)
		surface_DrawTexturedRect(x + 3, y + 3, 20, 20)
		surface_SetMaterial(material_lockdown)
		surface_SetDrawColor(color_outline)
		surface_DrawTexturedRect(x + (w - 23), y + 3, 20, 20)
		draw_SimpleText('Объявлен комендантский час, вернитесь в свой дом!', 'HudFont', sw * .5, y + 2 + 20, color_outline, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

		return
	end

	color_outline = Color(rp.col.Outline.r, rp.col.Outline.g, rp.col.Outline.b, rp.col.Outline.a)
end

-- Arrested
local function Arrested()
	if LP:IsArrested() then
		local info = LP:GetNetVar('ArrestedInfo')
		draw_SimpleTextOutlined('You\'re arrested for: ' .. info.Reason, 'HudFont2', sw / 2, sh - 50, color_white, 1, 1, 1, color_black)
		draw_SimpleTextOutlined('Time left: ' .. math_ceil(info.Release - CurTime()) .. ' seconds.', 'HudFont2', sw / 2, sh - 20, color_white, 1, 1, 1, color_black)
	elseif LP:IsWanted() then
		draw_SimpleTextOutlined('You\'re wanted for: ' .. LP:GetWantedReason(), 'HudFont2', sw / 2, sh - 20, color_white, 1, 1, 1, color_black)
	end
end

-- Playerinfo
local vec13 = Vector(0, 0, 13)
local vec10 = Vector(0, 0, 10)

local function getHeadPos(pl)
	local Bone = pl:LookupBone('ValveBiped.Bip01_Head1')
	if not Bone then return false end
	local BonePos, _ = pl:GetBonePosition(Bone)
	if not BonePos then return false end
	return BonePos + vec13
end

local function DrawPlayerInfo(pl, pos)
	local div = 0

	pos = (cvar_Get('disable_complicated_playertags') && getHeadPos(pl)) || pos + vec10

	pos = pos:ToScreen()
	pos.y = pos.y - 10

	if LP:GetTeamTable().medic or (LP:Team() == TEAM_ADMIN) then
		div = -1
		DrawCenteredTextOutlined(pl:Health() .. ' HP', 'PlayerInfo', pos.x, pos.y, color_red, div + 2, 1, color_black)
	elseif LP:IsHitman() and pl:HasHit() then
		DrawCenteredTextOutlined('HIT ' .. rp_FormatMoney(pl:GetHitPrice()), 'PlayerInfo', pos.x, pos.y, color_red, div + 2, 1, color_black)
	end

	if pl:IsWanted() then
		DrawCenteredTextOutlined(pl:GetWantedReason(), 'PlayerInfo', pos.x, pos.y, color_red, div, 1, color_black)
		local posw, posh = DrawCenteredTextOutlined(pl:Name(), 'PlayerInfoBig', pos.x, pos.y, pl:GetJobColor(), div + 1, 1, color_black)

		if Talkers[pl] then
			surface_SetMaterial(material_mic)
			surface_SetDrawColor(color_orange)
			surface_DrawTexturedRect(pos.x - (posw * .5) - 26, pos.y + 2, 22, 22)
		end
	else
		local posw, posh = DrawCenteredTextOutlined(pl:GetJobName(), 'PlayerInfo', pos.x, pos.y, color_white, div + 1, 1, color_black)
		DrawCenteredTextOutlined(pl:Name(), 'PlayerInfoBig', pos.x, pos.y, pl:GetJobColor(), div, 1, color_black)
		local org = pl:GetOrg()

		if (org ~= nil) then
			DrawCenteredTextOutlined(org, 'PlayerInfo', pos.x, pos.y, pl:GetOrgColor(), div - 1, 1, color_black)
		end

		if Talkers[pl] then
			surface_SetMaterial(material_mic)
			surface_SetDrawColor(color_orange)
			surface_DrawTexturedRect(pos.x - (posw * .5) - 26, pos.y + 2, 22, 22)
		end

		if pl:HasLicense() then
			surface_SetMaterial(material_licence)
			surface_SetDrawColor(color_green)
			surface_DrawTexturedRect(pos.x + posw / 2 + 5, pos.y + 6, 16, 16)
		end
	end
end

local function PlayerDisplay()
	for k, pl in ipairs(player_GetAll()) do
		if (not IsValid(pl)) or (pl == LP) or (not pl:Alive()) or (hook_Call('HUDShouldDraw', GAMEMODE, 'PlayerDisplay', pl) == false) then continue end
		local insight = pl:InSight() and pl:InTrace()
		pl.IsCurrentlyVisible = insight

		if (insight) then
			DrawPlayerInfo(pl, pl:EyePos())
		end
	end
end

local function EntityDisplay()
	local ent = LP:GetEyeTrace().Entity

	if IsValid(ent) and (ent.TraceInfo ~= nil) and (LP:GetPos():Distance(ent:GetPos()) < 115) then
		draw_SimpleTextOutlined(ent.TraceInfo, 'HudFont2', sw / 2, sh / 2 + 50, color_white, 1, 1, 1, color_black)
	elseif IsValid(ent) and ent:IsPlayer() and ent:IsHirable() and not LP:IsHirable() and (LP:GetPos():Distance(ent:GetPos()) < 115) then
		draw_SimpleTextOutlined('Type /hire or navigate to F4 to hire ' .. ent:Name() .. ' for ' .. rp_FormatMoney(ent:GetHirePrice()), 'HudFont2', sw / 2, sh / 2 + 50, color_red, 1, 1, 1, color_black)
	elseif ent:IsVehicle() then
		
	end
end

local function DeathScreen()
	local h = sh * 0.085
	draw_Box(0, 0, sw, h, color_black)
	draw_Box(0, sh - h, sw, h, color_black)
	draw_SimpleTextOutlined('Вы умерли', 'HudFont2', sw * 0.5, h * 0.5, color_white, 1, 1, 1, color_black)
	draw_SimpleTextOutlined('Нажмите любую кнопку, чтобы возрадиться', 'HudFont2', sw * 0.5, sh - h * 0.5, color_white, 1, 1, 1, color_black)
end

local lawsOffset = 25
function GM:HUDPaint()
	sw, sh = ScrW(), ScrH()
	LP = LocalPlayer()
	if not IsValid(LP) then return end

	if (not LP:Alive()) then
		DeathScreen()
	elseif LP:IsBanned() then
		BannedHUD()
	else
		EntityDisplay()
		PlayerDisplay()


		if cvar_Get('enable_lawshud') then
			lawsOffset = Laws()
		end

		if cvar_Get('enable_agendahud') then
			Agenda(lawsOffset)
		end
		Hits()
		LockDown()
	//	Arrested()
	//	InfoBar()
	end
end

local modify = {
	['$pp_colour_addr'] = 0,
	['$pp_colour_addg'] = 0,
	['$pp_colour_addb'] = 0,
	['$pp_colour_brightness'] = 0,
	['$pp_colour_contrast'] = 1,
	['$pp_colour_colour'] = 0,
	['$pp_colour_mulr'] = 0.05,
	['$pp_colour_mulg'] = 0.05,
	['$pp_colour_mulb'] = 0.05
}

function GM:RenderScreenspaceEffects()
	if (LocalPlayer():Health() <= 15) then
		DrawColorModify(modify)
	end
end