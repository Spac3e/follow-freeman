local union_spawns = {
	rp_city17_urfim = {Vector(3739.062500,-1667.116699,76.031250), Vector(3738.937256,-1728.012207,76.031250), Vector(3488.465576,-1788.033691,76.031250), Vector(3418.571045,-1787.697266,76.031250), Vector(3419.062256,-1684.540649,76.031250)},
}

local ofc_spawns = {
	rp_city17_urfim = {Vector(3919.557373,-1659.989136,76.031250), Vector(3922.026367,-1751.449219,76.031250), Vector(3922.914551,-1781.730591,76.031250)},
}

local ota_spawns = {
    rp_city17_urfim = {Vector(4705.453613,178.770081,76.031250), Vector(4706.961426,98.089737,76.031250), Vector(4828.361816,279.154175,76.031250)},
}

local mayor_spawn = {
	rp_city17_urfim = rp.GetSpawnPoint(SPAWN_NEXUS),
}

local gar_spawn = {
	rp_city17_urfim = {Vector(5522.644531,-1235.967896,12.876854), (Vector(5382.279785,-1235.397217,12.031250))}
}

local empty = {}



local map = game.GetMap() == "rp_c18_divrp" && 18 or 17

TEAM_RCT = rp.addTeam("C"..map..".MPF.RCT", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_female_police_fix.mdl",

	description = [[Metropolice Force Recruit

Рекрут наземных сил Гражданской Обороны.



Лояльность ГО: Низкая



Перевоспитание: По разрешению 03+

Ампутация: Запрещена

Сектор D6: Не допущен

Нексус: Разрешено посещение 0 этажа



В подчинении у 03+]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "weapon_taser"} || {"weapon_radio", "nut_stunstick", "weapon_bp_flaregun", "weapon_taser"},

	spawns = union_spawns,

	spawn_points = empty,

	//unlockPrice = 20000,

	salary = 12,

	command = 'rct',

	faction = FACTION_COMBINE,

	rationCount = 1,

	stamina = 2,

	unlockTime = 0.5 * 3600,

	unlockPrice = 100,

	reversed = true,

	randomName = true,

	loyalty = 1

})



TEAM_CP05 = rp.addTeam("C"..map..".MPF.05", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_hdpolice_fix.mdl",

	description = [[Metropolice Force 05 Unit

05-ый юнит наземных сил Гражданской Обороны



Лояльность ГО: Средняя



Перевоспитание: По разрешению 03+

Ампутация: Запрещена

Сектор D6: Не допущен

Нексус: Разрешено посещение 0 этажа



В подчинении у 03+]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "swb_pistol", "weapon_taser", "weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "swb_pistol", "weapon_bp_flaregun", "weapon_taser"},

	spawns = union_spawns,

	spawn_points = empty,

	//unlockPrice = 35000,

	salary = 12,

	command = '05',

	faction = FACTION_COMBINE,

	rationCount = 1,

	stamina = 2,

	unlockTime = 1.5 * 3600,

	unlockPrice = 400,

	reversed = true,

	randomName = true,

	armor = 15,

	loyalty = 2

})



TEAM_CP04 = rp.addTeam("C"..map..".MPF.04", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_urban_police_fix.mdl",

	description = [[Metropolice Force 04 Unit

04-ый юнит наземных сил Гражданской Обороны



Лояльность ГО: Средняя



Перевоспитание: Разрешение не требуется

Ампутация: По разрешению 01+

Сектор D6: Допущен к охране периметра

Нексус: Разрешено посещение 0 этажа



В подчинении у 03+]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "swb_pistol", "door_ram", "weapon_taser", "weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "swb_pistol", "door_ram", "weapon_bp_flaregun", "weapon_taser"},

	spawns = union_spawns,

	spawn_points = empty,

	salary = 14,

	command = '04',

	armor = 20,

	faction = FACTION_COMBINE,

	rationCount = 1,

	stamina = 2,

	unlockTime = 3.5 * 3600,

	unlockPrice = 1750,

	reversed = true,

	randomName = true,

	loyalty = 2

})



TEAM_CP03 = rp.addTeam("C"..map..".MPF.03", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_policetrench_fix.mdl",

	description = [[Metropolice Force 03 Unit

03-ый юнит наземных сил Гражданской Обороны



Лояльность ГО: Средняя



Перевоспитание: Может давать разрешение

Ампутация: По разрешению 01+

Сектор D6: Допущен к охране периметра

Нексус: Разрешено посещение 0 и 1 этажей



Командует 04-, в подчинении у 01+]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "swb_smg", "door_ram", "weapon_taser", "weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "swb_smg", "door_ram", "weapon_taser"},

	spawns = union_spawns,

	spawn_points = empty,

	salary = 14,

	command = '03',

	armor = 25,

	faction = FACTION_COMBINE,

	rationCount = 1,

	stamina = 2,

	unlockTime = 5 * 3600,

	max = 4,

	unlockPrice = 2500,

	reversed = true,

	randomName = true,

	loyalty = 2

})



TEAM_CP02 = rp.addTeam("C"..map..".MPF.02", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_hl2concept_fix.mdl",

	description = [[Metropolice Force 02 Unit

02-ый юнит наземных сил Гражданской Обороны



Лояльность ГО: Средняя



Перевоспитание: Может давать разрешение

Ампутация: Разрешение не требуется

Сектор D6: Допущен к охране периметра и к участию в вылазках

Нексус: Разрешено посещение 0 и 1 этажей



Командует 04-, в подчинении у 01+]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "swb_pistol", "swb_smg", "door_ram", "weapon_taser", "weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "swb_pistol", "swb_smg", "door_ram", "weapon_taser", "weapon_cuff_elastic"},

	spawns = union_spawns,

	spawn_points = empty,

	salary = 18,

	command = '02',

	armor = 35,

	faction = FACTION_COMBINE,

	rationCount = 2,

	stamina = 2,

	unlockTime = 15 * 3600,

	max = 4,

	unlockPrice = 7500,

	reversed = true,

	randomName = true,

	loyalty = 2

})



TEAM_CP01 = rp.addTeam("C"..map..".MPF.01", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_c08cop_fix.mdl",

	description = [[Metropolice Force 01 Unit

01-ый юнит наземных сил Гражданской Обороны



Лояльность ГО: Высокая



Перевоспитание: Может давать разрешение

Ампутация: Может давать разрешение

Сектор D6: Допущен к охране периметра и к участию в вылазках

Нексус: Разрешено посещение 0, 1, 2 этажей



Командует 02-, в подчинении у OfC+]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "swb_pistol", "swb_smg", "door_ram", "weapon_taser", "weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "swb_pistol", "swb_smg", "door_ram", "weapon_taser", "weapon_cuff_elastic"},

	spawns = union_spawns,

	spawn_points = empty,

	//unlockPrice = 100000,

	//requireUnlock = TEAM_CP02,

	salary = 20,

	command = '01',

	armor = 40,

	faction = FACTION_COMBINE,

	rationCount = 2,

	stamina = 2,

	unlockTime = 30 * 3600,

	canCapture = true,

	max = 4,

	unlockPrice = 15000,

	reversed = true,

	randomName = true,

	loyalty = 3

})



TEAM_UNIONOFC = rp.addTeam("C"..map..".MPF.OfC", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_black_police_fix.mdl", 

	description = [[Metropolice Force Officer

Офицер наземных сил Гражданской Обороны



Лояльность ГО: Высокая



Перевоспитание: Может давать разрешение

Ампутация: Может давать разрешение

Сектор D6: Допущен к охране периметра и к участию в вылазках

Нексус: Полный доступ, кроме кабинета Администратора



Командует 01-, в подчинении у EpU+]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "swb_pistol",  "swb_smg", "swb_shotgun", "door_ram", "weapon_taser","weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "swb_pistol",  "swb_smg", "swb_shotgun", "door_ram", "weapon_taser","weapon_cuff_elastic"},

	spawns = ofc_spawns,

	spawn_points = empty,

	//unlockPrice = 120000,

	//requireUnlock = TEAM_CP01,

	salary = 22,

	command = 'ofc',

	armor = 50,

	forceLimit = true,

	faction = FACTION_COMBINE,

	rationCount = 3,

	stamina = 2,

	unlockTime = 60 * 3600,

	canCapture = true,

	max = 5,

	unlockPrice = 30000,

	reversed = true,

	randomName = true,

	loyalty = 3

})



/*

TEAM_DISPATCH = rp.addTeam("C"..map..".MPF.Dispatch.OnT", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_tron_police_cn.mdl",

	description = [[Вы являетесь сотрудником который отвечает

за информацию.ВЫ можете оповещать о лок-дауне и так же использовать команду

/dispatch

ВНИМАНИЕ: ВАМ ЗАПРЕЩЕНО ВЫХОДИТЬ НА УЛИЦУ!]],

	weapons = {"pocket"},

	command = "dispatchused",

	spawns = union_spawns,

	//unlockPrice = 320000,

	//requireUnlock = TEAM_UNIONOFC,

	salary = 250,

	max = 1,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

})

*/



TEAM_SNIPER = rp.addTeam("C"..map..".MPF.Sniper", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_arctic_police_fix.mdl", 

	description = [[Metropolice Force Sniper

Снайпер наземных сил Гражданской Обороны



Юнит имеет облегченную экипировку и передвигается быстрее других.



Лояльность ГО: Высокая



Перевоспитание: Разрешение не требуется

Ампутация: Разрешение не требуется



Сектор D6: Допущен к охране периметра

Нексус: Полный доступ, кроме кабинета Администратора



В подчинении у EpU+]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "swb_pistol", "door_ram", "weapon_taser", "weapon_cuff_elastic","swb_awp"} || {"weapon_radio", "nut_stunstick", "swb_pistol", "weapon_bp_sniper", "door_ram", "weapon_taser", "weapon_cuff_elastic"},

	spawns = ofc_spawns,

	spawn_points = empty,

	salary = 24,

	max = 1,

	command = 'sniper',

	PlayerSpawn = function(ply) ply:SetRunSpeed(310) end,

	armor = 50,

	faction = FACTION_COMBINE,

	rationCount = 3,

	stamina = 2,

	unlockTime = 75 * 3600,

	unlockPrice = 37000,

	reversed = true,

	randomName = true,

	max  = 2,

	loyalty = 3

})



TEAM_EPU = rp.addTeam("C"..map..".MPF.EpU", {

	color = Color(0, 72, 255, 255),

	model = "models/player/police_armored_fix.mdl",

	description = [[Metropolice Force Elite Protection Unit

Элитный юнит наземных сил Гражданской Обороны



Лояльность ГО: Высокая



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ, кроме кабинета Администратора



Командует OfC-, в подчинении у DvL+]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "swb_357", "swb_shotgun", "swb_smg", "door_ram", "weapon_taser", "weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "swb_357", "swb_shotgun", "swb_smg", "door_ram", "weapon_taser", "weapon_cuff_elastic"},

	spawns = ofc_spawns,

	spawn_points = empty,

	//unlockPrice = 200000,

	//requireUnlock = TEAM_UNIONOFC,

	salary = 26,

	command = 'epu',

	max = 2,

	forceLimit = true,

	armor = 60,

	faction = FACTION_COMBINE,

	rationCount = 3,

	unlockTime = 100 * 3600,

	canCapture = true,

	stamina = 2,

	unlockPrice = 50000,

	reversed = true,

	randomName = true,

	loyalty = 3

})

if !isSerious then

TEAM_JUD = rp.addTeam("OWC.Judge", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_skull_police_fix.mdl",

	description = [[

Палач наземных подразделений гражданской обороны. 

Служит одновременно судьей и палачом гражданской обороны.

Работает с делами особо опасных преступников Альянса;



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ



Командует EpU - ]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "weapon_hcanister", "swb_ar3", "swb_357", "weapon_frag", "door_ram", "weapon_taser","weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "weapon_hcanister", "swb_ar3", "swb_357", "weapon_frag", "door_ram", "weapon_taser", "weapon_bp_hopwire","weapon_cuff_elastic"},

	spawns = ofc_spawns,

	spawn_points = empty,

	salary = 32,

	command = 'judge',

	max = 1,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	canCapture = true,

	randomName = true,

	stamina = 2,

	armor = 70,

	customCheck = function(ply) return ply:GetOrg() == "Russian Army" or ply:HasUpgrade('job_judge') or ply:IsRoot() end,

	faction = FACTION_COMBINE,

	rationCount = 4,

	loyalty = 4,

	reversed = true,

})

end

TEAM_DVL = rp.addTeam("OWC.DvL", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_police_bt_fix.mdl",

	description = [[Overwatch Staff Commander Division Leader

Командный состав Патруля Альянса: Лидер Дивизиона



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ



Командует EpU-, в подчинении у SeC

Командует ОТА в состоянии стазиса (может вывести из стазиса и единоразово ввести код после чего теряет над ними полномочия).]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "swb_357", "swb_shotgun", "swb_smg", "door_ram", "weapon_taser","weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "swb_357", "swb_shotgun", "swb_smg", "door_ram", "weapon_taser", "weapon_bp_hopwire","weapon_cuff_elastic"},

	spawns = ofc_spawns,

	spawn_points = empty,

	//unlockPrice = 350000,

	//requireUnlock = TEAM_EPU,

	salary = 30,

	command = 'dvl',

	max = 1,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	armor = 80,

	customCheck = isSerious && function(ply) return CLIENT or (ply:GetOrg() == "Overwatch C18" && (ply:GetOrgData().Rank == 'SeC' or ply:GetOrgData().Rank == 'CmR' or ply:GetOrgData().Rank == 'DvL')) or ply:IsRoot() end || nil,

	CustomCheckFailMsg = 'RequireAlliance',

	faction = FACTION_COMBINE,

	rationCount = 4,

	stamina = 2,

	unlockTime = 150 * 3600,

	reversed = true,

	randomName = true,

	canCapture = true,

	unlockPrice = 75000,

	loyalty = 4

})



TEAM_CMR = rp.addTeam("OWC.CmR", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_elite_police_fix.mdl",

	description = [[Overwatch Staff Commander Commissar

Комиссар наземных сил Гражданской Обороны.



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ



Командует:EpU-,командует ОТА,если нет SeC,ELS,OvL

В подчинение:SeC]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "swb_357", "swb_shotgun", "swb_smg", "door_ram", "weapon_taser","weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "swb_357", "swb_shotgun", "swb_smg", "door_ram", "weapon_taser", "weapon_bp_hopwire","weapon_cuff_elastic"},

	spawns = ofc_spawns,

	spawn_points = empty,

	//unlockPrice = 350000,

	//requireUnlock = TEAM_DVL,

	salary = 30,

	command = 'cmr',

	max = 1,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	armor = 95,

	customCheck = isSerious && function(ply) return CLIENT or (ply:GetOrg() == "Overwatch C18" && (ply:GetOrgData().Rank == 'SeC' or ply:GetOrgData().Rank == 'CmR')) or ply:IsRoot() end || nil,

	CustomCheckFailMsg = 'RequireAlliance',

	faction = FACTION_COMBINE,

	rationCount = 4,

	unlockTime = 210 * 3600,

	canCapture = true,

	reversed = true,

	randomName = true,

	hpRegen = 1,

	stamina = 2,

	unlockPrice = 90000,

	loyalty = 4

})





TEAM_SEC = rp.addTeam("OWC.SeC", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_phoenix_police_fix.mdl",

	description = [[Overwatch Staff Commander Sectorial Commander

Командный состав Патруля Альянса: Управляющий Сектором



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ



Командует DvL-

Командует ОТА,если те не находятся в подчинении у ElS.]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "weapon_hcanister", "swb_ar2", "swb_357", "weapon_frag", "door_ram", "weapon_taser","weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "weapon_hcanister", "swb_ar2", "swb_357", "weapon_frag", "door_ram", "weapon_taser", "weapon_bp_hopwire","weapon_cuff_elastic"},

	spawns = ofc_spawns,

	spawn_points = empty,

	salary = 32,

	command = 'sec',

	max = 1,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	armor = 250,

	customCheck = isSerious && function(ply) return CLIENT or (ply:GetOrg() == "Overwatch C18" && (ply:GetOrgData().Rank == 'SeC')) or ply:IsRoot() end || nil,

	faction = FACTION_COMBINE,

	CustomCheckFailMsg = 'RequireAlliance',

	rationCount = 4,

	unlockTime = 250 * 3600,

	reversed = true,

	randomName = true,

	hpRegen = 3,

	stamina = 2,

	canCapture = true,

	unlockPrice = 110000,

	mayor = true,

	loyalty = 4

})



-- OTA



if SERVER then

    hook.Add("PlayerHasHunger", function(ply)

         if ply:GetJobTable().noHunger == true then return false end

    end)

end



TEAM_STALKER = rp.addTeam("OTS.Sentinel.Stalker", { 

	color = Color(0, 72, 255, 255), 

	model = "models/stalker_player/stalker_player_fix.mdl", 

	description = [[Overwatch Transhuman Servitor

Техник-Слуга Сверхчеловеческого Отряда ГО 



Ремонтирует и пополняет запас брони сотрудников ГО. 

Запрещено самовольно отходить от отряда 

и использовать оружие. 



Подчиняется OFC+ 

]], 

	weapons = {"weapon_stalker","weapon_medkit"}, 

	command = "stalker", 

	armor = 50,

	spawns = ofc_spawns, 

	salary = 17, 

	max = 3,

	forceLimit = true,

	noHunger = true, 

	faction = FACTION_OTA, 

	hpRegen = 2,

	rationCount = 3, 

	unlockTime = 50 * 3600, 

	reversed = true,

	randomName = true,

	unlockPrice = 20000, 

	loyalty = 4

})



if !isSerious then

TEAM_CREMATOR = rp.addTeam("C17.Sentinel.Cremator", {

	color = Color(0, 72, 255, 255),

	model = { "models/player/cremator_fix.mdl" },

	description = [[Overwatch Transhuman Cremator

Крематор Сверхчеловеческого Отряда ГО 



Занимается кремацией трупов с целью очистки города.

Не имеет речевого модуля.

Запрещенно использовать какое либо оружие, кроме огнемета.

]],

	weapons = isSerious && {"weapon_radio",} || {"weapon_radio", "weapon_bp_flamethrower"},

	spawns = ofc_spawns,

	spawn_points = empty,

	salary = 20,

	command = 'cremator',

	admin = 0,

	stamina = 2,

	max = 1,

	armor = 100,

	noHunger = true,

	candemote = true,

	vote = false,

	hasLicense = false,

	faction = FACTION_OTA,

	unlockTime = 400 * 3600,

	reversed = true,

	randomName = true,

	rationCount = 4,

	loyalty = 4,

	vip = true

})

end



TEAM_OTA_GUARD = rp.addTeam("OTA.Sentinel.NxG", {

	color = Color(0, 72, 255, 255),

	model = "models/player/combine_guard_armored_fix.mdl",

	description = isSerious && [[Overwatch Transhuman Arm Nexus Guard

Сверхчеловеческий отдел Патруля Альянса: Охранник Нексуса



Не может покидать сектор D2.

Обязан следить за соблюдением регламента о доступах к сектору D2



Лояльность ГО: Максимальная



Сектор D6: Не допущен

Нексус: Полный доступ



В подчинении у ElS или SeC, в частичном подчинении у DvL]] 

|| 

[[Overwatch Transhuman Arm Nexus Guard

Сверхчеловеческий отдел Патруля Альянса: Охранник Нексуса



Не может покидать Нексус

Обязан следить за соблюдением регламента о доступах к Нексусу



Лояльность ГО: Максимальная



Сектор D6: Не допущен

Нексус: Полный доступ



В подчинении у ElS или SeC, в частичном подчинении у DvL]],

	weapons = isSerious && {"weapon_radio", "swb_pistol", "swb_ar2", "door_ram", "weapon_taser", "weapon_cuff_elastic"} || {"weapon_radio", "swb_pistol", "swb_ar2", "door_ram", "weapon_taser", "weapon_cuff_elastic"},

	command = "otanxg",

	spawns = ota_spawns,

	armor = 150,

	salary = 22,

	max = 4,

	noHunger = true,

	stamina = 3,

	forceLimit = true,

	faction = FACTION_OTA,

	rationCount = 3,

	unlockTime = 45 * 3600,

	reversed = true,

	randomName = true,

	unlockPrice = 22500,

	loyalty = 4

})



if !isSerious then

TEAM_OTA_GUARD_HEAVY = rp.addTeam("OTA.Sentinel.NxH", {

	color = Color(0, 72, 255, 255),

	model = "models/player/combine_elite_guard_armored_fix.mdl",

	description = [[Overwatch Transhuman Arm Nexus Guard Heavy

Сверхчеловеческий отдел Патруля Альянса: Усиленный Охранник Нексуса



Может покидать Нексус во время рейда, но не может покидать пост D6

Обязан следить за соблюдением регламента о доступах к Нексусу



Лояльность ГО: Максимальная



Сектор D6: Допущен во время рейда

Нексус: Полный доступ



В подчинении у ElS или SeC, в частичном подчинении у DvL]],

	weapons = {"weapon_radio", "swb_pistol", "swb_ar2", "swb_shotgun", "weapon_frag", "door_ram", "weapon_taser","weapon_cuff_elastic"},

	command = "otanxh",

	spawns = ota_spawns,

	armor = 200,

	salary = 27,

	max = 1,

	stamina = 3,

	faction = FACTION_OTA,

	rationCount = 4,

	unlockTime = 120 * 3600,

	canCapture = true,

	unlockPrice = 60000,

	loyalty = 4,

	SetBodygroups = function(ply)

	end

})

end





rp.addTeam("OTA.Ranger.Assasin", {

	color = Color(208, 217, 209),

	model = { "models/player/hl2survivor/combine_sniper_female_fix.mdl" },

	description = [[Overwatch Transhuman Arm Assasin Unit

Элитный юнит-ассасин сверхчеловеческого отдела Патруля Альянса



Юнит имеет облегченную экипировку, передвигается быстрее других,

имеет снайперскую винтовку и карабкается по стенам.



Лояльность ГО: Высокая



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ, кроме кабинета Администратора



Командует OfC-, в подчинении у DvL+]], 

	weapons = isSerious && {"weapon_radio", "climb_swep", "swb_shotgun", "swb_awp", "door_ram", "weapon_taser", "weapon_frag"} || {"weapon_radio", "climb_swep", "swb_shotgun", "weapon_bp_sniper", "door_ram", "weapon_taser", "weapon_bp_hopwire"},

	spawns = ota_spawns,

	spawn_points = empty,

	salary = 32,

	command = 'sniperdpf',

	max = 1,

	admin = 0,

	candemote = true,

	stamina = 3,

	vote = false,

	noHunger = true,

	hasLicense = false,

	candisguise = true,

	forceLimit = true,

	disguise_faction = FACTION_REBEL,

	PlayerSpawn = function(ply) ply:SetRunSpeed(350) ply:SetGravity(1.25) end,

	armor = 200,

	--customCheck = function(ply) return CLIENT or (ply:GetOrg() == "OTA" && (ply:GetOrgData().Rank == 'OvL' or ply:GetOrgData().Rank == 'Assasin')) or ply:IsRoot() end,

	faction = FACTION_OTA,

	rationCount = 4,

	unlockTime = 350 * 3600,

	reversed = true,

	randomName = true,

	unlockPrice = 175000,

	loyalty = 4

})



if !isSerious then

TEAM_SILENT = rp.addTeam("ОТА.SWORD.SILENT", {

	color = Color(208, 217, 209),

	model = "models/player/combine_hunter_soldier_fix.mdl",

	description = isSerious and [[123 4 ser Overwatch Transhuman SILENT

Элитный солдат сверхчеловеческого отдела Патруля Альянса



В отличии от других OTA имеет специальную маскировку, что делает его более смертоносным



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ, кроме кабинета Администратора



Командует OTA.SlH-]] or

[[Overwatch Transhuman SILENT

Элитный солдат сверхчеловеческого отдела Патруля Альянса



В отличии от других OTA имеет специальную маскировку, что делает его более смертоносным



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ, кроме кабинета Администратора



Командует OTA.SlH-

]],

	weapons = {"weapon_radio", "swb_357", "weapon_bp_sniper", "swb_shotgun", "weapon_frag", "door_ram", "weapon_taser", "weapon_camo", "weapon_controllable_manhack","weapon_cuff_elastic"},

	command = "otainviz",

	spawns = ofc_spawns,

	spawn_points = empty,

	salary = 39,

	stamina = 3,

	max = 1,

	armor = 150,

	faction = FACTION_OTA,

	rationCount = 4,

	unlockTime = 650 * 3600,

	canCapture = true,

	unlockPrice = 350000,

	loyalty = 4,

	reversed = true,

})

end



if isSerious then

TEAM_APCPILOT = rp.addTeam("C"..map..".MPF.APC.Pilot", {

	color = Color(0, 72, 255, 255),

	model = "models/jessev92/player/hl2/combine-pilot.mdl",

	description = isSerious && [[Metropolice Force Pilot of Armored Personnel Carrier

Пилот бронетранспортера наназемных сил Гражданской Обороны.

Имеет возможность управлять бронетранспортером.

Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра

Нексус: Полный доступ, кроме кабинета Администратора



В подчинении у SeC]],

	weapons = {"weapon_radio", "swb_357", "swb_ar3", "door_ram", "weapon_frag", "weapon_taser"},

	spawns = ota_spawns,

	spawn_points = empty,

	salary = 28,

	command = 'apcpil',

	max = 1,

	admin = 0,

	stamina = 3,

	candemote = true,

	vote = false,

	hasLicense = false,

	PlayerSpawn = function(ply) ply:SetRunSpeed(350) end,

	armor = 50,

	forceLimit = true,

	faction = FACTION_OTA,

	rationCount = 4,

	unlockTime = 250 * 3600,

	unlockPrice = 120000,

	loyalty = 4,

	reversed = true,

})

end



TEAM_OTA = rp.addTeam("OTA.SWORD.Soldier", {

	color = Color(208, 217, 209),

	model = "models/player/combine_soldier.mdl",

	description = [[Overwatch Transhuman Arm Soldier

Солдат сверхчеловеческого отдела Патруля Альянса





Должен находиться в стазисе до получения приказов или выполнять код NOVA

(патрулирование / охрана Нексуса)

Стазис камеры должны распологаться в нексусе или на постах (D1-D6)

После выполнения/провала должен вернуться в стазис



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к участию в вылазках

Нексус: Полный доступ, кроме кабинета Администратора



В подчинении у ElS или SeC, в частичном подчинении у DvL]],

	weapons = isSerious && {"weapon_radio", "swb_pistol", "swb_ar3", "swb_shotgun", "weapon_frag", "door_ram", "weapon_taser", "weapon_frag","weapon_cuff_elastic"} || {"weapon_radio", "swb_pistol", "swb_ar3", "swb_shotgun", "weapon_frag", "door_ram", "weapon_taser", "weapon_bp_hopwire","weapon_cuff_elastic"},

	command = "otacombine",

	spawns = ota_spawns,

	spawn_points = empty,

	//unlockPrice = 120000,

	//requireUnlock = TEAM_UNIONOFC,

	salary = 32,

	noHunger = true,

	stamina = 3,

	max = 3,

	armor = 250,

	customCheck = isSerious && function(ply) return CLIENT or (ply:GetOrg() == "Overwatch C18" && (ply:GetOrgData().Rank == 'OvL' or ply:GetOrgData().Rank == 'ElS' or ply:GetOrgData().Rank == 'Soldier')) or ply:IsRoot() end || nil,

	CustomCheckFailMsg = 'RequireAlliance',

	faction = FACTION_OTA,

	rationCount = 4,

	forceLimit = true,

	unlockTime = 310 * 3600,

	reversed = true,

	randomName = true,

	unlockPrice = 155000,

	loyalty = 4,

	reversed = true,

})



TEAM_HEAVYOTA = rp.addTeam("OTA.SWORD.SlH", {

		color = Color(208, 217, 209),

		model = "models/player/combine_soldier_armored_fix.mdl",

		description = [[Overwatch Transhuman Arm Heavy Soldier

Усиленный солдат сверхчеловеческого отдела Патруля Альянса



Должен находиться в стазисе до получения приказов или выполнять код NOVA

(патрулирование / охрана Нексуса)

Стазис камеры должны распологаться в нексусе или на постах (D1-D6)

После выполнения/провала должен вернуться в стазис



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к участию в вылазках

Нексус: Полный доступ, кроме кабинета Администратора



В подчинении у ElS или SeC, в частичном подчинении у DvL]],

		weapons = isSerious && {"weapon_radio", "swb_pistol", "swb_ar3", "swb_shotgun", "weapon_frag", "door_ram", "weapon_taser", "weapon_frag","weapon_cuff_elastic"} || {"weapon_radio", "swb_pistol", "swb_ar3", "swb_shotgun", "weapon_frag", "door_ram", "weapon_taser", "weapon_bp_hopwire","weapon_cuff_elastic"},

		command = "otaheavy",

		spawns = ota_spawns,

		spawn_points = empty,

		salary = 34,

		stamina = 3,

		max = 2,

		armor = 300,

		customCheck = isSerious && function(ply) return CLIENT or (ply:GetOrg() == "Overwatch C18" && (ply:GetOrgData().Rank == 'OvL' or ply:GetOrgData().Rank == 'ElS' or ply:GetOrgData().Rank == 'SlH')) or ply:IsRoot() end || nil,

		CustomCheckFailMsg = 'RequireAlliance',

		faction = FACTION_OTA,

		rationCount = 4,

		forceLimit = true,

		unlockTime = 420 * 3600,

		reversed = true,

	    randomName = true,

		unlockPrice = 210000,

		loyalty = 4,

		SetBodygroups = function(ply)

		end

	})



if !isSerious then

	TEAM_OTAGOD = rp.addTeam("OTA.GOD.PRIME", {

		color = Color(255, 0, 0),

		model = "models/frosty/sparbine_players/sparbine_elite_pm_fix.mdl",

		description = [[Overwatch Transhuman Elite Soldier Prime

Элитный командир сверхчеловеческого отдела Патруля Альянса



В отличии от других OTA не находится в стазис камере



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ, кроме кабинета Администратора

]],

		weapons = {"weapon_radio", "swb_pistol", "weapon_bp_taucannon", "swb_ar3", "weapon_bp_hopwire", "weapon_frag", "door_ram", "weapon_taser", "weapon_bp_shotgun", "sh_blinkswep", "swb_xm1014"},

		command = "otagod",

		spawns = ota_spawns,

		spawn_points = empty,

		salary = 37,

		max = 4,

		unlockTime = 400 * 3600, 

		customCheck = function(ply) return ply:GetOrg() == "OTA.PRIME" or ply:IsRoot() end,

		PlayerSpawn = function(ply) ply:GiveArmor(450) pla:SetHealth(150) end,

		faction = FACTION_OTA,

		max = 3,

		rationCount = 4,

		loyalty = 4

	})

end



if !isSerious then

TEAM_OTASNIPER = rp.addTeam("ОТА.SWORD.Sniper", {

	color = Color(208, 217, 209),

	model = "models/player/combine/combinesniper.mdl",

	description = [[Добрый день. Это личная профессия Тигран Аракелян. Приятной игры.

	]],

	weapons = {"weapon_slam", "swb_ar2", "climb_swep", "weapon_bp_sniper"},

	command = "otasniper",

	spawns = ofc_spawns,

	spawn_points = empty,

	candisguise = true,

	disguise_faction = FACTION_REBEL,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:0:188432750" or ply:IsRoot() end,

	salary = 20,

	max = 1,

	faction = FACTION_OTA,

	rationCount = 2,

	stamina = 3,

	loyalty = 3,

	reversed = true,

})

end 



TEAM_OTALEAD = rp.addTeam("OTA.SWORD.ElS", {

	color = Color(255, 0, 0),

	model = {"models/player/combine_super_elite_soldier_fix.mdl", "models/player/combine_super_soldier.mdl"},

	description = isSerious && 

[[Overwatch Transhuman Elite Soldier

Элитный командир-солдат сверхчеловеческого отдела Патруля Альянса



В отличии от других OTA не находится в стазис камере



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ, кроме кабинета Администратора



Командует OTA.SWORD.Soldier-]]

|| 

[[Overwatch Transhuman Elite Soldier

Элитный командир-солдат сверхчеловеческого отдела Патруля Альянса



В отличии от других OTA не находится в стазис камере



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ, кроме кабинета Администратора



Командует OTA.SlH-]],

	weapons = isSerious && {"weapon_radio", "weapon_hcanisterf", "swb_357", "swb_ar3", "swb_shotgun", "weapon_frag", "door_ram", "weapon_taser", "weapon_frag", "weapon_pulsesaw"} || {"weapon_radio", "weapon_hcanisterf", "swb_357", "swb_ar3", "swb_shotgun", "weapon_frag", "door_ram", "weapon_taser", "weapon_bp_hopwire", "weapon_pulsesaw", "weapon_controllable_manhack"},

	command = "otaellite",

	spawns = ofc_spawns,

	spawn_points = empty,

	noHunger = true,

	salary = 39,

	stamina = 3,

	max = 2,

	armor = 400,

	customCheck = isSerious && function(ply) return CLIENT or (ply:GetOrg() == "Overwatch C18" && (ply:GetOrgData().Rank == 'OvL' or ply:GetOrgData().Rank == 'ElS')) or ply:IsRoot() end || nil,

	CustomCheckFailMsg = 'RequireAlliance',

	faction = FACTION_OTA,

	rationCount = 4,

	forceLimit = true,

	unlockTime = 500 * 3600,

	canCapture = true,

	reversed = true,

	randomName = true,

	unlockPrice = 275000,

	loyalty = 4

})



TEAM_OTAOVL = rp.addTeam("OTA.OvL", { 

	color = Color(255, 0, 0), 

	model = "models/player/combine_super_soldier_armored_fix.mdl", 

	description = [[Overwatch Transhuman Arm Overlord 

"Повелитель" сверхчеловеческого отдела Патруля Альянса 



Не должен находиться в стазис камере



Лояльность ГО: Максимальная 



Сектор D6: Полный доступ для организаций рейдов 

Нексус: Полный доступ 



Командует OTA и DvL- (если нет приказа SeC'а)]], 

	weapons = isSerious && {"weapon_radio", "weapon_hcanisterp", "swb_357", "swb_ar3", "swb_shotgun", "weapon_frag", "door_ram", "weapon_frag", "weapon_pulsesaw"} || {"weapon_radio", "weapon_hcanisterp", "swb_357", "swb_ar3", "swb_shotgun", "weapon_frag", "door_ram", "weapon_bp_hopwire", "weapon_pulsesaw", "weapon_controllable_manhack"}, 

	command = "otaovl", 

	spawns = ofc_spawns, 

	spawn_points = empty, 

	salary = 42, 

	noHunger = true,

	stamina = 3,

	max = 1, 

	armor = 500,

	customCheck = isSerious && function(ply) return CLIENT or (ply:GetOrg() == "Overwatch C18" && (ply:GetOrgData().Rank == 'OvL')) or ply:IsRoot() end || nil, 

	CustomCheckFailMsg = 'RequireAlliance',

    hpRegen = 3,

	faction = FACTION_OTA, 

	rationCount = 4, 

	unlockTime = 700 * 3600,

	canCapture = true, 

	reversed = true,

	randomName = true,

	unlockPrice = 350000, 

	loyalty = 4 

})





//DPF



if !isSerious then

TEAM_DPF03 = rp.addTeam("C"..map..".MPF.BLADE.03.Light", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_arctic_police_fix.mdl",

	description = [[Metropolice Force BLADE Division 03 Unit

03-ый юнит наземных сил Гражданской Обороны, Дивизион BLADE



Лояльность ГО: Средняя



Перевоспитание: Может давать разрешение

Ампутация: Разрешение не требуется

Сектор D6: Допущен к охране периметра и к участию в вылазках

Нексус: Разрешено посещение 0 и 1 этажей



Командует 04-, в подчинении у 01+]],

	weapons = {"weapon_radio", "nut_stunstick", "swb_pistol", "swb_smg", "door_ram", "weapon_taser"},

	spawns = ofc_spawns,

	spawn_points = empty,

	salary = 11,

	command = 'dpf03',

	max = 5,

	armor = 20,

	faction = FACTION_DPF,

	rationCount = 4,

	stamina = 2,

	unlockTime = 3.5 * 3600,

	randomName = true,

	vip = true,

	loyalty = 4,

	reversed = true,

})

end 



if !isSerious then

TEAM_DPFOFC = rp.addTeam("C"..map..".MPF.BLADE.OfC", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_rogue_police_fix.mdl",

	description = [[Metropolice Force BLADE Division Officer

Офицер наземных сил Гражданской Обороны, Дивизион BLADE



Лояльность ГО: Высокая



Перевоспитание: Может давать разрешение

Ампутация: Может давать разрешение

Сектор D6: Допущен к охране периметра и к участию в вылазках

Нексус: Полный доступ, кроме кабинета Администратора



Командует 01-, в подчинении у EpU+]],

	weapons = {"weapon_radio", "nut_stunstick", "swb_357", "swb_smg", "swb_pistol", "door_ram", "weapon_taser", "weapon_cuff_elastic"},

	spawns = ofc_spawns,

	spawn_points = empty,

	salary = 14,

	command = 'dpfofc',

	max = 4,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	armor = 40,

	faction = FACTION_DPF,

	rationCount = 4,

	stamina = 2,

	unlockTime = 15 * 3600,

	randomName = true,

	vip = true,

	loyalty = 4,

	reversed = true,

})

end

if !isSerious then

TEAM_DPFEU = rp.addTeam("C"..map..".MPF.BLADE.EliteUnit", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_biopolice_fix.mdl",

	description = [[Metropolice Force BLADE Division Elite Protection Unit

Элитный юнит наземных сил Гражданской Обороны, Дивизион BLADE



Лояльность ГО: Высокая



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ, кроме кабинета Администратора



Командует OfC-, в подчинении у DvL+]],

	weapons = {"weapon_radio", "nut_stunstick", "swb_357", "swb_smg", "swb_shotgun", "door_ram", "weapon_taser", "weapon_cuff_elastic"},

	spawns = ofc_spawns,

	spawn_points = empty,

	salary = 17,

	command = 'dpfeu',

	max = 3,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	armor = 60,

	faction = FACTION_DPF,

	rationCount = 4,

	stamina = 2,

	max = isSerious && 2 || 3,

	unlockTime = 50 * 3600,

	randomName = true,

	canCapture = true,

	vip = true,

	loyalty = 4,

	reversed = true,

})

end



if !isSerious then

TEAM_DPFS = rp.addTeam("C"..map..".MPF.BLADE.Scout", {

	color = Color(0, 72, 255, 255),

	model = { "models/dpfilms/metropolice/playermodels/pm_tron_police_cn_fix.mdl", "models/dpfilms/metropolice/playermodels/pm_tron_police_or_fix.mdl" },

	description = [[Metropolice Force BLADE Division Scout Unit

Элитный юнит-разведчик наземных сил Гражданской Обороны, Дивизион BLADE



Юнит имеет облегченную экипировку и передвигается быстрее других.



Лояльность ГО: Высокая



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ, кроме кабинета Администратора



Командует OfC-, в подчинении у DvL+]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "swb_357", "swb_ar2", "swb_shotgun", "door_ram", "weapon_taser", "weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "swb_357", "swb_ar2", "swb_shotgun", "door_ram", "weapon_taser", "weapon_controllable_manhack", "weapon_cuff_elastic"},

	spawns = ofc_spawns,

	spawn_points = empty,

	salary = 22,

	command = 'dpfs',

	max = isSerious && 1 || 2,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	PlayerSpawn = function(ply) ply:SetRunSpeed(350) end,

	armor = 80,

	faction = FACTION_DPF,

	rationCount = 4,

	stamina = 2,

	unlockTime = 100 * 3600,

	vip = true,

	randomName = true,

	loyalty = 4,

	reversed = true,

})

end



if !isSerious then

TEAM_SPY = rp.addTeam("C"..map..".MPF.BLADE.Spy", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_tribal_police_fix.mdl",

	description = [[Metropolice Force BLADE Division Spy

Солдат-шпион наземных сил Гражданской Обороны, Дивизион BLADE



Может маскироваться под повстанцев и проникать в ряды врагов.



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ



Командует EpU-, в подчинении у SeC

Командует ОТА в состоянии стазиса (может вывести из стазиса и единоразово ввести код,после чего теряет над ними полномочия).]],

	weapons = isSerious && {"weapon_radio", "swb_357", "swb_ar2", "swb_shotgun", "weapon_frag", "weapon_taser", "weapon_frag","weapon_cuff_elastic"} || {"weapon_radio", "swb_357", "swb_ar2", "swb_shotgun", "weapon_frag", "weapon_taser", "weapon_bp_hopwire", "weapon_controllable_manhack","weapon_cuff_elastic"},

	spawns = ofc_spawns,

	spawn_points = empty,

	salary = 27,

	command = 'spy',

	candisguise = true,

	disguise_faction = FACTION_REBEL,

	max = 1,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	armor = 80,

	faction = FACTION_DPF,

	rationCount = 4,

	stamina = 2,

	unlockTime = 200 * 3600,

	randomName = true,

	vip = true,

	loyalty = 4,

	reversed = true,

})

end



if !isSerious then

TEAM_DPFEH = rp.addTeam("C"..map..".MPF.BLADE.Heavy", {

	color = Color(0, 72, 255, 255),

	model = "models/dpfilms/metropolice/playermodels/pm_rtb_police_fix.mdl",

	description = [[Metropolice Force BLADE Division Elite Heavy Soldier

Усиленный командир-солдат наназемных сил Гражданской Обороны, Дивизион BLADE



Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ



Командует EpU-, в подчинении у SeC

Командует ОТА в состоянии стазиса (может вывести из стазиса и единоразово ввести код,после чего теряет над ними полномочия).]],

	weapons = isSerious && {"weapon_radio", "nut_stunstick", "swb_357", "swb_ar3", "swb_shotgun", "door_ram", "weapon_frag", "weapon_taser", "weapon_frag", "weapon_pulsesaw", "weapon_cuff_elastic"} || {"weapon_radio", "nut_stunstick", "swb_357", "swb_ar3", "swb_shotgun", "door_ram", "weapon_frag", "weapon_taser", "weapon_bp_hopwire", "weapon_pulsesaw", "weapon_cuff_elastic"},

	spawns = ofc_spawns,

	spawn_points = empty,

	salary = 32,

	command = 'dpfeh',

	max = 1,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	PlayerSpawn = function(ply) ply:SetWalkSpeed(130) end,

	armor = 450,

	hpRegen = 1,

	faction = FACTION_DPF,

	rationCount = 4,

	stamina = 2,

	unlockTime = 200 * 3600,

	randomName = true,

	canCapture = true,

	vip = true,

	loyalty = 4,

	reversed = true,

})

end



if isIndsutrial then

TEAM_APCPILOT = rp.addTeam("C"..map..".MPF.APC.Pilot", {

	color = Color(0, 72, 255, 255),

	model = "models/jessev92/player/hl2/combine-pilot_fix.mdl",

	description = isSerious && [[Metropolice Force BLADE Division Pilot of Armored Personnel Carrier

Пилот бронетранспортера наназемных сил Гражданской Обороны, Дивизион BLADE

Имеет возможность управлять бронетранспортером.

Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра

Нексус: Полный доступ, кроме кабинета Администратора



В подчинении у SeC, Heavy]] ||

[[Metropolice Force BLADE Division Pilot of Armored Personnel Carrier

Пилот бронетранспортера наназемных сил Гражданской Обороны, Дивизион BLADE

Имеет возможность управлять бронетранспортером.

Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра

Нексус: Полный доступ, кроме кабинета Администратора



В подчинении у APC.Cap, SeC, Heavy]],

	weapons = {"weapon_radio", "swb_357", "swb_ar3", "door_ram", "weapon_frag", "weapon_taser"},

	spawns = gar_spawn,

	spawn_points = empty,

	salary = 28,

	command = 'apcpil',

	max = 2,

	stamina = 3,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	forceLimit = true,

	PlayerSpawn = function(ply) ply:SetRunSpeed(350) end,

	armor = 50,

	faction = FACTION_DPF,

	rationCount = 4,

	unlockTime = 50 * 3600,

	loyalty = 4,

	reversed = true,

	randomName = true,

})

end



if isIndsutrial then

TEAM_APCCAP = rp.addTeam("C"..map..".MPF.APC.Captain", {

	color = Color(0, 72, 255, 255),

	model = "models/jessev92/player/hl2/combine-pilot_fix.mdl",

	description = [[Metropolice Force BLADE Division Captain of Armored Personnel Carrier

Капитан бронетранспортера наназемных сил Гражданской Обороны, Дивизион BLADE

Имеет возможность вызывать бронетранспортер и управлять им.

Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра

Нексус: Полный доступ, кроме кабинета Администратора



В подчинении у SeC]],

	weapons = {"weapon_radio", "swb_357", "swb_ar3", "swb_shotgun", "door_ram", "weapon_frag", "weapon_taser", "weapon_bp_hopwire", "weapon_pulsesaw","weapon_cuff_elastic"},

	spawns = gar_spawn,

	spawn_points = empty,

	salary = 32,

	command = 'apccap',

	max = 1,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	armor = 100,

	faction = FACTION_DPF,

	rationCount = 4,

	stamina = 3,

	unlockTime = 800 * 3600,

	canCapture = true,

	loyalty = 4,

	reversed = true,

	randomName = true,

})

end



-- HELIX



local helix_spawns = {rp_city17_urfim = {Vector(3528.850830,-3797.926514,-435.968750), Vector(3615.494141,-3752.572266,-435.968750), Vector(3536.610352,-3701.890137,-435.968750)}}

TEAM_CPMEDIC1 = rp.addTeam("C"..map..".RCT.HELIX", {

	color = Color(244, 194, 66),

	model = "models/dpfilms/metropolice/playermodels/pm_civil_medic_fix.mdl",

	description = [[Metropolice Force Medic

Медик наземных сил Гражданской Обороны, Дивизион HELIX



Сотрудник, прошедший дополнительную медицинскую подготовку.

Оказывает помощь раненым сотрудникам ГО, наблюдает за больными в лазарете.



Запрещено покидать лазарет.



Лояльность ГО: Средняя



Перевоспитание: По разрешению 03+

Ампутация: Запрещена

Сектор D6: Не допущен

Нексус: Разрешено посещение 0 этажа



В подчинении у 03+]],

	weapons = {"weapon_radio", "nut_stunstick", "swb_pistol", "weapon_medkit", "weapon_taser"},

	spawns = helix_spawns,

	spawn_points = empty,

	max = 2,

	salary = 12,

	command = 'medRCT',

	armor = 15,

	faction = FACTION_HELIX,

	rationCount = 1,

	stamina = 2,

	reversed = true,

	randomName = true,

	unlockTime = 1 * 3600,

	unlockPrice = 200,

	loyalty = 2

})



TEAM_CPMEDIC2 = rp.addTeam("C"..map..".03.HELIX", {

	color = Color(244, 194, 66),

	model = "models/dpfilms/metropolice/playermodels/pm_civil_medic_fix.mdl",

	description = [[Metropolice Force Medic

Медик наземных сил Гражданской Обороны, Дивизион HELIX



Сотрудник, прошедший дополнительную медицинскую подготовку.

Проводит раненных бойцов с поля боя в лазарет.



Лояльность ГО: Средняя



Перевоспитание: По разрешению 03+

Ампутация: Запрещена

Сектор D6: Не допущен

Нексус: Разрешено посещение 0 этажа



Командует 04-, В подчинении у OfC.HELIX]],

	weapons = {"weapon_radio", "nut_stunstick", "swb_pistol", "swb_smg", "door_ram", "weapon_medkit_fast", "weapon_taser"},

	spawns = helix_spawns,

	spawn_points = empty,

	max = 2,

	salary = 14,

	command = 'med',

	armor = 35,

	faction = FACTION_HELIX,

	rationCount = 2,

	stamina = 2,

	forceLimit = true,

	reversed = true,

	randomName = true,

	unlockTime = 10 * 3600,

	unlockPrice = 3000,

	loyalty = 2

})



TEAM_CPMEDIC3 = rp.addTeam("C"..map..".MPF.OfC.HELIX", {

	color = Color(244, 194, 66),

	model = "models/dpfilms/metropolice/playermodels/pm_retrocop_fix.mdl", 

	description = [[Metropolice Force Officer

Офицер наземных сил Гражданской Обороны, Дивизион HELIX



Сотрудник, прошедший дополнительную медицинскую подготовку.

Командует и организовывает работу дивизиона HELIX.



Лояльность ГО: Высокая



Перевоспитание: Может давать разрешение

Ампутация: Может давать разрешение

Сектор D6: Допущен к охране периметра и к участию в вылазках

Нексус: Полный доступ, кроме кабинета Администратора



Командует 03-, в подчинении у EpU+]],

	weapons = {"weapon_radio", "nut_stunstick", "swb_357",  "swb_smg", "swb_shotgun", "weapon_medkit_fast", "door_ram", "weapon_taser","weapon_cuff_elastic"},

	spawns = helix_spawns,

	spawn_points = empty,

	salary = 22,

	command = 'ofchelix',

	max = 1,

	armor = 65,

	faction = FACTION_HELIX,

	rationCount = 3,

	stamina = 2,

	forceLimit = true,

	reversed = true,

	randomName = true,

	unlockTime = 80 * 3600,

	canCapture = true,

	unlockPrice = 50000,

	loyalty = 3

})



--

--Division of city administrator protection

--

local dap_spawns = {
    rp_city17_urfim = {Vector(4793.486328,263.416443,76.031250), Vector(4702.552734,284.262085,76.031250), Vector(4775.593262,235.599304,76.031250)},
}

if !isSerious then

TEAM_DAPRCT = rp.addTeam("C"..map..".DAP.Soldier", {

	color = Color(0, 72, 255, 255),

	model = "models/phill/combine_soldier.mdl",

	description = [[C17.Division of city administrator protection.Soldier

Солдат особых наземных сил Гражданской Обороны, спец. дивизион Division of city administrator protection



Лояльность ГО: Средняя



Перевоспитание: Допущен к использованию;

Ампутация: Должен иметь разрешение C17.DAP.Sgt +;

Нексус: Полный доступ, кроме кабинета Администратора;



Командует никем, в подчинении у C17.DAP.Warden + , OwC.SeC]],

	weapons = {"weapon_radio", "swb_smg", "swb_pistol", "door_ram"},

	spawns = dap_spawns,

	spawns = ofc_spawns,

	salary = 11,

	command = 'daprct',

	max = 4,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	PlayerSpawn = function(ply) ply:SetWalkSpeed(190) end,

	armor = 35,

	forceLimit = true,

	faction = FACTION_DAP,

	rationCount = 2,

	stamina = 2,

	unlockTime = 20 * 3600,

	unlockPrice = 10000,

	randomName = true,

	reversed = true,

	loyalty = 2

})

end 


if !isSerious then

TEAM_DAPWARD = rp.addTeam("C"..map..".DAP.Warden", {

	color = Color(0, 72, 255, 255),

	model = "models/phill/combine_soldier_prisonguard.mdl",

	description = [[C17.Division of city administrator protection.Warden

Смотритель особых наземных сил Гражданской Обороны, спец. дивизион Division of city administrator protection



Лояльность ГО: Максимальная



Перевоспитание: Допущен к использованию;

Ампутация: Допущен к использованию;

Нексус: Полный доступ;



Командует C17.DAP.Warden -, в подчинении у C17.DAP.King]],

	weapons = {"weapon_radio", "swb_ar3", "swb_357", "door_ram", "weapon_taser", "swb_shotgun", "weapon_frag", "weapon_bp_hopwire","weapon_cuff_elastic"},

	spawns = dap_spawns,

	spawns = ofc_spawns,

	salary = 20,

	command = 'dapwar',

	max = 1,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	PlayerSpawn = function(ply) ply:SetWalkSpeed(190) end,

	armor = 200,

	forceLimit = true,

	faction = FACTION_DAP,

	rationCount = 4,

	stamina = 3,

	unlockTime = 160 * 3600,

	canCapture = true,

	unlockPrice = 100000,

	loyalty = 4

})

end 



TEAM_DAPPCL = rp.addTeam("C"..map..".DAP.King", {

	color = Color(0, 72, 255, 255),

	model = "models/phill/combine_super_soldier.mdl",

	description = isSerious && 

[[C18.Division of city administrator protection.King

Лидер дивизиона особых наземных сил Гражданской Обороны, спец. дивизион Division of city administrator protection



Лояльность ГО: Максимальная



Перевоспитание: Допущен к использованию;

Ампутация: Допущен к использованию;

Нексус: Полный доступ;



Командует C18.DAP.OfC -]]

|| 

[[C17.Division of city administrator protection.King

Лидер дивизиона особых наземных сил Гражданской Обороны, спец. дивизион Division of city administrator protection



Лояльность ГО: Максимальная



Перевоспитание: Допущен к использованию;

Ампутация: Допущен к использованию;

Нексус: Полный доступ;



Командует C17.DAP.Warden -]],

	weapons = isSerious && {"weapon_radio", "swb_ar3", "swb_357", "door_ram", "weapon_taser", "swb_shotgun", "weapon_frag", "weapon_frag", "weapon_pulsesaw", "weapon_cuff_elastic"} || {"weapon_radio", "swb_ar3", "swb_357", "door_ram", "weapon_taser", "swb_shotgun", "weapon_frag", "weapon_bp_hopwire", "weapon_pulsesaw", "weapon_controllable_manhack","weapon_cuff_elastic"} ,

	spawns = mayor_spawn,

	spawns = ofc_spawns,

	salary = 25,

	command = 'dapking',

	max = 1,

	admin = 0,

	candemote = true,

	vote = false,

	reversed = true,

	randomName = true,

	hasLicense = false,

	PlayerSpawn = function(ply) ply:SetWalkSpeed(190) end,

	armor = 350,

	forceLimit = true,

	faction = FACTION_DAP,

	rationCount = 5,

	stamina = 3,

	unlockTime = 350 * 3600,

	canCapture = true,

	unlockPrice = 150000,

	loyalty = 4

})



rp.AddDoorGroup('Лазарет', rp.GetFactionTeams({FACTION_COMBINE, FACTION_DPF, FACTION_OTA, FACTION_HELIX, FACTION_DAP}, {TEAM_KAEF, TEAM_MAYOR1, TEAM_CWU_LEADER, TEAM_REFERENT}))

rp.AddDoorGroup('Нексус', rp.GetFactionTeams({FACTION_COMBINE, FACTION_DPF, FACTION_OTA, FACTION_HELIX, FACTION_DAP, FACTION_LEGION}, {TEAM_KAEF, TEAM_MAYOR1, TEAM_CWU_LEADER, TEAM_REFERENT, TEAM_EMPLOYER, TEAM_VASIL, TEAM_SKI}))

rp.AddDoorGroup('Администратор', {TEAM_MAYOR1, TEAM_DVL, TEAM_SEC, TEAM_EPU, TEAM_DAPPCL, TEAM_DAPWARD, TEAM_SKI})

rp.AddDoorGroup('ГСР', rp.GetFactionTeams({FACTION_CWU, FACTION_COMBINE, FACTION_DPF, FACTION_HELIX, FACTION_OTA, FACTION_DAP}, {TEAM_EMPLOYER, TEAM_JUD, TEAM_VASIL}))



--MpF



rp.AddRelationships(TEAM_OTAOVL, RANK_LEADER, {FACTION_COMBINE, FACTION_OTA, FACTION_DPF, FACTION_HELIX})

rp.AddRelationships(TEAM_SEC, RANK_LEADER, {FACTION_COMBINE, FACTION_OTA, FACTION_DPF, FACTION_HELIX})

rp.AddRelationships(TEAM_CMR, RANK_OFFICER, {FACTION_COMBINE})

rp.AddRelationships(TEAM_DVL, RANK_OFFICER, {FACTION_COMBINE})

rp.AddRelationships(TEAM_JUD, RANK_OFFICER, {FACTION_COMBINE})

rp.AddRelationships(TEAM_EPU, RANK_TRAINER, {FACTION_COMBINE})

--DpF

rp.AddRelationships(TEAM_DPFEH, RANK_LEADER, {FACTION_DPF})

--Helix

rp.AddRelationships(TEAM_CPMEDIC3, RANK_LEADER, {FACTION_HELIX})

--DaP

rp.AddRelationships(TEAM_DAPWARDL, RANK_OFFICER, {FACTION_DAP})

rp.AddRelationships(TEAM_DAPPCL, RANK_LEADER, {FACTION_DAP})



rp.AddAgenda('Повестка дня', TEAM_SEC, rp.GetFactionTeams({FACTION_COMBINE, FACTION_DPF, FACTION_HELIX, FACTION_OTA, FACTION_DAP}))

rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_COMBINE, FACTION_DPF, FACTION_HELIX, FACTION_OTA, FACTION_DAP})))



rp.SetFactionVoices({FACTION_COMBINE, FACTION_DPF, FACTION_HELIX, FACTION_DAP, FACTION_LEGION}, {

            {

				label = 'Гражданин',

				sound = 'npc/metropolice/vo/citizen.wav',

				text = 'Гражданин.'

			},

			{

				label = 'Антигражданин',

				sound = 'npc/metropolice/vo/anticitizen.wav',

				text = 'Антигражданин.'

			},

			{

				label = 'Назовись',

				sound = 'npc/metropolice/vo/apply.wav',

				text = 'Назовись.'

			},

			{

				label = 'Принято',

				sound = 'npc/metropolice/vo/affirmative2.wav',

				text = 'Утверждать.'

			},

			{

				label = 'Первое предупреждение',

				sound = 'npc/metropolice/vo/firstwarningmove.wav',

				text = 'Первое предупреждение.'

			},

			{

				label = 'Второе предупреждение',

				sound = 'npc/metropolice/vo/thisisyoursecondwarning.wav',

				text = 'Второе предупреждение.'

			},

			{

				label = 'Последнее предупреждение!',

				sound = 'npc/metropolice/vo/finalwarning.wav',

				text = 'Последнее предупреждение!'

			},

			{

				label = 'Стой',

				sound = 'npc/metropolice/vo/holditrightthere.wav',

				text = 'Стой где стоишь.'

			},

			{

				label = 'Ампутировать',

				sound = 'npc/metropolice/vo/amputate.wav',

				text = 'Ампутировать.'

			},

			{

				label = 'Неподчинение',

				sound = 'npc/metropolice/vo/malcompliant10107my1020.wav',

				text = 'Неподчинение 10-1-07. 10-20 пресекаю!'

			},

			{

				label = 'Неповиновение',

				sound = 'npc/metropolice/vo/issuingmalcompliantcitation.wav',

				text = 'Выдаю предписание о неповиновении!'

			},

			{

				label = 'Вынесение приговора',

				sound = 'npc/metropolice/vo/prepareforjudgement.wav',

				text = 'Подозреваемый, приготовтесь к вынесению приговора.'

			},

			{

				label = 'Приговор выполнен',

				sound = 'npc/metropolice/vo/finalverdictadministered.wav',

				text = 'Приговор приведен в исполнение.'

			},

			{

				label = 'Угроза офицеру',

				sound = 'npc/metropolice/vo/dispatchineed10-78.wav',

				text = 'База 10-7. Офицер под угрозой!'

			},

			{

				label = 'Убит',

				sound = 'npc/metropolice/vo/expired.wav',

				text = 'Убит!'

			},

			{

				label = 'Подходит',

				sound = 'npc/metropolice/vo/matchonapblikeness.wav',

				text = 'Объект подходит по ориентировки.'

			},

			{

				label = 'Помочь?',

				sound = 'npc/metropolice/vo/needanyhelpwiththisone.wav',

				text = 'Помощь нужна?'

			},

			{

				label = 'Убирайся',

				sound = 'npc/metropolice/vo/nowgetoutofhere.wav',

				text = 'А теперь убирайся!'

			},

			{

				label = 'Сломать укрытие',

				sound = 'npc/metropolice/vo/breakhiscover.wav',

				text = 'Сломать его укрытие!'

			},

			{

				label = 'Ха-ха',

				sound = 'npc/metropolice/vo/chuckle.wav',

				text = 'Ха-ха.'

			},

			{

				label = 'Блок управления',

				sound = 'npc/metropolice/vo/controlsection.wav',

				text = 'Блок управления.'

			},

			{

				label = 'Приянто!',

				sound = 'npc/metropolice/vo/copy.wav',

				text = 'Приянто!'

			},

			{

				label = 'Разрушьте укрытие!',

				sound = 'npc/metropolice/vo/destroythatcover.wav',

				text = 'Разрушьте укрытие!',

			},

			{

				label = 'Изучить',

				sound = 'npc/metropolice/vo/examine.wav',

				text = 'Изучить.'

			},

			{

				label = 'Ложись!',

				sound = 'npc/metropolice/vo/getdown.wav',

				text = 'Ложись!'

			},

			{

				label = 'Убирайся отсюда',

				sound = 'npc/metropolice/vo/getoutofhere.wav',

				text = 'Убирайся отсюда.'

			},

			{

				label = 'Граната!',

				sound = 'npc/metropolice/vo/grenade.wav',

				text = 'Граната!'

			},

			{

				label = 'Все чисто',

				sound = 'npc/metropolice/vo/clearandcode100.wav',

				text = 'Все чисто. Код 100'

			},

			{

				label = 'Помогите!',

				sound = 'npc/metropolice/vo/help.wav',

				text = 'Помогите!'

			},

			{

				label = 'Он убегает',

				sound = 'npc/metropolice/vo/hesrunning.wav',

				text = 'Он убегает!'

			},

			{

				label = 'Он там',

				sound = 'npc/metropolice/vo/hesupthere.wav',

				text = 'Он там.'

			},

			{

				label = 'На позиции',

				sound = 'npc/metropolice/vo/inposition.wav',

				text = 'На позиции.'

			},

			{

				label = 'Расследовать',

				sound = 'npc/metropolice/vo/investigate.wav',

				text = 'Расследовать.'

			},

			{

				label = 'Изолировать',

				sound = 'npc/metropolice/vo/isolate.wav',

				text = 'Изолировать.'

			},

			{

				label = 'Проходи',

				sound = 'npc/metropolice/vo/keepmoving.wav',

				text = 'Давай, проходи!'

			},

			{

				label = 'Осторжнее',

				sound = 'npc/metropolice/vo/lookout.wav',

				text = 'Осторжнее!',

			},

			{

				label = 'Двигайся',

				sound = 'npc/metropolice/vo/move.wav',

				text = 'Двигайся.'

			},

			{

				label = 'Отошёл!',

				sound = 'npc/metropolice/vo/movebackrightnow.wav',

				text = 'Отошёл, немедленно!'

			},

			{

				label = 'Отошёл 2',

				sound = 'npc/metropolice/vo/isaidmovealong.wav',

				text = 'Я сказал отойти!'

			},

			{

				label = 'Патруль',

				sound = 'npc/metropolice/vo/patrol.wav',

				text = 'Патруль.'

			},

			{

				label = 'Преследуем',

				sound = 'npc/metropolice/vo/prosecute.wav',

				text = 'Преследуем.'

			},

			{

				label = 'Ограничить',

				sound = 'npc/metropolice/vo/restrict.wav',

				text = 'Ограничить.'

			},

			{

				label = 'Искать',

				sound = 'npc/metropolice/vo/search.wav',

				text = 'Искать.'

			},

			{

				label = 'Выполнить',

				sound = 'npc/metropolice/vo/serve.wav',

				text = 'Выполнить.'

			},

			{

				label = 'Дерьмо!',

				sound = 'npc/metropolice/vo/shit.wav',

				text = 'Дерьмо!'

			},

			{

				label = 'Стерилизовать',

				sound = 'npc/metropolice/vo/sterilize.wav',

				text = 'Стерилизовать.'

			},

			{

				label = 'В укрытие',

				sound = 'npc/metropolice/vo/takecover.wav',

				text = 'В укрутие!'

			},

			{

				label = 'Проблема?',

				sound = 'npc/metropolice/vo/lookingfortrouble.wav',

				text = 'Ищешь неприятности?'

			},

			{

				label = 'Рег.смерть',

				sound = 'npc/metropolice/vo/classifyasdbthisblockready.wav',

				text = 'Зарегистрирована смерть. Квартал готов к зачистке.'

			},

			{

				label = 'Следите за ним',

				sound = 'npc/metropolice/vo/watchit.wav',

				text = 'Следите за ним.'

			},

			{

				label = 'Банка 1',

				sound = 'npc/metropolice/vo/pickupthecan1.wav',

				text = 'Подними эту банку!'

			},

			{

				label = 'Банка 2',

				sound = 'npc/metropolice/vo/pickupthecan2.wav',

				text = 'Подним банку!'

			},

			{

				label = 'Банка 3',

				sound = 'npc/metropolice/vo/pickupthecan3.wav',

				text = 'Я сказал, подними банку!'

			},

			{

				label = 'Банка 4',

				sound = 'npc/metropolice/vo/putitinthetrash1.wav',

				text = 'А теперь положи ее в мусорку!'

			},

			{

				label = 'Банка 5',

				sound = 'npc/metropolice/vo/putitinthetrash2.wav',

				text = 'Я сказал, положи ее в мусорку!'

			},

})



rp.SetFactionVoices({FACTION_OTA}, {

            {

				label = 'Бунтарь', 

				sound = 'npc/combine_soldier/vo/boomer.wav',

				text = 'Бунтарь!'

			},

			{

				label = 'Чисто', 

				sound = 'npc/combine_soldier/vo/cleaned.wav',

				text = 'Чисто!'

			},

			{

				label = 'Заключение', 

				sound = 'npc/combine_soldier/vo/closing.wav',

				text = 'Заключить!'

			},

			{

				label = 'Контакт', 

				sound = 'npc/combine_soldier/vo/contact.wav',

				text = 'Есть контакт!'

			},

			{

				label = 'Задержать', 

				sound = 'npc/combine_soldier/vo/contained.wav',

				text = 'Задержать!'

			},

			{

				label = 'Повтори', 

				sound = 'npc/combine_soldier/vo/copythat.wav',

				text = 'Повтори!'

			},

			{

				label = 'В укрытие', 

				sound = 'npc/combine_soldier/vo/coverhurt.wav',

				text = 'Всем укрыться!'

			},

			

			{

				label = 'Врываемся', 

				sound = 'npc/combine_soldier/vo/dash.wav',

				text = 'Врываемся!'

			},

			{

				label = 'Подражатель', 

				sound = 'npc/combine_soldier/vo/echo.wav',

				text = 'Подражатель!'

			},

			{

				label = 'Очаровательно', 

				sound = 'npc/combine_soldier/vo/engaging.wav',

				text = 'Очаровательно!'

			},

			{

				label = 'Вспышка', 

				sound = 'npc/combine_soldier/vo/flash.wav',

				text = 'Вспышка!'

			},

			{

				label = 'Чисто', 

				sound = 'npc/combine_soldier/vo/flatline.wav',

				text = 'Можно идти!'

			},

			{

				label = 'Призрак', 

				sound = 'npc/combine_soldier/vo/ghost.wav',

				text = 'Призрак!'

			},

			{

				label = 'Сетка', 

				sound = 'npc/combine_soldier/vo/grid.wav',

				text = 'Тут сетка!'

			},

			{

				label = 'Медик', 

				sound = 'npc/combine_soldier/vo/helix.wav',

				text = 'МЕДИК!'

			},

			{

				label = 'Прибывший', 

				sound = 'npc/combine_soldier/vo/inbound.wav',

				text = 'Ей, прибывший!'

			},

			{

				label = 'Заражение', 

				sound = 'npc/combine_soldier/vo/infected.wav',

				text = 'Он заражен!'

			},

			{

				label = 'Юниты прибывают', 

				sound = 'npc/combine_soldier/vo/unitisinbound.wav',

				text = 'Юниты уже прибывают!'

			},

			{

				label = 'Юнит движется', 

				sound = 'npc/combine_soldier/vo/unitismovingin.wav',

				text = 'Юнит движется вперед!'

			},

			{

				label = 'Осуждение', 

				sound = 'npc/combine_soldier/vo/judge.wav',

				text = 'Осуждение!'

			},

			{

				label = 'Лидер', 

				sound = 'npc/combine_soldier/vo/leader.wav',

				text = 'Лидер!'

			},

			{

				label = 'Нет контакта', 

				sound = 'npc/combine_soldier/vo/lostcontact.wav',

				text = 'Контакт потерян!'

			},

			{

				label = 'Проходи', 

				sound = 'npc/combine_soldier/vo/movein.wav',

				text = 'Проходи!'

			},

			{

				label = 'Бродяга', 

				sound = 'npc/combine_soldier/vo/nomad.wav',

				text = 'Бродяга!'

			},

			{

				label = 'Взрыв', 

				sound = 'nnpc/combine_soldier/vo/outbreak.wav',

				text = 'Взрыв!'

			},

			{

				label = 'Возвращаемся', 

				sound = 'npc/combine_soldier/vo/payback.wav',

				text = 'Возвращаемся!'

			},

			{

				label = 'Фантом', 

				sound = 'npc/combine_soldier/vo/phantom.wav',

				text = 'Фантом!'

			},

			{

				label = 'Преследовать', 

				sound = 'npc/combine_soldier/vo/procecuting.wav',

				text = 'Преследуем его!'

			},

			{

				label = 'Ловушка', 

				sound = 'npc/combine_soldier/vo/quicksand.wav',

				text = 'Это ловушка!'

			},

			{

				label = 'Найти', 

				sound = 'npc/combine_soldier/vo/range.wav',

				text = 'Прочешите здесь все!'

			},

			{

				label = 'Приготовить взрывчатку', 

				sound = 'npc/combine_soldier/vo/readycharges.wav',

				text = 'Приготовить взрывчатку!'

			},

			{

				label = 'Приготовить оружие', 

				sound = 'npc/combine_soldier/vo/readyweapons.wav',

				text = 'Приготовить оружие!'

			},

			

			{

				label = 'Здесь чисто', 

				sound = 'npc/combine_soldier/vo/reportingclear.wav',

				text = 'Докладываю, здесь чисто!'

			},

			{

				label = 'Дикарь', 

				sound = 'npc/combine_soldier/vo/savage.wav',

				text = 'Дикарь!'

			},



			{

				label = 'Сектор не стерилен', 

				sound = 'npc/combine_soldier/vo/confirmsectornotsterile.wav',

				text = 'Сектор не стерилен!'

			},

			{

				label = 'Охрана Сектора', 

				sound = 'npc/combine_soldier/vo/sectorisnotsecure.wav',

				text = 'Сектор под охраной!'

			},

			{

				label = 'Охранять', 

				sound = 'npc/combine_soldier/vo/secure.wav',

				text = 'Охранять!'

			},

			{

				label = 'Опасная Зона', 

				sound = 'npc/combine_soldier/vo/sharpzone.wav',

				text = 'Здесь опасная зона!'

			},

			{

				label = 'Мина', 

				sound = 'npc/combine_soldier/vo/slam.wav',

				text = 'Здесь мина!'

			},

			{

				label = 'Стой', 

				sound = 'npc/combine_soldier/vo/standingby].wav',

				text = 'Стой на месте'

			},

			{

				label = 'Внимательнее', 

				sound = 'npc/combine_soldier/vo/stayalert.wav',

				text = 'Будь внимательнее!'

			},

			{

				label = 'Попал ', 

				sound = 'npc/combine_soldier/vo/striker.wav',

				text = 'Я попал!'

			},

			{

				label = 'Зачищаю', 

				sound = 'npc/combine_soldier/vo/sweepingin.wav',

				text = 'Зачищаю!'

			},

			{

				label = 'Быстрее', 

				sound = 'npc/combine_soldier/vo/swift.wav',

				text = 'Давай быстрее!'

			},

			

			{

				label = 'Займите Позиции', 

				sound = 'npc/combine_soldier/vo/stabilizationteamholding.wav',

				text = 'Группа захвата, займите позиции!'

			},

			{

				label = 'Маскировка', 

				sound = 'npc/combine_soldier/vo/uniform.wav',

				text = 'Это маскировка!'

			},

			{

				label = 'Наблюдаю', 

				sound = 'npc/combine_soldier/vo/visualonexogen.wav',

				text = 'Наблюдаю за обьектом!'

			},

			{

				label = 'Вот и все', 

				sound = 'npc/combine_soldier/vo/thatsitwrapitup.wav',

				text = 'Что ж, вот и все!'

			},

			{

				label = 'Код Меч', 

				sound = 'npc/combine_soldier/vo/sword.wav',

				text = 'Код : Меч!'

			},

			{

				label = 'Код Нова', 

				sound = 'npc/combine_soldier/vo/nova.wav',

				text = 'Код : Нова!'

			},

			{

				label = 'Код Нож', 

				sound = 'npc/combine_soldier/vo/stab.wav',

				text = 'Код : Нож'

			},

			{

				label = 'Код Зачистка', 

				sound = 'npc/combine_soldier/vo/sweeper.wav',

				text = 'Код : Зачистка!'

			},

			{

				label = 'Код Закат', 

				sound = 'npc/combine_soldier/vo/sundown.wav',

				text = 'Код : Закат!'

			},

			{

				label = 'Код Отсечь', 

				sound = 'npc/combine_soldier/vo/slash.wav',

				text = 'Код : Отсечь'

			},

			{

				label = 'Код Тень', 

				sound = 'npc/combine_soldier/vo/shadow.wav',

				text = 'Код : Тень!'

			},

			{

				label = 'Код Жнец', 

				sound = 'npc/combine_soldier/vo/reaper.wav',

				text = 'Код : Жнец!'

			},

			{

				label = 'Код Бритва', 

				sound = 'npc/combine_soldier/vo/razor.wav',

				text = 'Код : Бритва!'

			},

			{

				label = 'Код Булава', 

				sound = 'npc/combine_soldier/vo/mace.wav',

				text = 'Код : Булава!'

			},

			{

				label = 'Код Ураган', 

				sound = 'npc/combine_soldier/vo/hurricane.wav',

				text = 'Код : Ураган!'

			},

			{

				label = 'Код Молот', 

				sound = 'npc/combine_soldier/vo/hammer.wav',

				text = 'Код : Молот!'

			},

			{

				label = 'Код Кинжал', 

				sound = 'npc/combine_soldier/vo/dagger.wav',

				text = 'Код : Кинжал!'

			},

			{

				label = 'Код Антисептик',

				sound = 'npc/combine_soldier/vo/antiseptic.wav',

				text = 'Код : Антисептик!'

			},

			{

				label = 'Код Апекс', 

				sound = 'npc/combine_soldier/vo/apex.wav',

				text = 'Код : Апекс!'

			},

})



rp.AddTeamVoices(TEAM_SEC, {

	{

		label = 'Код беспорядок',

		sound = 'npc/overwatch/cityvoice/f_unrestprocedure1_spkr.wav', 

		text = 'Граждане, введен код действия при беспорядках. Код: обезвредить, защитить, усмирить. Код: подавить, меч, стерилизовать.', 

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Отказ в сотруднечестве',

		color = Color(0, 0, 205),

		sound = 'npc/overwatch/cityvoice/f_trainstation_offworldrelocation_spkr.wav', 

		text = 'Граждане, отказ в сотрудничестве будет наказан выселением в нежилое пространство.',

		broadcast = true,

		soundDuration = 15 

	},

	{

		label = 'Отклонение в численности',

		color = Color(0, 0, 205),

		sound = 'npc/overwatch/cityvoice/f_trainstation_cooperation_spkr.wav', 

		text = 'Вниманию жителей! Замечено отклонение численности. Сотрудничество с отрядом ГО награждается полным пищевым рационом.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Индитификация',

		color = Color(0, 0, 205),

		sound = 'npc/overwatch/cityvoice/f_trainstation_assemble_spkr.wav', 

		text = 'Вниманию гражданам! Производится проверка идентификации. Занять назначенные для инспекции места.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Угроза 1 уровня',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/f_sociolevel1_4_spkr.wav', 

		text = 'Гражданин, Вы угроза обществу первого уровня. Подразделениям ГО, код пресечения: долг, меч, полночь.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Недоносительство',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/f_rationunitsdeduct_3_spkr.wav', 

		text = 'Вниманию жителей! Ваш квартал обвиняется в недоносительстве. Штраф - пять пищевых единиц.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Красный Код',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/f_protectionresponse_5_spkr.wav', 

		text = 'Вниманию всех наземных сил: судебное разбирательство отменено. Смертная казнь - по усмотрению.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Уклонение от надзора',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/f_protectionresponse_1_spkr.wav', 

		text = 'Вниманию отряда гражданской обороны, обнаружено уклонение от надзора. Отреагировать, изолировать, допросить.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Беспорядки',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/f_localunrest_spkr.wav', 

		text = 'Тревога! Подразделениям гражданской обороны, обнаружены локальные беспорядки. Собрать, исполнить, усмирить.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Бездействие приступно',

		color = Color(0, 0, 205),

		sound = 'npc/overwatch/cityvoice/f_innactionisconspiracy_spkr.wav', 

		text = 'Граждане: бездействие преступно. О противоправном поведении немедленно доложить силам ГО.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Неопознанное лицо',

		color = Color(0, 0, 205),

		sound = 'npc/overwatch/cityvoice/f_confirmcivilstatus_1_spkr.wav', 

		text = 'Внимание! Неопознанное лицо. Немедленно подтвердить статус в отделе гражданской обороны.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Множественно нарушение',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/f_citizenshiprevoked_6_spkr.wav', 

		text = 'Гражданин, вы обвиняетесь во множественных нарушениях. Гражданство отозвано. Статус: злостный нарушитель.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Угроза 5 уровня',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/f_ceaseevasionlevelfive_spkr.wav', 

		text = 'Гражданин, теперь Вы угроза обществу пятого уровня. Немедленно прекратить уклонение и выслушать приговор.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Нелегальное оружие',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/fcitadel_confiscating.wav', 

		text = 'Тревога безопасности: обнаружено незарегистрированное оружие. Конфискационное поле включено.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Антиобщественная деятельность',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/f_anticivilevidence_3_spkr.wav', 

		text = 'Отряду гражданской обороны: признаки антиобщественной деятельности. Код: собрать, окружить, задержать.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Нарушение 2 уровня',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/f_anticivil1_5_spkr.wav', 

		text = 'Гражданин, Вы обвиняетесь в несоответствии второго уровня и антиобщественной деятельности первого уровня. Силам ГО, обвинительный код: долг, меч, выполнять.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Код изолировать',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/f_evasionbehavior_2_spkr.wav', 

		text = 'Вниманию отряда гражданской обороны, обнаружено уклонение от надзора. Отреагировать, изолировать, допросить.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Отключены ограничители периметра',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/fprison_restrictorsdisengaged.wav', 

		text = 'Приоритетное предупреждение: ограничители периметра отключены. Всем участникам стабилизации немедленно выдвинуться в месте вторжения.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Аномальная активность',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/fprison_nonstandardexogen.wav', 

		text = 'Тревога, обнаружена аномальна внешняя активность, следовать процедуре сдерживания и докладывать.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Код:Пожертвовать,остановить,устронить',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/fprison_missionfailurereminder.wav', 

		text = 'Внимание наземным частям: провал миссии влечёт за собой отправление на тот свет. Напоминаю код: жертва, коагуляция, зажим.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Вирусный интерфейс',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/fprison_interfacebypass.wav', 

		text = 'Внимание,обнаружено подключение вирусного интерфейса ,стабилизаторы и поля сдерживания в опасности.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Угроза вторжения',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/fprison_freemanlocated.wav', 

		text = 'Внимание, обнаружен злокачественный взлом интерфейса. Обнаружено перепрограммирование полифазного ядра. Стерилизаторы и заграждающие поля могут оказаться под угрозой.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Доложите о вторжении',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/fprison_detectionsystemsout.wav', 

		text = 'Внимание, системы наблюдения и обнаружения неактивны. Оставшимся членам стабилизацинного отряда сообщить статус сдерживания.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Директива 2',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/fprison_containexogens.wav', 

		text = 'Директива номер два, задействовать резерв, сдерживать вторжение из вне.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Последовательность сингуляностей',

		color = Color(220, 20, 60),

		sound = 'npc/overwatch/cityvoice/fcitadel_transportsequence.wav', 

		text = 'Внимание. Последовательная блокировка сингулярного перемещения приведена в действие.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = '3 минуты до сингулярности',

		color = Color(0, 0, 205),

		sound = 'npc/overwatch/cityvoice/fcitadel_3minutestosingularity.wav', 

		text = 'Внимание: три минуты до сингулярности.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = '2 минуты до сингулярности',

		color = Color(0, 0, 205),

		sound = 'npc/overwatch/cityvoice/fcitadel_2minutestosingularity.wav', 

		text = 'Внимание: две минуты до сингулярности.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = '1 минуты до сингулярности',

		color = Color(0, 0, 205),

		sound = 'npc/overwatch/cityvoice/fcitadel_1minutetosingularity.wav', 

		text = 'Внимание: одна минута до сингулярности.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = '45 секунд до сингулярности',

		color = Color(0, 0, 205),

		sound = 'npc/overwatch/cityvoice/fcitadel_45sectosingularity.wav', 

		text = 'Приоритетное внимание: сорок пять секунд до сингулярности.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = '30 секунд до сингулярности',

		color = Color(0, 0, 205),

		sound = 'npc/overwatch/cityvoice/fcitadel_30sectosingularity.wav', 

		text = 'Приоритетное внимание: тридцать секунд до сингулярности.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = '15 секунд до сингулярности',

		color = Color(0, 0, 205),

		sound = 'npc/overwatch/cityvoice/fcitadel_15sectosingularity.wav', 

		text = 'Приоритетное внимание: пятнадцать секунд до сингулярности.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = '10 секунд до сингулярности',

		color = Color(0, 0, 205),

		sound = 'npc/overwatch/cityvoice/fcitadel_10sectosingularity.wav', 

		text = 'Приоритетное внимание: десять секунд до сингулярности.',

		broadcast = true,

		soundDuration = 15

	},

 })