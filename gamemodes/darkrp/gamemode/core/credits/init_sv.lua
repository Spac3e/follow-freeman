util.AddNetworkString 'rp.CreditShop'

function PLAYER:AddCredits(amount, note, cback)
	rp.data.AddCredits(self:SteamID(), amount, note, function()
		self:SetNetVar('Credits', self:GetCredits() + amount)
		if (cback) then cback() end
	end)
end

function PLAYER:TakeCredits(amount, note, cback)
	rp.data.AddCredits(self:SteamID(), -amount, note, function()
		self:SetNetVar('Credits', self:GetCredits() - amount)
		if (cback) then cback() end
	end)
end

function PLAYER:GetUpgradeCount(uid)
	return (self:GetVar('Upgrades', {})[uid] or 0)
end

function PLAYER:GetPermaWeapons()
	return self:GetVar('PermaWeapons', {})
end

function rp.shop.OpenMenu(pl)
	if pl.OpeningCreditMenu then return end
	pl.OpeningCreditMenu = true
	rp.data.LoadCredits(pl, function()
		pl.OpeningCreditMenu = false
		local ret = {}
		for k, v in ipairs(rp.shop.GetTable()) do
			if (!v:CanSee(pl)) then continue end
			
			local canbuy, reason = v:CanBuy(pl)
			if (not canbuy) then
				ret[v:GetID()] = reason
			else
				ret[v:GetID()] = v:GetPrice(pl)
			end
		end
		net.Start('rp.CreditShop')
			net.WriteUInt(table.Count(ret), 8)
			for k, v in pairs(ret) do
				if isstring(v) then
					net.WriteBool(false)
					net.WriteUInt(k, 8)
					net.WriteString(v)
				else
					net.WriteBool(true)
					net.WriteUInt(k, 8)
					net.WriteUInt(v, 16)
				end
			end
		net.Send(pl)
	end)
end
rp.AddCommand('/upgrades', rp.shop.OpenMenu)


-- Data
local db = rp._Credits


function rp.data.AddCredits(steamid, amount, note, cback)
	db:Query('INSERT INTO `kshop_credits_transactions` (`Time`, `SteamID`, `Change`, `Note`) VALUES(?, ?, ?, ?);', os.time(), steamid, amount, (note or ''), cback)
end

function rp.data.LoadCredits(pl, cback)
	db:Query('SELECT COALESCE(SUM(`Change`), 0) AS `Credits` FROM `kshop_credits_transactions` WHERE `SteamID`="' .. pl:SteamID() .. '";', function(data)
		if IsValid(pl) then
			pl:SetNetVar('Credits', tonumber(data[1]['Credits']))
			if cback then cback(data) end
		end
	end)
end

function rp.data.AddUpgrade(pl, id)
	local upg_obj = rp.shop.Get(id)
	local canbuy, reason = upg_obj:CanBuy(pl)

	if (not canbuy) then
		pl:Notify(NOTIFY_ERROR, rp.Term('CantPurchaseUpgrade'), reason)
	else
		local cost = upg_obj:GetPrice(pl)
		pl:TakeCredits(cost, 'Purchase: ' .. upg_obj:GetUID(), function()
		//db:Query("INSERT INTO `kshop_credits_transactions` VALUES('" .. os.time() .. "', '" .. pl:SteamID() .. "', '" .. -cost .. "', 'Purchase: " .. upg_obj:GetUID() .. "');", function(dat)
			db:Query("INSERT INTO `kshop_purchases` VALUES('" .. os.time() .. "', '" .. pl:SteamID() .. "', '" .. upg_obj:GetUID() .. "');", function(dat)
				for k, v in ipairs(player.GetAll()) do v:ChatPrint(pl:Name() .. " has bought " .. upg_obj:GetName() .. " with their credits!"); end
				
				local upgrades = pl:GetVar('Upgrades')
				upgrades[upg_obj:GetUID()] = upgrades[upg_obj:GetUID()] and (upgrades[upg_obj:GetUID()] + 1) or 1
				pl:SetVar('Upgrades', upgrades)

				upg_obj:OnBuy(pl)
				
				rp.shop.OpenMenu(pl)
			end)
		end)
	end
end

hook('PlayerAuthed', 'rp.shop.LoadCredits', function(pl)
	rp.data.LoadCredits(pl, function()
		if IsValid(pl) then
			pl:ChatPrint('You have ' .. pl:GetCredits() .. ' credits to spend.')
		end
	end)
	db:Query('SELECT `Upgrade` FROM `kshop_purchases` WHERE `SteamID`="' .. pl:SteamID() .. '";', function(data)
		if IsValid(pl) then
			local upgrades 	= {}
			local weps 		= {}
			local networked = {}
			for k, v in ipairs(data) do
				local uid = v.Upgrade
				local obj = rp.shop.GetByUID(uid)
				local wep = rp.shop.Weapons[uid]
				upgrades[uid] = upgrades[uid] and (upgrades[uid] + 1) or 1
				if (wep ~= nil) then
					pl:Give(wep)
					weps[#weps + 1] = wep
				end
				if (obj ~= nil) and obj:IsNetworked() then
					networked[#networked + 1] = obj:GetID()
				end
			end
			pl:SetVar('Upgrades', upgrades)
			pl:SetVar('PermaWeapons', weps)
			if (#networked > 0) then
				pl:SetNetVar('Upgrades', networked)
			end
			hook.Call('PlayerUpgradesLoaded', nil, pl)
		end
	end)
end)

hook('PlayerLoadout', 'rp.shop.PlayerLoadout', function(pl)
	for k, v in ipairs(pl:GetPermaWeapons()) do
		pl:Give(v)
	end
end)

rp.AddCommand('/buyupgrade', function(pl, text, args)
	if (not args[1]) or (not rp.shop.Get(tonumber(args[1]))) then return end
	rp.data.AddUpgrade(pl, tonumber(args[1]))
end)