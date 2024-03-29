
-----------------------------------------------------
rp.shop = rp.shop or {
	Stored = {},
	Weapons = {},
	Mapping = {}
}

local upgrade_mt = {}
upgrade_mt.__index = upgrade_mt
local count = 1

function rp.shop.CalculateAmount(amount)
	return (amount * rp.cfg.CreditsValue)
end

function rp.shop.Add(name, uid)
	local t = {
		Name = name,
		UID = uid:lower(),
		ID = count,
		Stackable = true
	}

	setmetatable(t, upgrade_mt)
	rp.shop.Stored[t.ID] = t
	rp.shop.Mapping[t.UID] = t
	count = count + 1

	return t
end

function rp.shop.Get(id)
	return rp.shop.Stored[id]
end

function rp.shop.GetByUID(uid)
	return rp.shop.Mapping[uid]
end

function rp.shop.GetTable()
	return rp.shop.Stored
end

-- Set
function upgrade_mt:SetStackable(stackable)
	self.Stackable = stackable

	return self
end

function upgrade_mt:SetCat(cat)
	self.Cat = cat

	return self
end

function upgrade_mt:SetDesc(desc)
	self.Desc = desc

	return self
end

function upgrade_mt:SetSkin(id)
	self.Skin = id

	return self
end

function upgrade_mt:SetIcon(icon)
	self.Icon = icon

	return self
end

function upgrade_mt:SetPrice(price)
	self.Price = price

	return self
end

function upgrade_mt:SetGetPrice(func)
	self._GetPrice = func

	return self
end

function upgrade_mt:SetCanBuy(func)
	self._CanBuy = func

	return self
end

function upgrade_mt:SetOnBuy(func)
	self._OnBuy = func

	return self
end

function upgrade_mt:SetWeapon(wep)
	rp.shop.Weapons[self:GetUID()] = wep
	self.Weapon = wep
	self:SetDesc('Вам будет даваться ' .. self:GetName() .. ' при возрождении.')
	self:SetStackable(false)

	self:SetOnBuy(function(self, pl)
		local weps = pl:GetVar('PermaWeapons')
		weps[#weps + 1] = wep
		pl:SetVar('PermaWeapons', weps)
	end)

	return self
end -- We don't need 20 PlayerLoadout hooks

function upgrade_mt:SetTeam(team)
	local CustomTeam = rp.teams[team]

	local AddToDesc
	if #CustomTeam.weapons > 0 then
		for k,v in ipairs(CustomTeam.weapons) do
			AddToDesc = (AddToDesc or "\nОружие:").." "..(weapons.GetStored(v) and weapons.GetStored(v).PrintName or v)
			AddToDesc = next(CustomTeam.weapons, k) and (AddToDesc..",") or (AddToDesc..".\n")
		end
	end
	local description = ''
	if CustomTeam.armor > 0 then
		description = "Броня: "..CustomTeam.armor.."\n"
	end
	if CustomTeam.health && CustomTeam.health > 0 then
		description = "Здоровье: "..CustomTeam.health.."\n"
	end
	AddToDesc = AddToDesc or ''

	self:SetDesc(self:GetDesc()..AddToDesc..description)
	self:SetIcon(CustomTeam.model[1])

	self:SetStackable(false)
	self:SetNetworked(true)

	return self
end

function upgrade_mt:AddHook(name, func)
	local uid = self:GetUID()

	hook(name, 'rp.upgrade.' .. name, function(pl, ...)
		if pl:HasUpgrade(uid) then
			func(pl, ...)
		end
	end)

	return self
end

function upgrade_mt:SetNetworked(networked)
	self.Networked = networked

	return self
end

function upgrade_mt:SetTimeStamps(ts1, ts2)
	self.TimeStamps = {ts1, ts2}

	return self
end

function upgrade_mt:SetHidden(hidden)
	self.Hidden = hidden

	return self
end

-- Get
function upgrade_mt:GetName()
	return self.Name
end

function upgrade_mt:GetCat()
	return self.Cat
end

function upgrade_mt:GetDesc()
	return self.Desc
end

function upgrade_mt:GetIcon()
	return self.Icon
end

function upgrade_mt:GetSkin()
	return self.Skin
end

function upgrade_mt:GetUID()
	return self.UID
end

function upgrade_mt:GetID()
	return self.ID
end

function upgrade_mt:GetWeapon()
	return self.Weapon
end

function upgrade_mt:GetPrice(pl)
	if self._GetPrice then return self:_GetPrice(pl) * rp.Discount end

	return self.Price * rp.Discount
end

function upgrade_mt:IsStackable()
	return (self.Stackable == true)
end

function upgrade_mt:IsNetworked()
	return (self.Networked == true)
end

function upgrade_mt:IsHidden()
	return (self.Hidden == true)
end

function upgrade_mt:IsInTimeLimit()
	if (self.TimeStamps) then
		local ostime = os.time()

		return (ostime >= self.TimeStamps[1] and ostime <= self.TimeStamps[2])
	end

	return true
end

function upgrade_mt:SetBuildInCategory(b)
	self.BuildInCategory = b
	return self
end

function upgrade_mt:GetBuildInCategory()
	return self.BuildInCategory
end

function upgrade_mt:CanSee(pl)
	if (self:IsHidden() or not self:IsInTimeLimit()) then return false end

	return true
end

function upgrade_mt:CanBuy(pl)
	if (not self:CanSee(pl)) then
		return false, 'How can you even see this?'
	elseif (not self:IsStackable()) and pl:HasUpgrade(self:GetUID()) then
		return false, 'Это у вас уже куплено!'
	elseif (not pl:CanAffordCredits(self:GetPrice(pl))) then
		return false, 'Вы не можете купить это. (Цена:' .. self:GetPrice(pl) .. ' Кредитов)'
	elseif self._CanBuy then
		return self:_CanBuy(pl)
	end

	return true
end

function upgrade_mt:OnBuy(pl)
	if self._OnBuy then
		self:_OnBuy(pl)
	end

	if self:IsNetworked() then
		local tab = pl:GetNetVar('Upgrades') or {}
		tab[#tab + 1] = self:GetID()
		pl:SetNetVar('Upgrades', tab)
	end

	if (self:GetWeapon() ~= nil) then
		pl:Give(self:GetWeapon())
	end
end

-- Player
function PLAYER:GetCredits()
	return self:GetNetVar('Credits') or 0
end

function PLAYER:CanAffordCredits(amount)
	return (self:GetCredits() >= amount)
end

if (CLIENT) then
	function PLAYER:HasUpgrade(uid)
		return (self:GetNetVar('Upgrades') or {})[uid]
	end
else
	function PLAYER:HasUpgrade(uid)
		return (self:GetVar('Upgrades', {})[uid] ~= nil)
	end
end