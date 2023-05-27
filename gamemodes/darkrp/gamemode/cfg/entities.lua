
-----------------------------------------------------
rp.cfg.Downtown = game.GetMap() == 'rp_downtown_sup_b5c'


--rp.AddEntity("Бициллин", "ent_stdmeds", "models/jaanus/aspbtl.mdl", 100, 4, "/buystdmeds")

--if isIndsutrial then
--	rp.AddEntity("Багги", {
--		ent = "     ",
--		model = "models/buggy.mdl",
--		price = 30000,
--		max = 1,
--		cmd = "/buycar",
--		allowed = {TEAM_GORDON_FREEMAN},
--		onSpawn = function(ent, pl)
--			ent:SpawnVehicle("hl2jeepgun", pl)
--		end
--	})
--end
if isSerious then
	rp.AddEntity("АПК", {
		ent = "prop_vehicle_zapc",
		model = "models/combine_apc.mdl",
		price = 1500,
		max = 1,
		cmd = "/buycar",
		allowed = {TEAM_APCPILOT},
		onSpawn = function(ent, pl)
			timer.Simple(1, function()
				print(ent, pl, ent.DriverSeat)
				ent.DriverSeat.ItemOwner = pl
			end)
		--	ent:SpawnVehicle("prop_vehicle_zapc", pl)
		end
	})
end

if isIndsutrial then
	rp.AddEntity("АПК", {
		ent = "prop_vehicle_zapc",
		model = "models/combine_apc.mdl",
		price = 5000,
		max = 1,
		cmd = "/buycar",
		allowed = isSerious && {TEAM_APCPILOT}|| {TEAM_APCCAP},
		onSpawn = function(ent, pl)
			timer.Simple(1, function()
				print(ent, pl, ent.DriverSeat)
				ent.DriverSeat.ItemOwner = pl
			end)
		--	ent:SpawnVehicle("prop_vehicle_zapc", pl)
		end
	})
end

rp.AddEntity("Противогаз и перчатки", {
	ent = "ent_gasmask",
	model = "models/tnb/items/gasmask.mdl",
	price = 300,
	max = 1,
	cmd = "/buymask1",
	pocket = false,
	allowed = rp.GetFactionTeams({FACTION_OUTLAWS})
})

rp.AddEntity("Бандана и перчатки", {
	ent = "ent_facewrap",
	model = "models/tnb/items/facewrap.mdl",
	price = 300,
	max = 1,
	cmd = "/buymask2",
	pocket = false,
	allowed = rp.GetFactionTeams({FACTION_OUTLAWS})
})

rp.AddEntity("Маленькое табло", {
	ent = "bt_notiboard_small",
	model = "models/props_junk/ravenholmsign.mdl",
	price = 100,
	max = 1,
	cmd = "/buystabl",
	pocket = false,
	allowed = rp.GetFactionTeams({FACTION_CWU, FACTION_REBEL, FACTION_HECU, FACTION_OUTLAWS})
})
rp.AddEntity("Среднее табло", {
	ent = "bt_notiboard_medium",
	model = "models/props_junk/ravenholmsign.mdl",
	price = 150,
	max = 1,
	cmd = "/buymtabl",
	pocket = false,
	allowed = rp.GetFactionTeams({FACTION_CWU, FACTION_REBEL, FACTION_HECU, FACTION_OUTLAWS})
})
rp.AddEntity("Большое табло", {
	ent = "bt_notiboard_big",
	model = "models/props_junk/ravenholmsign.mdl",
	price = 200,
	max = 1,
	cmd = "/buybtabl",
	pocket = false,
	allowed = rp.GetFactionTeams({FACTION_CWU, FACTION_REBEL, FACTION_HECU, FACTION_OUTLAWS})
})

rp.AddEntity("Картина", {
	ent = "ent_picture",
	model = "models/hunter/plates/plate1x1.mdl",
	price = 100,
	max = 2,
	cmd = "/buypic",
	pocket = false,
})

/*
rp.AddEntity("Флаг", {
	ent = "flag",
	model = "models/props_c17/signpole001.mdl",
	price = 700,
	max = 1,
	cmd = "/buyflag",
	pocket = false,
})
*/
rp.AddEntity("Металлоискатель", {
	ent = "metal_detector",
	model = "models/props_wasteland/interior_fence002e.mdl",
	price = 100,
	max = 1,
	cmd = "/buymetal",
	pocket = false,
	allowed = rp.GetFactionTeams({FACTION_COMBINE, FACTION_CWU, FACTION_REBEL, FACTION_HECU, FACTION_OUTLAW})
})
/*
rp.AddEntity("Энергополе", {
	ent = "combine_forcefield",
	model = "TEAM_CMR, TEAM_SEC, TEAM_OTAOVL, TEAM_UNIONOFC",
	price = 5000,
	max = 1,
	cmd = "/buyforcefild",
	pocket = false,
	allowed = {TEAM_DVL, TEAM_CMR, TEAM_SEC, TEAM_OTAOVL, TEAM_UNIONOFC}, 
})
*/

-- DJ
rp.AddEntity("Радио", {
	ent = "media_radio",
	model = "models/props_lab/citizenradio.mdl",
	price = 200,
	max = 1,
	cmd = "/buyradio",
	allowed = {TEAM_CWU_LEADER, TEAM_CWU_RADIOOWNER, TEAM_REBEL_VETERAN, TEAM_REBEL_BARMEN, TEAM_JUD, ALEX_TEAM},
	pocket = false
})

rp.AddEntity("Телевизор", {
	ent = "media_tv",
	model = "models/props/cs_office/TV_plasma.mdl",
	price = 1000,
	max = 1,
	cmd = "/buytv",
	allowed = {TEAM_CWU_LEADER, TEAM_CINEMAOWNER, TEAM_ELI, TEAM_KLEINER, TEAM_REBEL_BARMEN, TEAM_JUD, ALEX_TEAM},
	pocket = false
})



-- Notes
rp.AddEntity("Записка", {
	ent = "ent_note",
	model = "models/props_c17/paper01.mdl",
	price = 50,
	max = 2,
	cmd = "/note",
	pocket = false,
	onSpawn = function(ent, pl)
		if (IsValid(pl.LastNote)) then
			pl.LastNote:Remove()
		end

		pl.LastNote = ent
		rp.Notify(pl, NOTIFY_GREEN, rp.Term("USENote"))
	end
})

rp.AddEntity("Гражданская одежда", {
	ent = "ent_disguise",
	model = "models/props_c17/SuitCase_Passenger_Physics.mdl",
	price = 50,
	max = 2,
	cmd = "/citizendisc",
	pocket = false,
	allowed = {TEAM_ELI, TEAM_AGP, ALEX_TEAM},
	onSpawn = function(ent, pl)
		ent.Faction = FACTION_CITIZEN
	end
})

rp.AddEntity("Форма ГО", {
	ent = "ent_disguise",
	model = "models/props_c17/SuitCase_Passenger_Physics.mdl",
	price = 50,
	max = 2,
	cmd = "/combinedisc",
	pocket = false,
	allowed = {TEAM_BARNEY, TEAM_AGP, ALEX_TEAM},
	onSpawn = function(ent, pl)
		ent.Faction = FACTION_COMBINE
	end
})

rp.AddEntity("Раздатчик Брони", {
	ent = "armor_lab", 
	model = "models/props_combine/suit_charger001.mdl", 
	price = 500, 
	max = 4, 
	cmd = "/buyarmorlab", 
	pocket = false,
	allowed = {TEAM_REBEL_BARMEN, TEAM_ELI, TEAM_LEENG, TEAM_KLEINER, TEAM_AGP, TEAM_VASIL, TEAM_STALKER, TEAM_CPMEDIC3, TEAM_INFORS, TEAM_ODESSA, TEAM_SWAT_MED, TEAM_MSOLD, ALEX_TEAM}, 
})	

rp.AddEntity("Раздатчик Здоровья", {
	ent = "med_lab", 
	model = "models/props_combine/suit_charger001.mdl", 
	price = 100, 
	max = 4, 
	cmd = "/buymedlab", 
	pocket = false,
	allowed = {TEAM_REBEL_BARMEN, TEAM_CWU_MEDIC, TEAM_ELI, TEAM_LEGION_MED, TEAM_KLEINER, TEAM_CPMEDIC3, TEAM_VASIL, TEAM_ODESSA, TEAM_SWAT_MED, TEAM_MSOLD, ALEX_TEAM}, 
})



--rp.AddEntity("Форма повстанца", {
--	ent = "ent_disguise",
--	model = "models/props_c17/SuitCase_Passenger_Physics.mdl",
--	price = 50,
--	max = 2,
--	cmd = "/rebelndisc",
--	pocket = false,
--	allowed = TEAM_SPY,
--	onSpawn = function(ent, pl)
--		ent.Faction = FACTION_REBEL
--	end
--})

rp.AddEntity("Рацион Гражданского", {
	ent = "urf_foodsystem_ration_normal",
	model = "models/weapons/w_packatc.mdl",
	allowed = {},
	price = 50,
	max = 3,
	allowed = {TEAM_VORTI},
	cmd = "/buyration",
}) 
  
rp.AddEntity("Рацион ГСР", {
	ent = "urf_foodsystem_ration_cwu",
	model = "models/weapons/w_packatp.mdl",
	allowed = {},
	price = 75,
	max = 3,
	allowed = {TEAM_VORTI},
	cmd = "/buyrationcwu",

}) 
rp.AddEntity("Увеличенный Рацион", {
	ent = "urf_foodsystem_ration_expanded",
	model = "models/weapons/w_packatl.mdl",
	allowed = {},
	price = 100,
	max = 3,
	allowed = {TEAM_SPECTATOR},
	cmd = "/buyrationbig",
}) 
  
rp.AddEntity("Рацион ГО", {
	ent = "urf_foodsystem_ration_mpf",
	model = "models/weapons/w_packatm.mdl",
	allowed = {},
	price = 150,
	max = 3,
	allowed = {TEAM_SPECTATOR},
	cmd = "/buyrationmpf",
}) 

-- Gun Dealer
if !isSerious then
rp.AddWeapon("357", "models/weapons/w_357.mdl", "swb_357", 1350, 10, false, 900, false, {TEAM_REBEL_BARMEN})
rp.AddWeapon("SMG", "models/weapons/w_smg1.mdl", "swb_smg", 1350, 10, false, 900, false, {TEAM_REBEL_BARMEN})
rp.AddWeapon("AR2", "models/weapons/w_irifle.mdl", "swb_ar2", 1350, 10, false, 900, false, {TEAM_REBEL_BARMEN})
rp.AddWeapon("SPAS-12", "models/weapons/w_shotgun.mdl", "swb_shotgun", 1350, 10, false, 900, false, {TEAM_REBEL_BARMEN})
rp.AddWeapon("Pistol", "models/weapons/w_pistol.mdl", "swb_pistol", 1350, 10, false, 900, false, {TEAM_REBEL_BARMEN})
end

if isSerious then
rp.AddWeapon("Боевой Нож", "models/weapons/w_knife_ct.mdl", "swb_knife", 800, 5, false, 120, false, {TEAM_REBEL_BARMEN})
rp.AddWeapon("p228", "models/weapons/w_pist_p228.mdl", "swb_p228", 1350, 5, false, 210, false, {TEAM_REBEL_BARMEN})
rp.AddWeapon("MAC-10", "models/weapons/w_smg_mac10.mdl", "swb_mac10", 2000, 5, false, 300, false, {TEAM_REBEL_BARMEN})
rp.AddWeapon("UMP", "models/weapons/w_smg_ump45.mdl", "swb_ump", 3000, 5, false, 400, false, {TEAM_REBEL_BARMEN})
rp.AddWeapon("M4A1", "models/weapons/w_rif_m4a1.mdl", "swb_m4a1", 5000, 5, false, 800, false, {TEAM_REBEL_BARMEN})
end
-- Black Market Dealer
if !isSerious then
rp.AddShipment("C4", "models/weapons/2_c4_planted.mdl", "weapon_c4", 25000, 5, false, 25000, false, {TEAM_REBEL_BARMEN})
end
--rp.AddShipment("Взломщики", "models/weapons/w_c4.mdl", "keypad_cracker", 1500, 5, false, 1050, false, {TEAM_BMIDEALER, TEAM_MARAD})
--rp.AddShipment("Отмычки", "models/weapons/w_crowbar.mdl", "lockpick", 1300, 5, false, 950, false, {TEAM_BMIDEALER, TEAM_MARAD})
rp.AddShipment("Броня", "models/props_junk/cardboard_box004a.mdl", "armor_piece_full", 120, 10, false, 750, false, {TEAM_REBEL_BARMEN, TEAM_ELI, TEAM_KLEINER, TEAM_AGP, TEAM_CPMEDIC3, TEAM_CPMEDIC2, TEAM_CPMEDIC1, TEAM_INFORS})
--rp.AddShipment("Монтировка", "models/weapons/w_crowbar.mdl", "weapon_crowbar", 800, 10, false, 700, false, {TEAM_BMIDEALER})
--rp.AddShipment("Дубинка", "models/weapons/w_stunbaton.mdl", "weapon_stunstick", 850, 10, false, 650, false, {TEAM_BMIDEALER})
--rp.AddShipment("Нож", "models/weapons/w_knife_t.mdl", "swb_knife", 1000, 10, false, 675, false, {TEAM_BMIDEALER})
-- Bartender


-- drug dealer
rp.AddDrug("Трава", "durgz_weed", "models/katharsmodels/contraband/zak_wiet/zak_wiet.mdl", 50, TEAM_REBEL_BARMEN)
--rp.AddDrug("Спайс", "durgz_spice", "models/katharsmodels/contraband/zak_wiet/zak_wiet.mdl", 1000, TEAM_DRUGDEALER)
--rp.AddDrug("Героин", "durgz_heroine", "models/katharsmodels/syringe_out/syringe_out.mdl", 50, TEAM_REBEL_BARMEN)
--rp.AddDrug("Сигареты", "durgz_cigarette", "models/boxopencigshib.mdl", 15, TEAM_DRUGDEALER)
--rp.AddDrug("ЛСД", "durgz_lsd", "models/smile/smile.mdl", 300, TEAM_DRUGDEALER)
--rp.AddDrug("Грибы", "durgz_mushroom", "models/ipha/mushroom_small.mdl", 275, TEAM_DRUGDEALER)
rp.AddDrug("Кокаин", "durgz_cocaine", "models/cocn.mdl", 100, TEAM_REBEL_BARMEN)
--rp.AddDrug("Синий мет", "durgz_meth", "models/cocn.mdl", 150, TEAM_REBEL_BARMEN)
--rp.AddDrug("Соли для ванн", "durgz_bathsalts", "models/props_lab/jar01a.mdl", 15, TEAM_DRUGDEALER)
/*
rp.AddEntity("Трава", {
	ent = "durgz_weed",
	model = "models/katharsmodels/contraband/zak_wiet/zak_wiet.mdl",
	price = 50,
	max = 5,
	cmd = "/buyweed",
	allowed = {TEAM_REBEL_BARMEN},
	pocket = false
})
*/
rp.AddEntity("Аптечка", {
	ent = "ent_medpack",
	model = "models/Items/HealthKit.mdl",
	price = 100,
	max = 5,
	cmd = "/buyasp",
	allowed = {TEAM_REBEL_BARMEN, TEAM_CWU_MEDIC, TEAM_VORTI, TEAM_CWU_LEADER, TEAM_ELI, TEAM_REBEL_MEDIC, TEAM_AGP, TEAM_CPMEDIC3, TEAM_CPMEDIC2, TEAM_CPMEDIC1},
	pocket = false
})
rp.AddEntity("Аспирин", {
	ent = "ent_milk",
	model = "models/props_lab/jar01b.mdl",
	price = 300,
	max = 5,
	cmd = "/buyasp",
	allowed = {TEAM_REBEL_BARMEN},
	pocket = false
})
rp.AddEntity("Пиво", {
	ent = "durgz_alcohol",
	model = "models/drug_mod/alcohol_can.mdl",
	price = 25,
	max = 5,
	cmd = "/buyalc",
	allowed = {TEAM_REBEL_BARMEN},
	pocket = false
})
rp.AddEntity("Пиво", {
	ent = "durgz_alcohol",
	model = "models/drug_mod/alcohol_can.mdl",
	price = 25,
	max = 5,
	cmd = "/buyalc",
	allowed = rp.GetFactionTeams({FACTION_REBEL, FACTION_HECU, FACTION_OUTLAWS}),
	pocket = false
})
rp.AddEntity("Горшок", {
	ent = "weed_plant",
	model = "models/alakran/marijuana/pot_empty.mdl",
	price = 25,
	max = 5,
	cmd = "/buypot",
	allowed = rp.GetFactionTeams({FACTION_REBEL, FACTION_HECU, FACTION_OUTLAWS}),
	pocket = false
})
rp.AddEntity("Семена", {
	ent = "seed_weed",
	model = "models/Items/AR2_Grenade.mdl",
	price = 10,
	max = 20,
	cmd = "/buyseed",
	allowed = rp.GetFactionTeams({FACTION_REBEL, FACTION_HECU, FACTION_OUTLAWS})
})
rp.AddEntity("Мини Лаба", {
	ent = "drug_lab",
	model = "models/props_lab/crematorcase.mdl",
	price = 300,
	max = 3,
	cmd = "/buydruglab",
	allowed = {TEAM_REBEL_COLONEL, TEAM_REBEL_CAPTAIN, TEAM_REBEL_VETERAN, TEAM_ELI, TEAM_KLEINER, TEAM_BARNEY, TEAM_GORDON_FREEMAN, TEAM_AGP},
	pocket = false
})

rp.AddEntity("Микроволновка", {
	ent = "microwave",
	model = "models/props/cs_office/microwave.mdl",
	price = 200,
	max = 4,
	cmd = "/buymicrowave",
	allowed = {TEAM_CWU_LEADER, TEAM_REBEL_BARMEN, TEAM_EMPLOYER},
	pocket = false
})

-- Money Printers
local money_printers = {}

local function reachedMoneyPrinterLimit(ply)
	local i = 0
	for k=1, #money_printers do
		i = i + ply:GetCount(money_printers[k]) or 0
		if i >= rp.cfg.MaxPrinters then
			return false, 'MaxMoneyPrinterReached'
		end
	end
	return true
end

local function addPrinter(name, t)
	money_printers[#money_printers+1] = t.ent
	if SERVER then
		t.customCheck = reachedMoneyPrinterLimit
	end
	t.max = t.max or 1
	t.pocket = false
	t.price = math.floor(t.price * 0.7)
	t.cmd = '/'..t.ent
	t.customCheckFailMsg = rp.Term('MaxMoneyPrinterReached')
	rp.AddEntity(name, t)
end

addPrinter("Генератор токенов", {
	ent = "mp_basic_5lvl",
	model = "models/props_c17/consolebox01a.mdl",
	price = 100,
	max = 2,
	allowed = rp.GetFactionTeams({FACTION_CITIZEN, FACTION_REBEL, FACTION_CWU, FACTION_HECU, FACTION_OUTLAWS, FACTION_SUNRISE}),
	pocket = false,
	unlockTime = 0,5 * 3600
})

addPrinter("Усовершенствованный генератор токенов", {
	ent = "mp_basic_9lvl",
	model = "models/props_lab/monitor02.mdl",
	price = 150,
	allowed = rp.GetFactionTeams({FACTION_CITIZEN, FACTION_REBEL, FACTION_CWU, FACTION_HECU, FACTION_OUTLAWS, FACTION_SUNRISE}),
	pocket = false,
	unlockTime = 15 * 3600
})

addPrinter("Генератор токенов Повстанцев", {
	ent = "mp_basic_6lvl",
	model = "models/props_lab/reciever_cart.mdl",
	price = 300,
	allowed = rp.GetFactionTeams({FACTION_CITIZEN, FACTION_REBEL, FACTION_CWU, FACTION_HECU, FACTION_OUTLAWS, FACTION_SUNRISE}),
	pocket = false,
	unlockTime =  50 * 3600
})

addPrinter("Генератор токенов Альянса", {
	ent = "mp_basic_10lvl",
	model = "models/props_combine/breenconsole.mdl",
	price = 400,
	allowed = rp.GetFactionTeams({FACTION_CITIZEN, FACTION_REBEL, FACTION_CWU, FACTION_HECU, FACTION_OUTLAWS, FACTION_SUNRISE}),
	pocket = false,
	unlockTime = 200 * 3600
})

hook.Call("rp.AddEntities", GAMEMODE)
-- Cook


rp.AddFoodItem("Popcan", "models/props_junk/PopCan01a.mdl", 25, 10, {})
rp.AddFoodItem("Арбуз", "models/props_junk/watermelon01.mdl", 20, 10, {TEAM_REBEL_BARMEN, TEAM_COOK, TEAM_ELI, TEAM_KLEINER, TEAM_CWU_LEADER, TEAM_VORTI, TEAM_AGP})
rp.AddFoodItem("Минеральная вода", "models/props_junk/GlassBottle01a.mdl", 20, 10, {TEAM_REBEL_BARMEN, TEAM_COOK, TEAM_ELI, TEAM_KLEINER, TEAM_CWU_LEADER, TEAM_VORTI, TEAM_AGP})
rp.AddFoodItem("Квас", "models/props_junk/garbage_plasticbottle003a.mdl", 15, 10, {TEAM_REBEL_BARMEN, TEAM_COOK, TEAM_ELI, TEAM_KLEINER, TEAM_CWU_LEADER, TEAM_VORTI, TEAM_AGP})
rp.AddFoodItem("Молоко", "models/props_junk/garbage_milkcarton002a.mdl", 20, 10, {TEAM_REBEL_BARMEN, TEAM_COOK, TEAM_ELI, TEAM_KLEINER, TEAM_CWU_LEADER, TEAM_VORTI, TEAM_AGP})
rp.AddFoodItem("Тархун", "models/props_junk/garbage_glassbottle003a.mdl", 10, 10, {TEAM_REBEL_BARMEN, TEAM_COOK, TEAM_ELI, TEAM_KLEINER, TEAM_CWU_LEADER, TEAM_VORTI, TEAM_AGP})
rp.AddFoodItem("Лапша", "models/props_junk/garbage_takeoutcarton001a.mdl", 40, 10, {TEAM_REBEL_BARMEN, TEAM_COOK, TEAM_ELI, TEAM_KLEINER, TEAM_CWU_LEADER, TEAM_VORTI, TEAM_AGP})
--rp.AddFoodItem("Банан", "models/props/cs_italy/bananna.mdl", 10, 10, {TEAM_COOK})
//rp.AddFoodItem("Бананы", "models/props/cs_italy/bananna_bunch.mdl", 10, {})
--rp.AddFoodItem("Безалкогольное Пиво", "models/props_junk/garbage_glassbottle001a.mdl", 10, 10, {})
//rp.AddFoodItem("Бутылка2", "models/props_junk/garbage_glassbottle002a.mdl", 10, {})
--rp.AddFoodItem("Апельсин", "models/props/cs_italy/orange.mdl", 20, 10, {TEAM_COOK})
--rp.AddFoodItem("Санкционный Бургер", "models/food/burger.mdl", 50, 10, {})
--rp.AddFoodItem("Хот-дог", "models/food/hotdog.mdl", 45, 10, {})
-- Ammo
rp.AddAmmoType("Pistol", "Пистолетные патроны", "models/Items/BoxSRounds.mdl", 5, 50)
rp.AddAmmoType("Buckshot", "Картечь для дробовика", "models/Items/BoxBuckshot.mdl", 5, 25)
rp.AddAmmoType("smg1", "СМГ Патроны", "models/Items/BoxMRounds.mdl", 10, 100)
rp.AddAmmoType("ar2", "Патроны для AR2", "models/Items/combine_rifle_cartridge01.mdl", 10, 50)
rp.AddAmmoType("bp_sniper", "Патроны для Снайперской Винтовки", "models/Items/combine_rifle_cartridge01.mdl", 10, 30)
rp.AddAmmoType("357", "Патроны для револьвера", "models/Items/357ammobox.mdl", 15, 50)
rp.AddAmmoType("XBowBolt", "Болты для арбалета", "models/Items/CrossbowRounds.mdl", 30, 20)
rp.AddAmmoType("RPG_Round", "Ракеты для RPG", "models/weapons/w_missile_closed.mdl", 100, 3)




-- Copshop
/*rp.AddCopItem("Щит", {
	Price = 750,
	Weapon = "weapon_shield",
	Model = "models/custom/ballisticshield.mdl"
})

rp.AddCopItem("Коробка патронов", {
	Price = 500,
	Model = "models/Items/BoxSRounds.mdl",
	Callback = function(pl)
		for k, v in ipairs(rp.ammoTypes) do
			pl:GiveAmmo(120, v.ammoType, true)
		end
	end
})

rp.AddCopItem("C4", {
	Price = 20000,
	Model = "models/weapons/2_c4_planted.mdl",
	Callback = function(pl)
		pl:Give("weapon_c4")
	end
})

rp.AddCopItem("Аптечка", {
	Price = 250,
	Model = "models/Items/HealthKit.mdl",
	Callback = function(pl)
		pl:SetHealth(100)
	end
})

rp.AddCopItem("Броня", {
	Price = 300,
	Model = "models/props_junk/cardboard_box004a.mdl",
	Callback = function(pl)
		pl:SetArmor(100)
	end
})*/