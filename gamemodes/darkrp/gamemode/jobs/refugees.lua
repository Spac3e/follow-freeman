
-----------------------------------------------------


local refugees_spawns = {
	rp_city17_utfim = rp.GetSpawnPoint(SPAWN_RESTAURANT)
}



local birds_spawns = {
	rp_city17_utfim = {Vector(1250.136841,-831.998352,912.031250)}, 
}



local rebel_points = {

	[SPAWN_D6] = true,

	[SPAWN_BUNKER] = true,

	[SPAWN_RESTAURANT] = true,

}



local citizens = {'models/player/Group01/Female_01.mdl', 'models/player/Group01/Female_02.mdl', 'models/player/Group01/Female_03.mdl', 'models/player/Group01/Female_04.mdl', 'models/player/Group01/Female_06.mdl', 'models/player/group01/male_01.mdl', 'models/player/Group01/Male_02.mdl', 'models/player/Group01/Male_05.mdl', 'models/player/Group01/Male_06.mdl', 'models/player/Group01/Male_07.mdl', 'models/player/Group01/Male_08.mdl', 'models/player/Group01/Male_09.mdl'}



rp.addTeam('Беженец', {

	color = Color(100, 117, 109),

	model = citizens,

	description = [[Житель сбежавший в закрытый сектор, но не вступивший в ряды сопротивления.]],

	spawns = refugees_spawns,

	spawn_points = rebel_points,

	command = 'refugee',

	max = 0,

	salary = 2,

	speed = 0.8,

	hobo = true,

	faction = FACTION_REFUGEES,

	rationCount = 1,

	loyalty = 1

})





TEAM_HOBO = rp.addTeam('Жертва Альянса', {

	color = Color(189, 183, 107),

	model = 'models/player/corpse1.mdl',

	description = [[Несчастная жертва какого-то эксперимента.]],

	weapons = {'weapon_bugbait'},

	spawns = refugees_spawns,

	spawn_points = rebel_points,

	command = 'hobo',

	max = 0,

	salary = 2,

	speed = 0.8,

	hobo = true,

	faction = FACTION_REFUGEES,

	rationCount = 1,

	loyalty = 1

})



TEAM_DOG = rp.addTeam('Пёс', {

	color = Color(189, 183, 107),

	model = 'models/doge_player/doge_player_fix.mdl',

	description = [[Вы обычный пёс, которого приютили повстанца



Разрешено действовать везде!



Правила:

Категорически запрещено ношение и использование оружия

Кусать можно только в целях самозащиты или если приказал хозяин

]],

	weapons = {'weapon_dogswep'},

	command = 'dog',

	spawn_points = rebel_points,

	max = 2,

	salary = 7,

	admin = 0,

	candemote = false,

	hirable = true,

	hirePrice = 10,

	spawns = refugees_spawns,

	PlayerSpawn = function(pl)

		pl:SetHealth(50)

		pl:SetMaxHealth(50)

	end,

	unlockTime = 100*3600,

	unlockPrice = 10000,

	faction = FACTION_REFUGEES,

})



TEAM_PIGEON = rp.addTeam("Голубь", {

	color = Color(150, 151, 165),

	model = {"models/pigeon.mdl"},

	description = [[-300

]],

	salary = 3,

	spawn_points = empty,

	command = "pigeon",

	weapons = {"weapon_bird"},

	faction = FACTION_REFUGEES,

	spawns = birds_spawns,

	PlayerSpawn = function(ply) ply:SetMaxHealth(50) ply:SetHealth(50) end,

	customCheck = function(ply) return ply:HasUpgrade('job_pigeon') end,

	build = false,

})



TEAM_CROW = rp.addTeam("Ворона", {

	color = Color(35, 42, 52),

	model = {"models/crow.mdl"},

	description = [[-300

]],

	salary = 3,

	spawn_points = empty,

	command = "crow",

	weapons = {"weapon_bird"},

	faction = FACTION_REFUGEES,

	spawns = birds_spawns,

	PlayerSpawn = function(ply) ply:SetMaxHealth(50) ply:SetHealth(50) end,

	customCheck = function(ply) return ply:HasUpgrade('job_crow') end,

	build = false,

})



TEAM_SEAGULL = rp.addTeam("Чайка", {

	color = Color(145, 142, 137),

	model = {"models/seagull.mdl"},

	description = [[-300

]],

	salary = 3,

	spawn_points = empty,

	command = "seagull",

	weapons = {"weapon_bird"},

	faction = FACTION_REFUGEES,

	spawns = birds_spawns,

	PlayerSpawn = function(ply) ply:SetMaxHealth(50) ply:SetHealth(50) end,

	customCheck = function(ply) return ply:HasUpgrade('job_seagull') end,

	build = false,

})

