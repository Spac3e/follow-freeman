donations = {list = {}, methods = {}}

type_error = 1
type_generic = 0
notify = function() end

donations.menuKey = KEY_F6

function sendURL(ply, url)
	net.Start("donations.url")
		net.WriteString(url)
	net.Send(ply)
end

local meta = FindMetaTable("Player")
function meta:getDonation(name)
	return self.donations && self.donations[name]
end

function meta:hasParent(s)
	for k, v in pairs(self.donations or {}) do
		local d = donations.get(k)
		if d.based && table.HasValue(d.based, s) then
			return k
		end
	end
	return false
end

function meta:hasBased(t)
	for k, v in pairs(self.donations or {}) do
		if table.HasValue(t, k) then
			return k
		end
	end
	return false
end

local base_donation = {}
base_donation.active = true
base_donation.name = "base donation"
base_donation.printName = "Print name"
base_donation.desc = "Description"
base_donation.giveOnce = true
base_donation.price = 0
base_donation.give = function(ply, duration, data) end
base_donation.take_notify = function(self, ply) notify(ply, type_error, 4, string.format(donations.language.purchase_ended, self.printName)) end
base_donation.notify = function(self, ply, duration, data) net.Start("donations.purchased") net.Send(ply) notify(ply, type_error, 4, string.format(donations.language.purchase_completed, self.printName)) end
base_donation.take = function(ply) end
base_donation.category = "Base category"
base_donation.buildVGUI = function(self, parent) return false end
base_donation.loadData = function(self) return nil end
base_donation.priceFunc = function(self, ply, data) return false end
base_donation.saveData = function(self, data) return data && sql.SQLStr(data) or "NULL" end
base_donation.loadSQLData = function(self, data) return data end
base_donation.send = function(self, method, duration_id)
	net.Start("donations.buy")
		net.WriteString(self.name)
		net.WriteInt(method.id, 8)
		if duration_id then
			net.WriteInt(duration_id, 8)
		end
	net.SendToServer()
end

local base_method = {}
base_method.name = "Yandex money"
base_method.onClick = function(self, donation, duration, data)
	donation:send(self, duration && duration.id, data)
end
base_method.proceedPayment = function(ply, donation, duration_id, id)
end

function donations.newMethod()
	return table.Copy(base_method)
end

function donations.addMethod(t)
	t.id = table.insert(donations.methods, t)
end

function donations.add(t)
	local id = table.insert(donations.list, t)
	for k, v in pairs(t.duration or {}) do
		v.id = k
		if v.active == nil then v.active = true end
	end
	return id
end

function donations.new()
	return table.Copy(base_donation)
end

function donations.get(s)
	for k, v in pairs(donations.list) do
		if v.name == s then return v end
	end
end

function donations.getMethod(n)
	return donations.methods[n]
end

function donations.getMethodByName(n)
	for k, v in pairs(donations.methods) do
		if v.method == n then
			return v
		end
	end
end