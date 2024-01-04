
-----------------------------------------------------
rp.abilities.Add('Money', 'Получить Деньги')
	:SetDescription([[Добавляет Т.1000 на твой аккаунт.

Можно использовать раз в 17 часов.
]])
	:SetSound(Sound("vo/npc/male01/yeah02.wav"))
	:SetColor(Color(34, 139, 34))
	:SetCooldown(17 * 3600)
	:SetModel('models/props_c17/cashregister01a.mdl')
	:SetPlayTime(0 * 3600)
	:OnUse(function(self, ply) ply:AddMoney(1000) end)



rp.abilities.Add('Time', 'Получить Время')
	:SetDescription([[Добавляет 1 час к твоему игровому времени.

Можно использовать раз в 18 часов.
]])
	:SetCooldown(18 * 3600)
	:SetSound(Sound("vo/coast/odessa/male01/nlo_cheer02.wav"))
	:SetColor(Color(0, 255, 255))
	:SetModel('models/props_combine/breenclock.mdl')
	:SetPlayTime(1 * 3600)
	:OnUse(function(self, ply) ply:AddPlayTime(1 * 3600) end)



rp.abilities.Add('Heal', 'Вылечиться')
	:SetDescription([[Моментально восстанавливает твое здоровье.

Можно использовать раз в 2 часа.
]])
	:SetCooldown(2 * 3600)
	:SetSound(Sound( "HealthKit.Touch" ))
	:SetColor(Color(127, 255, 0))
	:SetModel('models/Items/HealthKit.mdl')
	:SetPlayTime(5 * 3600)
	:SetCanUse(function(self, ply) return ply:Health() < ply:GetMaxHealth() end)
	:SetCantUseReason(function(self, ply) return 'вы здоровы' end)
	:OnUse(function(self, ply) ply:SetHealth(ply:GetMaxHealth()) end)



rp.abilities.Add('Armor', 'Получить Броню')
	:SetDescription([[Дает 20-70 брони в случайном порядке на 1 жизнь.

Можно использовать раз в 2.5 часа.
]])
	:SetCooldown(2.5 * 3600)
	:SetSound(Sound('items/suitchargeok1.wav'))
	:SetColor(Color(70, 130, 180))
	:SetModel('models/Items/battery.mdl')
	:SetPlayTime(10 * 3600)
	:OnUse(function(self, ply) ply:GiveArmor(math.random(20, 70)) end)



rp.abilities.Add('Event', 'Начать ивент ЗП')
	:SetDescription([[Запускает Ивент Зарплаты, при котором все получают двойную зарплату в пятнадцати минут.

Можно использовать раз в Неделю.
]])
	:SetCooldown(7 * 24 * 3600)
	:SetModel('models/props_c17/SuitCase_Passenger_Physics.mdl')
	:SetPlayTime(30 * 3600)
	:SetSound(Sound('vo/coast/odessa/male01/nlo_cheer04.wav'))
	:SetColor(Color(85, 107, 47))
	:SetCanUse(function() return !rp.EventIsRunning('Salary') end)
	:SetCantUseReason(function(self, ply) return 'ивент уже идёт' end)
	:OnUse(function(self, ply) RunConsoleCommand('ba', 'startevent', 'salary', '15mi') end)



local weps = {"swb_pistol", "swb_smg", "swb_shotgun", "swb_357"}
rp.abilities.Add('Gun', 'Оружие')
	:SetDescription([[Выдает 1 случайное оружие тебе в руки (Pistol, SMG, Shotgun, 357).

Можно использовать раз в 24 часа.
]])
	:SetCooldown(35 * 3600)
	:SetModel('models/weapons/w_pistol.mdl')
	:SetColor(Color(128, 0, 128))
	:SetPlayTime(50 * 3600)
	:SetSound(Sound('items/ammo_pickup.wav'))
	:OnUse(function(self, ply) ply:Give(table.Random(weps)) end)



rp.abilities.Add('Jail', 'Выйти из тюрьмы')
	:SetDescription([[Моментально выпускает тебя из тюрьмы.

Можно использовать раз в 30 часов.
]])
	:SetSound(Sound('physics/plastic/plastic_box_break1.wav'))
	:SetColor(Color(0, 0, 128))
	:SetCooldown(30 * 3600)
	:SetModel('models/weapons/w_crowbar.mdl')
	:SetPlayTime(80 * 3600)
	:SetCanUse(function(self, ply) return ply:IsArrested() end)
	:SetCantUseReason(function(self, ply) return 'вы не арестованы' end)
	:OnUse(function(self, ply) ply:UnArrest() end)