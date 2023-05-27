rp.hats = rp.hats or {}
rp.hats.list = rp.hats.list or {}
rp.hats.mappings = rp.hats.mappings or {}
local c = 0

function rp.AddHat(data)
	c = c + 1
	data.model = string.lower(data.model or "")
	data.model = string.Replace(data.model, "\\", "/")
	data.model = string.gsub(data.model, "[\\/]+", "/")

	rp.hats.list[data.model] = {
		name = data.name or 'unkown',
		model = data.model,
		price = data.price,
		ID = c,
		attachment = data.attachment,
		scale = data.scale or 1,
		bone = (!data.attachment && nil) || data.bone || 'ValveBiped.Bip01_Head1',
		modifyClientsideModel = data.modifyClientsideModel or function(self, ply, model, pos, ang) return model, pos, ang end
	}

	rp.hats.mappings[c] = data.model
end

function PLAYER:SetHat(mdl)
	if (mdl == nil) then
		self:SetNetVar('Hat', nil)
	else
		self:SetNetVar('Hat', rp.hats.list[mdl].ID)
	end
end

function PLAYER:GetHat()
	return self:GetNetVar('Hat') and rp.hats.mappings[self:GetNetVar('Hat')]
end

hook('rp.AddUpgrades', 'rp.Cosmetics.Hats', function()
	for k, v in SortedPairsByMemberValue(rp.hats.list, 'price', false) do
		rp.shop.Add(v.name, 'hat_' .. v.name):SetCat('Шапки'):SetDesc('Купить ' .. v.name .. ' навсегда.'):SetPrice(v.price < 1000000 and math.floor(v.price / 500) or math.floor(v.price / 2500)):SetCanBuy(function(self, pl)
			if (pl:HasUpgrade(pl, 'hat_' .. v.name)) or table.HasValue(pl:GetNetVar('HatData') or {}, v.model) then return false, 'Она у вас уже есть.' end

			return true
		end):SetOnBuy(function(self, pl)
			ba.data.SetHat(pl, v.model)
			local HatData = pl:GetNetVar('HatData') or {}
			table.insert(HatData, v.model)
			pl:SetNetVar('HatData', HatData)
		end)
	end
end)