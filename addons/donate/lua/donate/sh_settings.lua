
donations.language = {
//	somethingwrong = "Something went wrong, try later.",
	purchase_completed = "Спасибо за покупку! %s добавлены на ваш счёт.",
	permanent = "Куплено навсегда.",
	extend_for = "Истекает через %s, продлить за %sр.",
	purchase_for = "Купить за %sр.",
	duration = "Сроком на %s за %sр.",
	purchase_not_avalible = "Покупка недоступна, подождите пока %s истечёт.",
	purchase_ended = "%s истек."
}

donations.menuKey = KEY_F6

/* DISCOUNT */
donations.discount = 0


/* NOTIFICATION */

type_error = 1
type_generic = 3

notify = function(ply, type, string)
	rp.Notify(ply, type, string)
	//DarkRP.notify(ply, type, duration, string)
end

/* METHODS */

local qiwi = donations.newMethod()
qiwi.name = "QIWI"
qiwi.proceedPayment = function(self, ply, donation, duration)
	local data = donation:loadData()
	local price = duration && duration.price or donation:priceFunc(ply, data) or donation.price
	createInvoice(ply, "qiwi", donation, duration, data, price, function(ply, donation, duration, id, price)
		local hex = secret(id, price, function(hex)
			sendURL(ply, "https://urf.im/donations/qiwi/index.php?h="..hex.."&id="..id.."&price="..price)
		end)		
	end)
end
donations.addMethod(qiwi)

local robokassa = donations.newMethod()
robokassa.name = "МТС/Теле2/Билайн"
robokassa.proceedPayment = function(self, ply, donation, duration)
	local data = donation:loadData()
	local price = duration && duration.price or donation:priceFunc(ply, data) or donation.price
	createInvoice(ply, "robokassa", donation, duration, data, price, function(ply, donation, duration, id, price)
		local hex = secret(id, price, function(hex)
			sendURL(ply, "https://urf.im/donations/robokassa/index.php?h="..hex.."&id="..id.."&price="..price)
		end)		
	end)
end
donations.addMethod(robokassa)

local yandex = donations.newMethod()
yandex.name = "Yandex Деньги"
yandex.method = "PC"
yandex.proceedPayment = function(self, ply, donation, duration)
	local data = donation:loadData()
	local price = duration && duration.price or donation:priceFunc(ply, data) or donation.price
	createInvoice(ply, "yandex", donation, duration, data, price, function(ply, donation, duration, id, price)
		sendURL(ply, "https://urf.im/donations/yandex/index.php?id="..id.."&price="..price.."&type="..self.method)
	end)
end
donations.addMethod(yandex)

local robokassa = donations.newMethod()
robokassa.name = "Банковская Карта"
robokassa.proceedPayment = function(self, ply, donation, duration)
	local data = donation:loadData()
	local price = duration && duration.price or donation:priceFunc(ply, data) or donation.price
	createInvoice(ply, "robokassa", donation, duration, data, price, function(ply, donation, duration, id, price)
		local hex = secret(id, price, function(hex)
			sendURL(ply, "https://urf.im/donations/robokassa/index.php?h="..hex.."&id="..id.."&price="..price)
		end)		
	end)
end
donations.addMethod(robokassa)

local skins = donations.newMethod()
skins.name = "Скинами из Dota 2/CS:GO"
skins.method = "skins"
skins.proceedPayment = function(self, ply, donation, duration)
	local data = donation:loadData()
	local price = duration && duration.price or donation:priceFunc(ply, data) or donation.price
	createInvoice(ply, "skinpay", donation, duration, data, price, function(ply, donation, duration, id, price)
		sendURL(ply, "https://urf.im/donations/skins/index.php?orderid="..id.."&userid="..ply:SteamID64())
	end)
end
donations.addMethod(skins)

local donation = donations.new()
donation.name = "points" 
donation.notify = function(self, ply, duration, data) net.Start("donations.purchased") net.Send(ply) notify(ply, type_generic, 'Спасибо за покупку '..data..' кредитов!') end
donation.printName = "Кредиты"
donation.give = function(self, ply, duration, data) ply:AddCredits(data, 'auto purchase') end
donation.buildVGUI = function(self, parent_p) 
end
donation.saveData(data)
donation.loadData = function(self) return net.ReadInt(17) end
donation.priceFunc = function(self, ply, data)
	return math.Round(data * (1 - donations.discount))
end
donation.send = function(self, method, duration_id, data)
	net.Start("donations.buy")
		net.WriteString(self.name)
		net.WriteInt(method.id, 8)
		net.WriteInt(data, 17)
	net.SendToServer()
end
donations.add(donation)