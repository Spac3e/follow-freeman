local math_round = math.Round
local math_max = math.max
local CurTime = CurTime
rp.Foods = {}

function rp.AddFoodItem(name, mdl, amount, price, allowed)
	local t = {}
	for k, v in pairs(allowed) do
		t[v] = true
	end
	rp.Foods[name] = {
		model = mdl,
		amount = amount,
		price = price,
		allowed = t
	} -- to laz

	rp.Foods[#rp.Foods + 1] = {
		name = name,
		model = mdl,
		amount = amount,
		price = price,
		allowed = t
	}
end

function PLAYER:GetHunger()
	return self:Alive() and math_max(math_round((((self:GetNetVar('Energy') or (CurTime() + rp.cfg.HungerRate)) - CurTime()) / rp.cfg.HungerRate) * 100, 0), 0) or 100
end

nw.Register('Energy', {
	Read = function() return net.ReadUInt(32) end,
	Write = function(v) return net.WriteUInt(v, 32) end,
	LocalVar = true
})