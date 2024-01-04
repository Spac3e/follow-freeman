local surface = surface
local render = render
rp.ui = rp.ui or {}

surface.CreateFont('rp.ui.40', {
	font = 'Sans',
	size = 40,
	weight = 500
})

surface.CreateFont('rp.ui.39', {
	font = 'Sans',
	size = 39,
	weight = 500
})

surface.CreateFont('rp.ui.38', {
	font = 'Sans',
	size = 38,
	weight = 500
})

surface.CreateFont('rp.ui.37', {
	font = 'Sans',
	size = 37,
	weight = 500
})

surface.CreateFont('rp.ui.36', {
	font = 'Sans',
	size = 36,
	weight = 500
})

surface.CreateFont('rp.ui.35', {
	font = 'Sans',
	size = 35,
	weight = 500
})

surface.CreateFont('rp.ui.34', {
	font = 'Sans',
	size = 34,
	weight = 500
})

surface.CreateFont('rp.ui.33', {
	font = 'Sans',
	size = 33,
	weight = 500
})

surface.CreateFont('rp.ui.32', {
	font = 'Sans',
	size = 32,
	weight = 500
})

surface.CreateFont('rp.ui.31', {
	font = 'Sans',
	size = 31,
	weight = 500
})

surface.CreateFont('rp.ui.30', {
	font = 'Sans',
	size = 30,
	weight = 500
})

surface.CreateFont('rp.ui.29', {
	font = 'Sans',
	size = 29,
	weight = 500
})

surface.CreateFont('rp.ui.28', {
	font = 'Sans',
	size = 28,
	weight = 500
})

surface.CreateFont('rp.ui.27', {
	font = 'Sans',
	size = 27,
	weight = 400
})

surface.CreateFont('rp.ui.26', {
	font = 'Sans',
	size = 26,
	weight = 400
})

surface.CreateFont('rp.ui.25', {
	font = 'Sans',
	size = 25,
	weight = 400
})

surface.CreateFont('rp.ui.24', {
	font = 'Sans',
	size = 24,
	weight = 400
})

surface.CreateFont('rp.ui.23', {
	font = 'Sans',
	size = 23,
	weight = 400
})

surface.CreateFont('rp.ui.22', {
	font = 'Sans',
	size = 22,
	weight = 400
})

surface.CreateFont('rp.ui.20', {
	font = 'Sans',
	size = 20,
	weight = 400
})

surface.CreateFont('rp.ui.19', {
	font = 'Sans',
	size = 19,
	weight = 400
})

surface.CreateFont('rp.ui.18', {
	font = 'Sans',
	size = 18,
	weight = 400
})

surface.CreateFont('rp.ui.15', {
	font = 'Sans',
	size = 15,
	weight = 550
})

local vguiFucs = { -- TODO: FIX
	['DListView'] = function(self, p)
		for k, v in ipairs(self.Columns) do
			v:SetTextColor(rp.col.Close)
		end
	end,
	['DCollapsibleCategory'] = function(self, p)
		self.Header:SetFont('rp.ui.20')
		self.Header:SetTextColor(rp.col.ButtonText)
	end,
	['DTextEntry'] = function(self, p)
		self:SetFont('rp.ui.20')
	end,
	['DLabel'] = function(self, p)
		self:SetFont('rp.ui.22')
		self:SetColor(rp.col.ButtonText)
	end,
	['DButton'] = function(self, p)
		self:SetFont('rp.ui.20')
	end
}

function rp.ui.Label(txt, font, x, y, parent)
	return ui.Create('DLabel', function(self, p)
		self:SetText(txt)
		self:SetFont(font)
		self:SetTextColor(rp.col.White)
		self:SetPos(x, y)
		self:SizeToContents()
		self:SetWrap(true)
		self:SetAutoStretchVertical(true)
	end, parent)
end

function ui.DermaMenu(p)
	local m = DermaMenu(p)
	m:SetSkin('Roleplay')

	return m
end

--
-- Draw Shit
--
local color_bg = Color(0, 0, 0)
local color_outline = Color(245, 245, 245)
local math_clamp = math.Clamp
local Color = Color

function rp.ui.DrawBar(x, y, w, h, perc)
	local color = Color(255 - (perc * 255), perc * 255, 0, 255)
	draw.OutlinedBox(x, y, math_clamp((w * perc), 3, w), h, color, color_outline)
end

function rp.ui.DrawProgress(x, y, w, h, perc)
	local color = Color(255 - (perc * 255), perc * 255, 0, 255)
	draw.OutlinedBox(x, y, w, h, color_bg, color_outline)
	draw.OutlinedBox(x + 5, y + 5, math_clamp((w * perc) - 10, 3, w), h - 10, color, color_outline)
end