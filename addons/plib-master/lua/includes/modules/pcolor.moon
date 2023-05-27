export pcolor
pcolor or= {}

import rshift, lshift, bor, band from bit
import max, min, floor, abs from math

Color = Color

pcolor.ToHex = (col) ->
	string.format('#%02X%02X%02X', col.r, col.g, col.b)

pcolor.FromHex = (hex) ->
	r, g, b = string.match(hex, '#(..)(..)(..)')
	Color tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)

pcolor.EncodeArgb = (col) ->
	((col.a * 0x100 + col.r) * 0x100 + col.g) * 0x100 + col.b
		
pcolor.EncodeRgb = (col) ->
	(col.r * 0x100 + col.g) * 0x100 + col.b

pcolor.DecodeArgb = (num) ->
	b = band(num, 0xFF)
	g = band(rshift(num, 8), 0xFF)
	r = band(rshift(num, 16), 0xFF)
	a = band(rshift(num, 24), 0xFF)
	Color(r, g, b, a)

pcolor.DecodeRgb = (num) ->
	b = band(num, 0xFF)
	g = band(rshift(num, 8), 0xFF)
	r = band(rshift(num, 16), 0xFF)
	Color(r, g, b, a)

pcolor.LerpCopy = (frac1, c1, c2) ->
	frac2 = 1 - frac1
	Color(c1.r * frac1 + c2.r * frac2, c1.g * frac1 + c2.g * frac2, c1.b * frac1 + c2.b * frac2, c1.a * frac1 + c2.a * frac2)

pcolor.LerpEdit = (frac1, c1, c2) ->
	frac2 = 1 - frac1
	c1.r = c1.r * frac1 + c2.r * frac2
	c1.g = c1.g * frac1 + c2.g * frac2
	c1.b = c1.b * frac1 + c2.b * frac2
	c1.a = c1.a * frac1 + c2.a * frac2
	c1

pcolor.RgbToHsv = (r, g, b) ->
	if type(r) == 'table'
		r, g, b = r.r, r.g, r.b
	min = min(r, min(g, b))
	max = max(r, max(g, b))

	local h, s, v

	v = max
	delta = max - min
	if max ~= 0
		s = delta / max
	else
		s = 0
		h = -1
		return h, s, v

	if r == max
		h = (g - b) / delta
	elseif g == max
		h = 2 + (b - r) / delta
	else
		h = 4 + (r - g) / delta
	
	h *= 60
	
	if h < 0
		h += 360

	return h, s, v

pcolor.HsvToRgb = (h, s, v) ->
	if s == 0
		return v, v, v

	i = floor( h )
	f = h - i
	p = v * (1 - s)
	q = v * (1 - s * f)
	t = v * (1 - s * (1 - f))
	switch i
		when 0
			v, t, p
		when 1
			q, v, p
		when 2
			p, v, t
		when 3
			p, q, v
		when 4
			t, p, v
		else
			v, p, q
