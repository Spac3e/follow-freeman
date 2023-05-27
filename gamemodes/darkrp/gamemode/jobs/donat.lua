
local rebel_spawns = {
	rp_city17_urfim = rp.GetSpawnPoint(SPAWN_D6),

}



local rebel_points = {

	[SPAWN_D6] = true,

	[SPAWN_BUNKER] = true,

	[SPAWN_RESTAURANT] = true,

	[SPAWN_D6] = true,

}



local ofc_spawns = {
	rp_city17_urfim = {Vector(3919.557373,-1659.989136,76.031250), Vector(3922.026367,-1751.449219,76.031250), Vector(3922.914551,-1781.730591,76.031250)},
}

local outlaws_spawns = rp.GetSpawnPoint(SPAWN_RESTAURANT)

local ota_spawns = {
    rp_city17_urfim = {Vector(4705.453613,178.770081,76.031250), Vector(4706.961426,98.089737,76.031250), Vector(4828.361816,279.154175,76.031250)},
}
local zombie_spawns = {
	rp_city17_urfim = {Vector(1977.123901,4740.608887,-465.968750), Vector(1802.043457,2433.118652,-465.968750), Vector(1839.369873,-337.055573,-465.197449), Vector(-223.353119,-5070.139160,-465.968750)},
}





--Gameshop

if !isSerious then

TEAM_SHEPARD = rp.addTeam("Адриан Шепард", {

	color = Color(2, 105, 48),

	model = {"models/wgrunt/wgrunt1/wgrunt1.mdl"},

	description = [[

Капрал Адриан Шепард - капрал морской пехоты США, назначенный в войска HECU. 

Он является одним из солдат, отправленных в Чёрную Мезу для того, чтобы уничтожить захватчиков из Зена, а затем заставить замолчать свидетелей.



Был выведен из стазиса G - MAN'ом по нейзвестной причине.



Имеет возможность маскироваться.



Разрешено действовать во всех секторах (в том числе и в одиночку)

]],

	weapons = {"swb_357", "swb_mp5", "swb_ar3", "swb_shotgun", "lockpick", "keypad_cracker", "weapon_frag", "swb_shotgun"},

	salary = 30,

	spawn_points = rebel_points,

	command = "shepard",

	max = 1,

	spawns = rebel_spawns,

	faction = FACTION_HECU,

	rationCount = 5,

	loyalty = 1,

	candisguise = true,

	disguise_faction = FACTION_COMBINE,

	canCapture = true,

	customCheck = function(ply) return ply:HasUpgrade('job_shepard') end,

	PlayerSpawn = function(ply) ply:GiveArmor(150) end,

})

end



if !isSerious then

TEAM_ODESSA = rp.addTeam("Одесса Кэббедж", {

	color = Color(100, 117, 109),

	model = {"models/player/odessa.mdl"},

	description = [[

«Полковник» Одесса Кэббедж — один из лидеров Сопротивления.



Имеет возможность ставить раздатчики здоровья и брони.

Разрешено действовать во всех секторах в группе от 3 человек. 

]],

	weapons = {"swb_357", "swb_ar2", "swb_shotgun", "lockpick", "keypad_cracker", "weapon_frag", "weapon_rpg"},

	salary = 35,

	spawn_points = rebel_points,

	command = "odessa",

	max = 1,

	spawns = rebel_spawns,

	faction = FACTION_HECU,

	canCapture = true,

	rationCount = 5,

	loyalty = 1,

	customCheck = function(ply) return ply:HasUpgrade('job_odessa') end,

	PlayerSpawn = function(ply) ply:GiveArmor(100) end,

})

end

--Owndonat

if !isSerious then

TEAM_VASIL = rp.addTeam('Житель Ксен', {

	color = Color(255, 99, 71),

	model = {"models/dizcordum/reaper.mdl",'models/sup/player/custom/destruction/r6s_kapkan.mdl'},

	description = [[ VASIL

	]],

	weapons = {"swep_vortigaunt_beam", "lockpick", "keypad_cracker","weapon_ota_reprogrammer","sh_blinkswep"},

	PlayerSpawn = function(ply) ply:GiveArmor(1000) ply:SetHealth(240) ply:SetMaxHealth(240) end,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:0:27295674" or ply:IsRoot() end,

	command = 'vasil',

	salary = 30,

	faction = FACTION_REFUGEES,

	rationCount = 3,

	loyalty = 4

})

end



if !isSerious then

rp.addTeam("Боец Альфа", {

    color = Color(3, 175, 170),

	model = "models/player/phoenix.mdl",

	description = [[Уважаемый, Иван, это видишь только ты. Приятной игры и ждем следующих заказов. 

По всем вопросам можешь обращаться к менеджеру.]],

	weapons = {"weapon_pistol","swb_ar3", "lockpick", "keypad_cracker", "swb_knife", "swb_shotgun","swb_357"},

	salary = 30,

	max = 1,

	command = "alphaboy",

	spawns = outlaws_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(150) end,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:1:157732145" or ply:IsRoot() end,

	faction = FACTION_BANDITS,

	rationCount = 3,

	loyalty = 3,

	hitman = true,

})

end 



if !isSerious then

rp.addTeam("Элитный повстанец", {

    color = Color(3, 175, 170),

	model = "models/player/phoenix.mdl",

	description = [[Уважаемый, Иван, это видишь только ты. Приятной игры и ждем следующих заказов. 

По всем вопросам можешь обращаться к менеджеру.]],

	weapons = {"weapon_pistol","swb_ar3", "lockpick", "keypad_cracker", "swb_knife", "swb_shotgun","swb_357"},

	salary = 30,

	max = 1,

	command = "epish",

	spawns = outlaws_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(150) end,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:0:127940598" or ply:IsRoot() end,

	faction = FACTION_BANDITS,

	rationCount = 3,

	loyalty = 3,

	hitman = true,

})

end



if !isSerious then

rp.addTeam("Striker", {

    color = Color(0, 72, 255, 255),

	model = "models/player/combine_super_shotgunner_armored_fix.mdl",

	description = [[Добрый день. Это личная профессия Максима Шипилова. Приятной игры.

Разработка доктора Кляйнера украденная и принесённая в цитадель шпионом после чего был перепрограммирован и отправлен обратно.

]],

	weapons = {"swb_pistol","weapon_bp_rtboicw", "lockpick", "keypad_cracker", "swb_knife", "swb_shotgun", "swb_ar3", "weapon_pulsesaw"},

	salary = 30,

	max = 0,

	command = "strik",

	spawns = ofc_spawns,

	spawn_points = empty,

	PlayerSpawn = function(ply) ply:GiveArmor(250) end,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:0:130426870" or ply:IsRoot() end,

	faction = FACTION_DPF,

	rationCount = 4,

	loyalty = 4

})

end



if !isSerious then

rp.addTeam("Диктатор", {

    color = Color(0, 72, 255, 255),

	model = "models/fraggerhir/combine_super_soldier.mdl",

	description = [[Добрый день. Это личная профессия Максима Шипилова. Приятной игры..

]],

	weapons = {"swb_pistol","lockpick", "swb_ak47", "swb_shotgun"},

	salary = 30,

	max = 0,

	command = "Diktat",

	spawns = ofc_spawns,

	spawn_points = empty,

	PlayerSpawn = function(ply) ply:GiveArmor(1000) ply:SetHealth(150) end,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:0:130426870" or ply:IsRoot() end,

	faction = FACTION_DPF,

	rationCount = 2,

	loyalty = 4

})

end



if !isSerious then

TEAM_ZAEBAL = rp.addTeam("Подрывник", {

	color = Color(100, 117, 109),

	model = {"models/player/leet.mdl"},

	description = [[ Reidi 

	]],

	weapons = {"swb_357", "swb_ar2", "swb_shotgun", "lockpick", "keypad_cracker", "weapon_c4"},

	salary = 20,

	spawn_points = rebel_points,

	command = "zaebal",

	max = 2,

	spawns = rebel_spawns,

	armor = 200,

	faction = FACTION_REBEL,

	rationCount = 5,

	loyalty = 1,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:1:38042351" or ply:IsRoot() end,

})

end



if !isSerious then

TEAM_CEC = rp.addTeam("OwC.CeC", {

	color = Color(0, 72, 255, 255),

	model = "models/frosty/sparbine_players/sparbine_cop_pm_fix.mdl",

	description = [[Уважаемый, Егор, это видишь только ты. Приятной игры и ждем следующих заказов. 

По всем вопросам можешь обращаться к менеджеру.]],

	weapons = {"weapon_radio", "nut_stunstick", "weapon_hcanister", "swb_ar2", "swb_357", "weapon_frag", "door_ram", "weapon_taser", "weapon_bp_hopwire"},

	spawns = ofc_spawns,

	spawn_points = empty,

	salary = 32,

	command = 'cec',

	max = 1,

	admin = 0,

	candemote = true,

	vote = false,

	hasLicense = false,

	PlayerSpawn = function(ply) ply:GiveArmor(200) end,

	faction = FACTION_COMBINE,

	rationCount = 5,

	canCapture = true,

	loyalty = 4,

    customCheck = function(ply) return ply:SteamID() == "STEAM_0:1:56357166" or ply:IsRoot() end,

})

end



if !isSerious then

TEAM_GMAN = rp.addTeam('Эксперимент №173', {

	color = Color(148, 0, 211),

	model = "models/hidden/hidden.mdl", 

	description = [[Доброго времени суток, Максим назаров, только ты видишь эту професссию и только ты можешь ей воспользоваться.

	Приятной игры и ждем следующих заказов. 

]],

	command = 'e173',

	weapons = {'sh_blinkswep'},

	salary = 20,

	faction = FACTION_REFUGEES,

	rationCount = 5,

	loyalty = 4,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:1:108331767" or ply:IsRoot() end,

	PlayerSpawn = function(ply) ply:GiveArmor(300) end,

})

end



if !isSerious then

TEAM_OTA = rp.addTeam("OTA.SWORD.SEG", {

	color = Color(255, 0, 0),

	model = "models/frosty/sparbine_players/sparbine_prisonguard_pm.mdl",

	description = [[Добрый день. Это личная профессия Никиты Ворошнина. Приятной игры и ждем следующих заказов. 

                   По всем вопросам можете обращаться к менеджеру.

Лояльность ГО: Максимальная



Сектор D6: Допущен к охране периметра и к организации вылазок

Нексус: Полный доступ, кроме кабинета Администратора



Командует OTA.SlH-]],

	weapons = {"weapon_radio", "weapon_hcanisterf", "swb_357", "swb_ar3", "swb_shotgun", "weapon_frag", "door_ram", "weapon_taser", "weapon_bp_hopwire", "weapon_bp_binoculars"},

	command = "otaseg",

	spawns = ota_spawns,

	spawn_points = empty,

	salary = 39,

	max = 4,

	PlayerSpawn = function(ply) ply:GiveArmor(250) end,

	faction = FACTION_OTA,

	canCapture = true,

	customCheck = function(ply) return ply:GetOrg() == "Russian Army" or ply:IsRoot() end,

	rationCount = 4,

	loyalty = 4

})

end



if !isSerious then

TEAM_DEZ = rp.addTeam("Мясник", {

    color = Color(3, 175, 170),

	model = "models/player/tnb/citizens/male_13.mdl",

SetBodygroups = function(ply)

	ply:SetSkin(0)

	ply:SetBodygroup(1, 7)

	ply:SetBodygroup(2, 6)

	ply:SetBodygroup(3, math.random(0,1))

	ply:SetBodygroup(4, math.random(0,1))

	end,

	description = [[Добрый день. Это личная профессия Никиты Ворошнина. Приятной игры.

Безжалостный маньяк. Убивайте или грабьте своих жертв, если по близости нет свидетелей.

]],

	weapons = {"swb_pistol","swb_smg", "lockpick", "keypad_cracker", "swb_knife", "weapon_bp_iceaxe", "weapon_hl2axe", "weapon_bp_binoculars"},

	salary = 15,

	max = 4,

	command = "outl6",

	spawns = outlaws_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(100) end,

	customCheck = function(ply) return ply:GetOrg() == "Russian Army" or ply:IsRoot() end,

	faction = FACTION_BANDITS,

	rationCount = 1,

	loyalty = 2

})

end



if !isSerious then

TEAM_ZOMBI_COMB = rp.addTeam("Зомби - скаут", {

	color = Color(218, 0, 0),

	model = "models/dpfilms/metropolice/playermodels/pm_zombie_police_fix.mdl",

	description = [[Координирует действиями зомби.



Быстро дивигается, неплохо бьёт, бронирован.



Может превращать игроков в зомби, для этого киньте в них заразой.



Разрешено действовать в пределах D6-D4 в одиночку.

Разрешено организовывать рейд в паре или группе.

]],

	salary = 30,

	spawn_points = empty,

	punchMin = 40,

	punchMax = 50,

	critMin = 50,

	critMax = 100,

	command = "zombiescout",

	weapons = {"weapon_zombie_fists", "climb_swep", "weapon_throw_toxic", "weapon_biohazardball", "weapon_throw", "weapon_throw_fast"},

	PlayerSpawn = function(ply) ply:GiveArmor(200) end,

	spawns = zombie_spawns,

	faction = FACTION_ZOMBIE,

	rationCount = 0,

	build = false,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:0:134834658" or ply:IsRoot() end,

	max = 1,

	loyalty = 4

})

end



rp.AddDoorGroup('Лазарет', rp.GetFactionTeams({FACTION_COMBINE, FACTION_DPF, FACTION_OTA, FACTION_HELIX, FACTION_DAP}, {TEAM_KAEF, TEAM_MAYOR1, TEAM_CWU_LEADER, TEAM_REFERENT}))

rp.AddDoorGroup('Нексус', rp.GetFactionTeams({FACTION_COMBINE, FACTION_DPF, FACTION_OTA, FACTION_HELIX, FACTION_DAP, FACTION_LEGION}, {TEAM_KAEF, TEAM_MAYOR1, TEAM_CWU_LEADER, TEAM_REFERENT, TEAM_EMPLOYER, TEAM_VASIL, TEAM_SKI}))

rp.AddDoorGroup('Администратор', {TEAM_MAYOR1, TEAM_DVL, TEAM_SEC, TEAM_EPU, TEAM_EMPLOYER, TEAM_DAPPCL, TEAM_DAPWARD, TEAM_SKI})

rp.AddDoorGroup('Сопротивление', rp.GetFactionTeams(FACTION_REBEL, FACTION_HECU))

rp.AddDoorGroup('HECU', rp.GetFactionTeams(FACTION_HECU))

rp.AddDoorGroup('Изгои', rp.GetFactionTeams(FACTION_BANDITS))



rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_COMBINE, FACTION_DPF, FACTION_HELIX, FACTION_OTA, FACTION_DAP})))

rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_REBEL, FACTION_HECU, FACTION_HECU})))

rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_ZOMBIE})))

rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_BANDITS})))