PLAYER.SteamName = PLAYER.SteamName or PLAYER.Name

function PLAYER:Name()
	return (self:GetNetVar('Name') or self:SteamName())
end

PLAYER.Nick = PLAYER.Name
PLAYER.GetName = PLAYER.Name

function PLAYER:GetMoney()
	return (self:GetNetVar('Money') or rp.cfg.StartMoney)
end

function PLAYER:GetKarma()
	return (self:GetNetVar('Karma') or rp.cfg.StartKarma)
end

local math_floor = math.floor
local math_min = math.min

function rp.Karma(pl, min, max)
	return pl:Karma(min, max)
end -- todo, remove this

function PLAYER:Karma(min, max)
	return math_floor(min + ((max - min) * (self:GetKarma() / 100)))
end

function PLAYER:Wealth(min, max)
	return math_min(math_floor(min + ((max - min) * (self:GetMoney() / 25000000))), max)
end

function PLAYER:HasLicense()
	return (self:GetNetVar('HasGunlicense') or self:GetJobTable().hasLicense)
end

if SERVER then
	function PLAYER:CanAfford(amount)
		if not amount or self.DarkRPUnInitialized then return false end

		return math.floor(amount) >= 0 and self:GetMoney() - math.floor(amount) >= 0
	end
else
	function PLAYER:CanAfford(amount)
		if not amount then return false end

		return math.floor(amount) >= 0 and self:GetMoney() - math.floor(amount) >= 0
	end
end