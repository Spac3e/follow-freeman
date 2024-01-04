
-----------------------------------------------------
--

-- REB

--

local rebels_models = {

'models/player/tnb/citizens/male_02.mdl',

'models/player/tnb/citizens/male_03.mdl',

'models/player/tnb/citizens/male_04.mdl',

'models/player/tnb/citizens/male_05.mdl',

'models/player/tnb/citizens/male_06.mdl',

'models/player/tnb/citizens/male_07.mdl',

'models/player/tnb/citizens/male_08.mdl',

'models/player/tnb/citizens/male_09.mdl',}

--local rebels_green = {'models/player/group03/female_01.mdl', 'models/player/group03/female_03.mdl', 'models/player/group03/female_05.mdl', 'models/player/group03/female_06.mdl', 'models/player/group03/male_01.mdl', 'models/player/group03/male_04.mdl', 'models/player/group03/male_06.mdl', 'models/player/group03/male_08.mdl', 'models/player/group03/male_09.mdl'}

--local rebel_docs = {'models/player/group03/female_01.mdl', 'models/player/group03m/female_05.mdl', 'models/player/group03m/female_03.mdl', 'models/player/group03m/male_03.mdl', 'models/player/group03m/male_04.mdl', 'models/player/group03m/male_06.mdl', 'models/player/group03m/male_09.mdl'}



local rebel_spawns = {
	rp_city17_utfim = rp.GetSpawnPoint(SPAWN_D6),
}



local rebel_points = {

	[SPAWN_D6] = true,

	[SPAWN_BUNKER] = true,

	[SPAWN_RESTAURANT] = true,

}



local rebel_melee_sweps = {'weapon_hl2axe', 'weapon_hl2bottle', 'weapon_hl2hook', 'weapon_hl2pan', 'weapon_hl2pickaxe', 'weapon_hl2pipe', 'weapon_hl2pot', 'weapon_hl2shovel',}

local function giveRandomMelee(ply) ply:Give(table.Random(rebel_melee_sweps)) end



rp.addTeam("Рядовой Повстанец", {

	color = Color(100, 117, 109),

	model =  rebels_models,

	description = [[Вы - Постоянный член Сопротивления.



Подчиняетесь всем, кто входит в состав Сопротивления. 

Обязан явиться на сбор Илая Вэнса по первому зову.



Запрещено покидать D6]],

	weapons = {'salute'},

	salary = 5,

	command = "rebel1",

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	rationCount = 1,

	max = 4,

	PlayerLoadout = giveRandomMelee,

	unlockPrice = 250,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

	ply:SetBodygroup(1, 9)

	ply:SetBodygroup(2, 4)

	ply:SetBodygroup(3, 1)

	ply:SetBodygroup(4, table.Random({0,3,4}))

	end,

	unlockTime = 0.5*3600,

	loyalty = 1

})



--rp.addTeam("Взломщик Сопротивления", {

--	color = Color(100, 117, 109),

--	model = rebels_green,

--	description = [[Постоянный член Сопротивления, владующий техникой взлома любого замка или энергополя.]],

--	weapons = {"swb_pistol", "lockpick", "keypad_cracker"},

--	salary = 5,

--	command = "rebelvz",

--	spawns = rebel_spawns,

--	spawn_points = rebel_points,

--	faction = FACTION_REBEL,

--	rationCount = 1,

--	max = 3,

--	unlockPrice = 200,

--	unlockTime = 1*3600,

--	loyalty = 1

--})



rp.addTeam("Cержант Повстанцев", {

	color = Color(100, 117, 109),

	model =  rebels_models,

	description = [[Вы - Член Сопротивления, повышеный за свою работу. 

Командуете Рядовым Повстанцем.



Подчиняетесь Командиру Повстанцев и выше.

Обязан явиться на сбор Илая Вэнса по первому зову.



Разрешено действовать в D5, D4 в сопровождении с Полковником+]],

	weapons = isSerious && {"swb_p228",'salute'} || {"swb_pistol",'salute'},

	--unlockPrice = 50000,

	salary = 6,

	command = "rebel2",

	admin = 0,

	vote = false,

	hasLicense = false,

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	rationCount = 1,

	max = 2,

	PlayerLoadout = giveRandomMelee,

	unlockPrice = 750,

	unlockTime = 1.5*3600,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

	ply:SetBodygroup(1, 12)

	ply:SetBodygroup(2, 4)

	ply:SetBodygroup(3, 1)

	ply:SetBodygroup(4, table.Random({0,3,4}))

	end,

	loyalty = 1

})





TEAM_REBEL_MEDIC = rp.addTeam("Полевой Медик", {

	color = Color(100, 117, 109),

	model = {'models/player/tnb/citizens/female_01.mdl','models/player/tnb/citizens/female_02.mdl'},

	description = [[Вы - Сержант Сопротивления, который имеет базовую медицинскую подготовку.



Командуете Рядовым Повстанцем.

Подчиняетесь Командиру Повстанцев и выше.

Обязан явиться на сбор Илая Вэнса по первому зову.



Разрешено действовать в D5, D4, D3 в сопровождении с Полковником+]],

	weapons = isSerious && {"swb_p228", "weapon_medkit",'salute'} || {"swb_pistol", "weapon_medkit",'salute'},

	--unlockPrice = 50000,

	salary = 6,

	max = 1,

	command = "rebel3",

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	rationCount = 1,

	PlayerLoadout = giveRandomMelee,

	unlockPrice = 1750,

	unlockTime = 3.5*3600,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

	ply:SetBodygroup(1, 10)

	ply:SetBodygroup(2, 6)

	ply:SetBodygroup(3, 0)

	ply:SetBodygroup(4, table.Random({0,3,4}))

	end,

	loyalty = 1

})



TEAM_REBEL_COLONEL = rp.addTeam("Ветеран Повстанцев", {

	color = Color(100, 117, 109),

	model = rebels_models,

	description = [[Вы пережили множество сражений с Альянсом. Вы самый старый участник Сопротивления, вы знакомы с Гордоном и сражались вместе с ним.



Командуете Полевым Медиком и ниже.

Подчиняетесь Полковнику Сопротивления и выше.

Обязан явиться на сбор Илая Вэнса по первому зову.



Разрешено действовать во всех секторах в паре или группе.]],

	weapons = isSerious &&  {"swb_p228", "swb_mac10", "swb_knife",'salute'} || {"swb_pistol", "swb_smg", "swb_knife",'salute'},

	--unlockPrice = 50000,

	salary = 7,

	command = "rebel4",

	armor = 10,

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	rationCount = 1,

	unlockPrice = 3000,

	unlockTime = 6*3600,

	max = isSerious && 2 || 3,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

	ply:SetBodygroup(1, 15)

	ply:SetBodygroup(2, 4)

	ply:SetBodygroup(3, 1)

	ply:SetBodygroup(4, table.Random({0,3,4}))

	end,

	canCapture = true,

	loyalty = 1

})



if isSerious then

TEAM_REBEL_BARMEN = rp.addTeam("Бармен", {

	color = Color(100, 117, 109),

	model = {

		"models/player/monk.mdl"

	},

	description = [[Может продавать еду, наркотики и медикаменты, а также скупать наркотики.



Разрешено действовать в пределах D5 и D6]],

	weapons = isSerious && {"swb_mac10", "weapon_art_buyer"} || {"weapon_bp_annabelle", "weapon_art_buyer"},

	--unlockPrice = 50000,

	command = "barmen",

	salary = 10,

	admin = 0,

	max = 1,

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	PlayerSpawn = giveRandomMelee,

	rationCount = 1,

	unlockPrice = 7500,

	unlockTime = 15*3600,

	loyalty = 1

})

end



TEAM_REBEL_CAPTAIN = rp.addTeam("Командир Повстанцев", {

	color = Color(100, 117, 109),

	model = rebels_models,

	description = [[Вы - боец, который уже знает, что представляет из себя Сопротивление. 



Командуете Ветераном Сопротивления и ниже. 

Подчиняетесь Полевому Медику Повстанцев и выше.

Обязан явиться на сбор Илая Вэнса по первому зову.



Разрешено действовать в D5, D4, D3 в паре или группе;

Разрешено действовать в D2, D1 в сопровождении с Командиром и выше]],

	weapons = isSerious && {"swb_p228", "swb_mac10","swb_knife",'salute'} || {"swb_pistol", "swb_smg","swb_knife",'salute'},

	--unlockPrice = 50000,

	salary = 8,

	command = "rebel5",

	armor = 30,

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	rationCount = 1,

	unlockPrice = 7500,

	unlockTime = 15*3600,

	canCapture = true,

	max = 2,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

	ply:SetBodygroup(1, 13)

	ply:SetBodygroup(2, 4)

	ply:SetBodygroup(3, 1)

	ply:SetBodygroup(4, table.Random({0,3,4}))

	end,

	loyalty = 1

})



TEAM_REBEL_MEDIC = rp.addTeam("Полевой Медик Ветеран", {

	color = Color(100, 117, 109),

	model = {'models/player/tnb/citizens/female_01.mdl','models/player/tnb/citizens/female_02.mdl'},

	description = [[Вы - Ветеран Повстанцев, который не раз спасал людей от верной смерти во время перестрелок. Ваши познания в медицине превышают базовый уровень. 



Командуете Командиром Повстанцев и ниже.

Подчиняетесь Полковнику Сопротивления и выше.

Обязан явиться на сбор Илая Вэнса по первому зову.



Разрешено действовать во всех секторах в паре или группе.]],

	weapons = isSerious && {"swb_p228", "weapon_medkit", "swb_ump",'salute'} || {"swb_pistol", "weapon_medkit", "swb_smg",'salute'},

	--unlockPrice = 50000,

	salary = 8,

	command = "rebelmed",

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	rationCount = 1,

	max = 1,

	PlayerLoadout = giveRandomMelee,

	unlockPrice = 10000,

	unlockTime = 20*3600,

	SetBodygroups = function(ply)

	ply:SetBodygroup(1, 11)

	ply:SetBodygroup(2, 2)

	ply:SetBodygroup(3, 1)

	ply:SetBodygroup(4, 4)

	end,

	loyalty = 1

})



TEAM_VORTT = rp.addTeam("Вортигонт", {

	color = Color(100, 117, 109),

	model = {

		"models/player/vortigaunt_fix.mdl"

	},

description = [[Вы - вортигонт, который сражается на стороне сопротивления. Обеспечивайте союзников всем необходимым и не забывайте о субординации.



Подчиняетесь Полковнику Сопротивления и выше.

Обязан явиться на сбор Илая Вэнса по первому зову.



Разрешено действовать во всех секторах в паре или группе.

]],

	weapons = {"swep_vortigaunt_beam"},

	salary = 10,

	spawn_points = rebel_points,

	command = "vortigaunt",

	unlockPrice = 20000,

	unlockTime = 40 * 3600,

	faction = FACTION_REBEL,

	forceLimit = true,

	armor = 35,

	loyalty = 1,

	max = isSerious && 2 || 3,

	rationCount = 5,

	spawns = rebel_spawns,

})



TEAM_SEPSNAP = rp.addTeam("Снайпер Сопротивления", {

	color = Color(100, 117, 109),

	model = {"models/player/tnb/citizens/female_07.mdl"},

	description = [[Вы - Снайпер-Ветеран Сопротивления. 



Подчиняетесь Полковнику Сопротивления и выше.

Обязана явиться на сбор Илая Вэнса по первому зову.

 

Разрешено действовать во всех секторах (в том числе и в одиночку).

 ]],

	weapons = isSerious && {"swb_awp", "swb_ump", "lockpick", "keypad_cracker",'salute'} || {"swb_awp", "swb_smg", "lockpick", "keypad_cracker",'salute'},

	salary = 15,

	spawn_points = rebel_points,

	command = "sepsnap",

	max = 1,

	spawns = rebel_spawns,

	faction = FACTION_REBEL,

	rationCount = 1,

	unlockPrice = 45000,

	unlockTime = 90*3600,

	loyalty = 1,

	armor = 50,

	candisguise = true,

	canCapture = true,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

	ply:SetBodygroup(1, 14)

	ply:SetBodygroup(2, 2)

	ply:SetBodygroup(3, 1)

	ply:SetBodygroup(4, math.random(0,1))

	end,

	disguise_faction = FACTION_COMBINE,

})



if !isSerious then

TEAM_REBELCREMATOR = rp.addTeam("Поджигатель", {

	color = Color(100, 117, 109),

	model = {"models/industrial_uniforms/pm_industrial_uniform.mdl"},

	description = [[Вы - Командир Сопротивления, несущий пламя и разрушения при помощи своего огнемета.



Занимаетесь выжиганием юнитов Альянса. 

Подчиняетесь Полковнику Сопротивления и выше. 

Обязан явиться на сбор Илая Вэнса по первому зову.



Разрешено действовать в D5, D4, D3 в паре или группе

Разрешено действовать в D2, D1 в сопровождении с Командиром и выше

]],

	weapons = isSerious && {"swb_357","lockpick", "keypad_cracker", "swb_knife",'salute'} || {"swb_357", "weapon_bp_flamethrower","lockpick", "keypad_cracker", "swb_knife", "weapon_bp_cocktail",'salute'},

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	salary = 10,

	command = 'rebelcremator',

	admin = 0,

	max = 1,

	candemote = true,

	vote = false,

	hasLicense = false,

	faction = FACTION_REBEL,

	unlockTime = 240 * 3600,

	rationCount = 4,

	loyalty = 1,

	armor = 50,

	vip = true

})

end



TEAM_REBEL_VETERAN = rp.addTeam("Полковник Сопротивления", {

	color = Color(100, 117, 109),

	model = {'models/player/tnb/citizens/male_18.mdl'},

	description = [[Вы - очень важная персона в сопротивлении. Имеете право на создание отрядов.

Управляйте своим подразделением, проводите спец.операции и массовые рейды. 



Командуете Поджигателем, Снайпером Сопротивления и ниже.

Подчиняетесь Генералу Сопротивления и выше.



Ваш отряд может не являться на сбор Илая Вэнса, если вы уже учавствуете в операции.

Разрешено действовать во всех секторах в паре или группе]],

	weapons = isSerious && {"swb_p228", "swb_ump", "lockpick", "keypad_cracker", "swb_knife",'salute'} || {"swb_357", "swb_smg", "lockpick", "keypad_cracker", "swb_knife", "weapon_bp_cocktail",'salute'},

	--unlockPrice = 50000,

	salary = 9,

	command = "rebel6",

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	forceLimit = true,

	armor = 70,

	rationCount = 1,

	unlockPrice = 35000,

	unlockTime = 70*3600,

	max = isSerious && 1 || 2,

	SetBodygroups = function(ply)

	ply:SetBodygroup(1, 14)

	ply:SetBodygroup(2, 4)

	ply:SetBodygroup(3, 1)

	ply:SetBodygroup(4, 4)

	end,

	canCapture = true,

	loyalty = 1

})





TEAM_REBEL_VETERAN = rp.addTeam("Генерал Сопротивления", {

	color = Color(100, 117, 109),

	model = {'models/player/tnb/citizens/male_14.mdl'},

	description = [[Вы - Главнокомандующий Военными Силами Сопротивления.

Командуйте подразделениями повстанцев, ведя их к победе. 



Подчиняетесь Илаю Вэнсу.

Командуете Полковником Сопротивления и ниже.



Ваш отряд может не являться на сбор Илая Вэнса, если вы уже учавствуете в операции.

Разрешено действовать во всех секторах в паре или группе]],

	weapons =  isSerious && {"swb_p228", "swb_ump", "swb_m3super90", "lockpick", "keypad_cracker", "swb_knife",'salute'} || {"swb_357", "swb_smg", "swb_shotgun", "lockpick", "keypad_cracker", "swb_knife", "weapon_bp_cocktail",'salute'},

	--unlockPrice = 50000,

	salary = 10,

	command = "rebel7",

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	armor = 80,

	--customCheck = function(ply) return CLIENT or (ply:GetOrg() == "Название фракции" && (ply:GetOrgData().Rank == 'Ранг')) or ply:IsRoot() end,

	rationCount = 1,

	unlockPrice = 52500,

	unlockTime = 105*3600,

	SetBodygroups = function(ply)

	ply:SetSkin(0)

	ply:SetBodygroup(1, 16)

	ply:SetBodygroup(2, 4)

	ply:SetBodygroup(3, 1)

	ply:SetBodygroup(4, 0)

	end,

	canCapture = true,

	max = 1,

	loyalty = 1

})



TEAM_KLEINER = rp.addTeam("Доктор Кляйнер", {

	color = Color(100, 117, 109),

	model = {"models/player/kleiner.mdl"},

	description = [[Вы - Ветеран Сопротивления. 



Подчиняетесь Илаю Вэнсу.

Можете командовать всем Сопротивлением, если нет Генерала Сопротивления или Илая Вэнса.

Обязан явиться на сбор Илая Вэнса по первому зову.

	

Умеет перепрограммировать ОТА.

Для перепрограммирования ОТА необходимо подойти к нему,

и произнести код: OTA RELOAD CODE 3 7 5 4 1

Работает с любыми ОТА кроме OvL.

Может подчинить только одного юнита OTA.



Разрешено действовать в пределах D6, D5, D4

Умеет взламывать раздатчики рациона (получает 5 рационов)]],

	weapons = isSerious && {"swb_fiveseven", "swb_m3super90", "lockpick", "keypad_cracker", "swb_knife", "weapon_ota_reprogrammer",'salute'} || {"swb_357", "swb_shotgun", "lockpick", "keypad_cracker", "swb_knife", "weapon_ota_reprogrammer",'salute'},

	--unlockPrice = 50000,

	salary = 15,

	command = "kleiner",

	max = 1,

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	candisguise = true,

	disguise_faction = FACTION_CITIZEN,

	armor = 80,

	rationCount = 5,

	unlockPrice = 75000,

	unlockTime = 150*3600,

	canCapture = true,

	loyalty = 1

})



TEAM_AGP = rp.addTeam("Агент Провокатор", {

	color = Color(100, 117, 109),

	model = {"models/dpfilms/metropolice/playermodels/pm_resistance_police_fix.mdl"},

	description = [[Вы - агент сопротивления, который знает всё о работе метрокопов. Можете маскироваться под любого метрокопа и выполнять различные задания в тылу врага.



Можете командовать всем Сопротивлением, если нет Генерала Сопротивления или Илая Вэнса.

Подчиняетесь Илаю Вэнсу.



Можете не являться на сбор Илая Вэнса, если уже выполняете задание. 

Разрешено действовать во всех секторах (в том числе и в одиночку). 

Умеет взламывать раздатчики рациона (получает 5 рационов)]],

	weapons = {"swb_357", "swb_smg", "swb_shotgun", "nut_stunstick", "lockpick", "keypad_cracker", "weapon_frag",'salute'},

	--unlockPrice = 50000,

	salary = 20,

	spawn_points = rebel_points,

	command = "agp",

	max = 1,

	spawns = rebel_spawns,

	faction = FACTION_REBEL,

	rationCount = 5,

	unlockPrice = 130000,

	unlockTime = 260*3600,

	loyalty = 1,

	candisguise = true,

	disguise_faction = FACTION_COMBINE,

	canCapture = true,

	armor = 150,

})





TEAM_ALEX = rp.addTeam("Аликс Вэнс", {

	color = Color(100, 117, 109),

	model = {"models/player/alyx.mdl"},

	description = [[Вы - Аликс Вэнс. Дочь лидера повстанцев - Илая Венса.

Вы носите звание полковника Сопротивления и имеете все его преференции.

Вы специализируетесь на выполнении особо важных операции Повстанцев и играете заметную роль в движении Сопротивления против Альянса.



Подчиняетесь Илаю Вэнсу.



Можете не являться на сбор Илая Вэнса, если уже выполняете задание. 

Разрешено действовать во всех секторах (в том числе и в одиночку).

Умеет взламывать раздатчики рациона (получает 5 рационов)]],

	weapons = isSerious && {"swb_357", "swb_ar2", "swb_shotgun", "lockpick", "keypad_cracker", "swb_knife", "weapon_frag",'salute'} || {"swb_357",  "swb_smg","weapon_bp_alyxgun", "swb_shotgun", "lockpick", "keypad_cracker", "swb_knife", "weapon_frag",'salute'},

	--unlockPrice = 50000,

	salary = 15,

	command = "alyx",

	max = 1,

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	rationCount = 5,

	unlockPrice = 165000,

	unlockTime = 330*3600,

	loyalty = 1,

	armor = 180,

	candisguise = true,

	canCapture = true,

	disguise_faction = FACTION_COMBINE,

})



TEAM_BARNEY = rp.addTeam("Барни", {

	color = Color(100, 117, 109),

	model = {"models/dpfilms/metropolice/playermodels/pm_hd_barney_fix.mdl"},

	description = [[Вы - Барни Калхаун.

Вы носите звание генерала Сопротивления и имеете все его преференции.

Вы один из основаталей повстанческого движения, ставший одним из его символов.



Подчиняетесь Илаю Вэнсу.



Можете не являться на сбор Илая Вэнса, если уже выполняете задание.

Разрешено действовать во всех секторах (в том числе и в одиночку)

Умеет взламывать раздатчики рациона (получает 5 рационов)]],

	weapons = {"swb_357", "swb_shotgun","nut_stunstick", "swb_ar2", "lockpick", "keypad_cracker", "swb_knife", "weapon_frag",'salute'},

	--unlockPrice = 50000,

	salary = 20,

	command = "barney",

	max = 1,

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	--customCheck = function(ply) return CLIENT or (ply:GetOrg() == "Название фракции" && (ply:GetOrgData().Rank == 'Ранг')) or ply:IsRoot() end,

	rationCount = 5,

	unlockPrice = 185000,

	unlockTime = 370*3600,

	loyalty = 1,

	candisguise = true,

	disguise_faction = FACTION_COMBINE,

	canCapture = true,

	armor = 220,

})



TEAM_ELI = rp.addTeam("Илай Вэнс", {

	color = Color(100, 117, 109),

	model = {"models/player/eli.mdl"},

	description = [[Вы ученый - физик, основавший Повстанческое движаени и являющися ее ключевым лидером.



Командуете всеми повстанцами, кроме Гордона.

По вашему объявлению Общего Сбора - каждый повстанец Обязаны явиться на базу и отметиться перед вами.

Можете продавать медикаменты, стимуляторы и броню. 



Разрешено действовать в пределах D6, D5, D4

Умеет взламывать раздатчики рациона (получает 5 рационов)]],

	weapons = isSerious && {"swb_357", "swb_ump", "swb_m3super90", "lockpick", "keypad_cracker", "swb_knife",'salute'} || {"swb_357",  "swb_smg", "swb_shotgun", "lockpick", "keypad_cracker", "swb_knife", "weapon_bp_cocktail",'salute'},

	--unlockPrice = 50000,

	salary = 10,

	command = "eli",

	max = 1,

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	armor = 140,

	--customCheck = function(ply) return CLIENT or (ply:GetOrg() == "Название фракции" && (ply:GetOrgData().Rank == 'Ранг')) or ply:IsRoot() end,

	rationCount = 5,

	unlockPrice = 110000,

	unlockTime = 220*3600,

	canCapture = true,

	loyalty = 1 

})



if !isSerious then

TEAM_GORDON_FREEMAN = rp.addTeam("Гордон Фриман", {

	color = Color(100, 117, 109),

	model = {"models/lenoax_gordon_fix.mdl"},

	description = [[Вы - Надежда Сопротивления.



Не командуете и не подчиняетесь никому.

Вы можете не являться на сбор Илая Вэнса.



Разрешено действовать во всех секторах (в том числе и в одиночку).

Умеет взламывать раздатчики рациона (получает 5 рационов)]],

	weapons = {"weapon_crowbar", "swb_357", "swb_ar2", "swb_shotgun", "lockpick", "keypad_cracker", "weapon_frag", "weapon_frag",'salute'},

	--unlockPrice = 50000,

	salary = 25,

	command = "freeman",

	max = 1,

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	faction = FACTION_REBEL,

	rationCount = 5,

	unlockPrice = 250000,

	unlockTime = 500*3600,

	loyalty = 1,

	candisguise = true,

	disguise_faction = FACTION_COMBINE,

	canCapture = true,

	armor = 270,

})

end



if !isSerious then

TEAM_KAEF = rp.addTeam("КАЕФ-3", {

	color = Color(255, 0, 0),

	model = "models/player/combine_super_soldier.mdl",

	description = [[Костюм Элитного Солдата Альянса Адаптированный модификация номер 3 (Финальная)



Имеет ключи доступа к цифровой сети Альянса, таким образом может деактивировать силовые поля и имеет полный доступ к Нексусу



Единственный взятый в плен Элитный Солдат Альянса подарил повстанцем не только свой костюм, но и свои ключи доступа

Потребовалось множество труда и упорства команды доктора Кляйнера, чтобы костюм мог быть использован человеком



Разрешено действовать во всех секторах (в том числе и в одиночку)



Умеет взламывать раздатчики рациона (получает 5 рационов)

]],

	weapons = {"weapon_crowbar", "swb_357", "swb_ar2", "weapon_crossbow", "lockpick", "keypad_cracker", "weapon_frag",'salute'},

	command = "kaef",

	spawns = rebel_spawns,

	spawn_points = rebel_points,

	salary = 20,

	max = 1,

	armor = 350,

	faction = FACTION_REBEL,

	rationCount = 5,

	unlockTime = 800 * 3600,

	unlockPrice = 600000,

	loyalty = 4,

	canCapture = true,

})

end



if !isSerious then

TEAM_HEIST = rp.addTeam("HEIST.PRIME", {

	color = Color(100, 117, 109),

	model = "models/killzone 3/capture/capture trooper_playermodel.mdl",

	description = [[

123]],

	weapons = {"weapon_radio", "swb_pistol", "weapon_bp_rtboicw", "weapon_bp_hopwire", "weapon_frag", "door_ram", "weapon_taser", "sh_blinkswep", "swb_xm1014"},

	command = "heist",

	spawns = rebel_spawns,

	spawn_points = empty,

	salary = 37,

	max = 4,

	unlockTime = 300 * 3600,

	PlayerSpawn = function(ply) ply:GiveArmor(450) ply:SetHealth(150) end,

	customCheck = function(ply) return ply:GetOrg() == "OTA.PRIME" or ply:IsRoot() end,

	faction = FACTION_REBEL,

	max = 2,

	rationCount = 4,

	loyalty = 1

})

end



//OVSZ



local hecu_army_spawns = {
	rp_city17_utfim = rp.GetSpawnPoint(SPAWN_BUNKER),
}

local hecu_models_medic = {
	"models/player/humans/hecurebels/group03m/male_08.mdl",
	"models/player/humans/hecurebels/group03m/male_03.mdl",
	"models/player/humans/hecurebels/group03m/male_04.mdl",
	"models/player/humans/hecurebels/group03m/male_05.mdl",
	"models/player/humans/hecurebels/group03m/male_07.mdl",
	"models/player/humans/hecurebels/group03m/male_09.mdl",
	"models/player/humans/hecurebels/group03m/male_01.mdl",
	"models/player/humans/hecurebels/group03m/male_02.mdl",
}
local hecu_models_unit = {
	"models/player/humans/hecurebels/group03/male_03.mdl",
	"models/player/humans/hecurebels/group03/male_07.mdl",
	"models/player/humans/hecurebels/group03/male_04.mdl",
	"models/player/humans/hecurebels/group03/male_05.mdl",
	"models/player/humans/hecurebels/group03/male_08.mdl",
	"models/player/humans/hecurebels/group03/male_09.mdl",
}
local hecu_models_machinegun = {
	"models/player/humans/hecurebels/group03/male_01.mdl",
	"models/player/humans/hecurebels/group03/male_02.mdl",
}

TEAM_RSOLD = rp.addTeam("Рекрут ОВСП", {

	color = Color(2, 105, 48),

	model = hecu_models_unit,

	description = [[

Рекрут бывших объединенных военный сил планеты.



Разрешено действовать во всех секторах в группе от 3 человек.

]],

	weapons = {"swb_p228", "lockpick", "keypad_cracker"},

	salary = 20,

	spawn_points = rebel_points,

	command = "hecur",

	spawns = hecu_army_spawns,

	faction = FACTION_HECU,

	rationCount = 1,

	unlockTime = 4*3600,

	loyalty = 1,

	max = isSerious && 2 || 4,

	vip = true,

	armor = 30,

})



TEAM_SSOLD = rp.addTeam("Оперативник ОВСП", {

	color = Color(2, 105, 48),

	model = hecu_models_unit,

	description = [[

Оперативник бывших объединенных военный сил планеты.



Разрешено действовать во всех секторах в группе от 3 человек.

]],

	weapons = {"swb_p228", "swb_mp5", "lockpick", "keypad_cracker", "weapon_frag","swb_shotgun",'salute'},

	salary = 15,

	spawn_points = rebel_points,

	command = "hecuo",

	spawns = hecu_army_spawns,

	faction = FACTION_HECU,

	rationCount = 1,

	max = isSerious && 2 || 3,

	unlockTime = 15*3600,

	loyalty = 1,

	armor = 60,

	vip = true

})



TEAM_MSOLD = rp.addTeam("Медик ОВСП", {

	color = Color(2, 105, 48),

	model = hecu_models_medic,

	description = [[

Медик бывших объединенных военный сил планеты.



Разрешено действовать во всех секторах в группе от 3 человек.

]],

	weapons = {"swb_p228", "swb_mp5", "lockpick", "keypad_cracker", "weapon_frag", "weapon_medkit_fast",'salute'},

	salary = 15,

	spawn_points = rebel_points,

	command = "hecum",

	spawns = hecu_army_spawns,

	faction = FACTION_HECU,

	rationCount = 1,

	unlockTime = 80*3600,

	max = 1,

	loyalty = 1,

	armor = 100,

	vip = true

})



TEAM_HSOLD = rp.addTeam("Тяжелый штурмовик ОВСП", {

	color = Color(2, 105, 48),

	model = hecu_models_machinegun,

	description = [[

Тяжелый штурмовик бывших объединенных военный сил планеты.



Разрешено действовать во всех секторах в группе от 3 человек.

]],

	weapons = {"swb_p228", "swb_mp5", "lockpick", "keypad_cracker", "weapon_frag","swb_shotgun","swb_m249",'salute'},

	salary = 15,

	spawn_points = rebel_points,

	command = "hecuh",

	max = isSerious && 1 || 2,

	spawns = hecu_army_spawns,

	faction = FACTION_HECU,

	rationCount = 1,

	unlockTime = 80*3600,

	loyalty = 1,

	armor = 150,

	vip = true

})



TEAM_RSOLD = rp.addTeam("Разведчик ОВСП", {

	color = Color(2, 105, 48),

	model = hecu_models_unit,

	description = [[

Разведчик штурмовик бывших объединенных военный сил планеты.



Разрешено действовать во всех секторах в одиночку/группе.

]],

	weapons = {"swb_deagle", "swb_tmp", "lockpick", "keypad_cracker", "weapon_frag","swb_awp",'salute'},

	salary = 28,

	spawn_points = rebel_points,

	command = "hecusr",

	max = isSerious && 1 || 2,

	spawns = hecu_army_spawns,

	faction = FACTION_HECU,

	rationCount = 1,

	unlockTime = 130*3600,

	loyalty = 1,

	candisguise = true,

	disguise_faction = FACTION_COMBINE,

	armor = 120,

	vip = true

})





TEAM_СSOLD = rp.addTeam("Капитан ОВСП", {

	color = Color(2, 105, 48),

	model = {"models/player/humans/hecurebels/group03/male_06.mdl"},

	description = [[

Капитан бывших объединенных военный сил планеты.



Разрешено действовать во всех секторах в группе от 2 человек (Оперативник+)

]],

	weapons = {"swb_deagle", "swb_mp5", "lockpick", "keypad_cracker", "weapon_frag","swb_shotgun",'salute'},

	salary = 30,

	spawn_points = rebel_points,

	command = "hecuс",

	max = 1,

	spawns = hecu_army_spawns,

	faction = FACTION_HECU,

	rationCount = 1,

	unlockTime = 150*3600,

	loyalty = 1,

	armor = 150,

	vip = true,

	canCapture = true,

})



rp.SetFactionVoices({FACTION_REBEL, FACTION_HECU}, {

	{

		label = 'Подожди-ка',

		sound = 'vo/trainyard/man_waitaminute.wav', 

		text = 'Подожди-ка.' 

	},

	{

		label = 'Я',

		sound = 'vo/trainyard/man_me.wav', 

		text = 'Я?' 

	},

	{

		label = 'Он - один из нас',

		sound = 'vo/trainyard/cit_window_stand.wav', 

		text = 'Он - один из нас.' 

	},

	{

		label = 'Пс',

		sound = 'vo/trainyard/cit_hall_psst.wav', 

		text = 'Пс! Эй ты.. Сюда!' 

	},

	{

		label = 'Забирайся сюда',

		sound = 'vo/trainyard/cit_blocker_getin.wav', 

		text = 'Забирайся сюда!' 

	},

	{

		label = 'Я задержу их',

		sound = 'vo/trainyard/cit_blocker_holdem.wav', 

		text = 'Иди, я задержу их!' 

	},

	{

		label = 'Эй, убери это',

		sound = 'vo/trainyard/female01/cit_hit01.wav', 

		text = 'Эй, убери это!!' 

	},

	{

		label = 'Они идут',

		sound = 'vo/trainyard/female01/cit_window_use02.wav', 

		text = 'Они идут сюда!' 

	},

	{

		label = 'Спасайся',

		sound = 'vo/npc/female01/runforyourlife02.wav', 

		text = 'Спасайся кто может!' 

	},

	{

		label = 'На помощь',

		sound = 'vo/npc/male01/help01.wav', 

		text = 'На помощь!' 

	},

	{

		label = 'Уходи',

		sound = 'vo/canals/boxcar_go_nag03.wav', 

		text = 'Уходи отсюда!' 

	},

	{

		label = 'Фух, я думал - ты один из ГО',

		sound = 'vo/trainyard/cit_window_cop.wav', 

		text = 'Фух, я думал - ты один из ГО.' 

	},

})



rp.SetTeamVoices(TEAM_VORTT, {  

	{

		label = 'Визит Фримена',

		sound = 'vo/coast/bugbait/vbaittrain01a.wav', 

		text = 'Фримен почтил нас визитом.' 

	},

	{

		label = 'Мы за тобой',

		sound = 'vo/npc/vortigaunt/honorfollow.wav', 

		text = 'Мы идем за тобой.' 

	},

	{

		label = 'Честь',

		sound = 'vo/npc/vortigaunt/honorours.wav', 

		text = 'Нам выпала честь.' 

	},

	{

		label = 'Клянусь',

		sound = 'vo/npc/vortigaunt/ourhonor.wav', 

		text = 'Клянусь честью.' 

	},

	{

		label = 'Проходи',

		sound = 'vo/npc/vortigaunt/passon.wav',

		text = 'Проходи!'  

	},

	{

		label = 'Мы победим',

		sound = 'vo/npc/vortigaunt/prevail.wav', 

		text = 'Мы победим.' 

	},

	{

		label = '*Вортигонтский*',

		sound = 'vo/npc/vortigaunt/vortigese12.wav', 

		text = '*Вотигонтский*'

	},

	{

		label = 'Мы поможем',

		sound = 'vo/npc/vortigaunt/wewillhelp.wav', 

		text = 'Мы поможем тебе.' 

	},

	{

		label = 'Успокойся',

		sound = 'vo/npc/vortigaunt/calm.wav', 

		text = 'Успокойся.' 

	},

	{

		label = 'Мы не можем стрелять',

		sound = 'vo/npc/vortigaunt/cannotfire.wav', 

		text = 'Мы не можем стрелять без вреда тебе.' 

	},

	{

		label = 'Мечта',

		sound = 'vo/npc/vortigaunt/dreamed.wav', 

		text = 'Мы мечтали об этой минуте.' 

	},

	{

		label = 'Честь',

		sound = 'vo/npc/vortigaunt/fmhonorsus.wav', 

		text = 'Ты оказал нам честь.' 

	},

	{

		label = 'За свободу',

		sound = 'vo/npc/vortigaunt/forfreedom.wav', 

		text = 'За свободу!' 

	},

	{

		label = 'Мы служим',

		sound = 'vo/npc/vortigaunt/mystery.wav', 

		text = 'Мы служим одной тайне.',

	},

})	



rp.SetTeamVoices(TEAM_ALEX, {

    {

		label = 'Сюда',

		sound = 'vo/trainyard/al_overhere.wav', 

		text = 'Сюда!' 

	},

	

	{

		label = 'Приветсвие',

		sound = 'vo/trainyard/al_nicetomeet_b.wav', 

		text = 'Приятно наконец встретить тебя!' 

	},

	{

		label = 'Не-ет',

		sound = 'vo/Streetwar/Alyx_gate/al_no.wav', 

		text = 'Не-ет!' 

	},

	{

		label = 'Идём',

		sound = 'vo/Streetwar/Alyx_gate/al_letsgo01.wav', 

		text = 'Идём!' 

	},

	{

		label = 'Не делай этого',

		sound = 'vo/trainyard/al_noyoudont.wav', 

		text = 'Нет, ты не должен этого делать.' 

	},

	{

		label = 'Поторопись',

		sound = 'vo/trainyard/al_suspicious.wav', 

		text = 'Нам стоит поторопиться.' 

	},

	{

		label = 'Проходи сюда',

		sound = 'vo/trainyard/al_thruhere.wav', 

		text = 'Проходи сюда.' 

	},

	{

		label = 'Давай,давай',

		sound = 'vo/Streetwar/Alyx_gate/al_cmoncmon.wav', 

		text = 'Давай,давай!' 

	},

	{

		label = 'Привет',

		sound = 'vo/Streetwar/Alyx_gate/al_hey.wav', 

		text = 'Привет' 

	},

	{

		label = 'Путь',

		sound = 'vo/Streetwar/Alyx_gate/al_scout.wav', 

		text = 'Дай-ка посмотрю, вдруг я найду новый путь.' 

	},

	{

		label = 'Двигаемся',

		sound = 'vo/Streetwar/Alyx_gate/al_thatway.wav', 

		text = 'Двигаемся этим путём!' 

	},

	{

		label = 'Они засекли нас',

		sound = 'vo/Streetwar/Alyx_gate/al_theysawus.wav', 

		text = 'Они засекли нас!' 

	},

	{

		label = 'Жди меня здесь',

		sound = 'vo/Streetwar/Alyx_gate/al_waitforme.wav', 

		text = 'Жди меня здесь!' 

	},

	{

		label = 'А вот и оно',

		sound = 'vo/Streetwar/Alyx_gate/al_thatsit_r.wav', 

		text = 'А вот и оно!' 

	},

	{

		label = 'Прикрой меня',

		sound = 'vo/Streetwar/Alyx_gate/al_watchmyback.wav', 

		text = 'Прикрой меня.' 

	},

 })



 rp.SetTeamVoices(TEAM_BARNEY, {

    {

		label = 'Граната',

		sound = 'vo/npc/Barney/ba_grenade01.wav', 

		text = 'Граната!' 

	},

    {

		label = 'Давай',

		sound = 'vo/npc/Barney/ba_bringiton.wav', 

		text = 'Давай!' 

	},

    {

		label = 'Прочь',

		sound = 'vo/npc/Barney/ba_getoutofway.wav', 

		text = 'Прочь с дороги!' 

	},

    {

		label = 'Чёрт',

		sound = 'vo/npc/Barney/ba_damnit.wav', 

		text = 'Чёрт!' 

	},

	{

		label = 'Да',

		sound = 'vo/npc/Barney/ba_laugh03.wav', 

		text = 'Да!' 

	},

	{

		label = '*Смех*',

		sound = {'vo/npc/Barney/ba_laugh04.wav', 'vo/npc/Barney/ba_laugh03.wav', 'vo/npc/Barney/ba_laugh02.wav', 'vo/npc/Barney/ba_laugh01.wav'}, 

		text = '*Смех*' 

	},

	{

		label = 'Они снаружи, шевелись',

		sound = 'vo/trainyard/ba_exitnag02.wav', 

		text = 'Они снаружи, шевелись!'  

	},

	{

		label = 'Удачи',

		sound = 'vo/trainyard/ba_goodluck01.wav', 

		text = 'Удачи тебе там, приятель.' 

	},

	{

		label = 'Пиво',

		sound = 'vo/trainyard/ba_thatbeer02.wav', 

		text = 'По поводу того пива, что я тебе должен!' 

	},

	{

		label = 'Я работаю под прикрытием в ГО.',

		sound = 'vo/trainyard/ba_undercover.wav', 

		text = 'Я работаю под прикрытием в ГО. Я не могу задерживаться иначе, они что-нибудь заподозрят. Я и так сильно отстаю от нормы избиений.', 

		soundDuration = 15

	},

	{

		label = 'Убирайся',

		sound = 'vo/npc/Barney/ba_getaway.wav', 

		text = 'Убирайся оттуда!' 

	},

	{

		label = 'Давай сделаем это!',

		sound = 'vo/npc/Barney/ba_letsdoit.wav', 

		text = 'Давай сделаем это!' 

	},

	{

		label = 'Я с тобой',

		sound = 'vo/npc/Barney/ba_imwithyou.wav', 

		text = 'Я с тобой, братан!' 

	},

	{

		label = 'Мне не нравится',

		sound = 'vo/npc/Barney/ba_getoutofway.wav', 

		text = 'Мне не нравится, как оно выглядит.' 

	},

	{

		label = 'Поторапливайся',

		sound = 'vo/npc/Barney/ba_getoutofway.wav', 

		text = 'Поторапливайся!' 

	},

 })



 rp.SetTeamVoices(TEAM_KLEINER, {

	{

		label = '*Крик*',

		sound = 'vo/k_lab/kl_ahhhh.wav', 

		text = '*Крик*'

	},

	{

		label = 'Боже мой',

		sound = 'vo/k_lab/kl_dearme.wav', 

		text = 'Боже мой.' 

	},

	{

		label = 'Прекрасно',

		sound = 'vo/k_lab/kl_excellent.wav', 

		text = 'Прекрасно.'

	},

	{

		label = 'О, Боже',

		sound = 'vo/k_lab/kl_ohdear.wav', 

		text = 'О, Боже.'

	},

	{

		label = 'Что это',

		sound = 'vo/k_lab/kl_whatisit.wav', 

		text = 'Что это?'

	},

	{

		label = 'Готов',

		sound = 'vo/novaprospekt/kl_ready.wav', 

		text = 'Готов, готов и ещё раз готов.'

	},

	{

		label = 'неприятно',

		sound = 'vo/k_lab2/kl_atthecitadel01.wav', 

		text = 'Это очень неприятно.'

	},

	{

		label = 'О, БОЖЕ',

		sound = 'vo/k_lab2/kl_greatscott.wav', 

		text = 'О, БОЖЕ!'

	},

	{

		label = 'Минутку',

		sound = 'vo/k_lab2/kl_cantleavelamarr.wav', 

		text = 'Минутку'

	},

	{

		label = 'Видишь',

		sound = 'vo/k_lab2/kl_notallhopeless.wav', 

		text = 'Видишь?'

	},

	{

		label = 'Очаровательно',

		sound = 'vo/k_lab2/kl_slowteleport01.wav', 

		text = 'Очаровательно!'

	},

	{

		label = 'Счастливого пути',

		sound = 'vo/k_lab/kl_bonvoyage.wav', 

		text = 'Счастливого пути и удачи в твоих стараньях.'

	},

	{

		label = 'Сделка',

		sound = 'vo/k_lab2/kl_blowyoustruck01.wav', 

		text = 'Отличная сделка, дорогуша.'

	},

 })



 rp.SetTeamVoices(TEAM_ELI, {

	{

		label = 'Посмотри',

		sound = 'vo/k_lab/eli_seeforyourself.wav', 

		text = 'Посмотри на себя'

	},

	{

		label = 'Э-э-э-э',

		sound = 'vo/eli_lab/eli_handle_b.wav', 

		text = 'Э-э-э-э'

	},

	{

		label = 'О Боже',

		sound = 'vo/citadel/eli_goodgod.wav', 

		text = 'О, Боже...' 

	},

	{

		label = 'Никогда',

		sound = 'vo/citadel/eli_nonever.wav', 

		text = 'Никогда!'

	},

	{

		label = 'Нет',

		sound = 'vo/citadel/eli_notobreen.wav', 

		text = 'Нет!'

	},

	{

		label = 'Я знаю',

		sound = 'vo/novaprospekt/eli_iknow.wav', 

		text = 'Я знаю, что ты это сделаешь.'

	},

	{

		label = 'Никогда бы не подумал',

		sound = 'vo/eli_lab/eli_surface_b.wav', 

		text = 'Никогда бы не подумал, что нужно так долго, чтобы вернуться ко мне.'

	},

	{

		label = 'Не думайте обо мне',

		sound = 'vo/novaprospekt/eli_nevermindme01.wav', 

		text = 'Не думайте обо мне, спасайтесь!'

	},

	{

		label = 'Увидимся там',

		sound = 'vo/novaprospekt/eli_notime01.wav', 

		text = 'Увидимся там, детка.'

	},

 })

if isSerious then

 rp.SetTeamVoices(TEAM_REBEL_BARMEN, {

	{

		label = 'А, это ты',

		sound = 'vo/ravenholm/attic_apologize.wav', 

		text = 'А, это ты, брат! Я извиняюсь! Но, ты не пострадал; Мои пули - наименьшая из твоих проблем.',

		soundDuration = 10

	},

	{

		label = 'Почти дошли',

		sound = 'vo/ravenholm/bucket_almost.wav', 

		text = 'Почти дошли, брат!'

	},

	{

		label = 'Береги себя',

		sound = 'vo/ravenholm/bucket_guardwell.wav', 

		text = 'Береги себя, брат!' 

	},

	{

		label = 'А вот и ты',

		sound = 'vo/ravenholm/bucket_thereyouare.wav', 

		text = 'А вот и ты! Наконец!'

	},

	{

		label = '*Смех*',

		sound = {'vo/ravenholm/madlaugh04.wav', 'vo/ravenholm/madlaugh03.wav', 'vo/ravenholm/madlaugh02.wav', 'vo/ravenholm/madlaugh01.wav'},

		text = '*Смех*'

	},

	{

		label = 'Будь рядом',

		sound = 'vo/ravenholm/grave_stayclose.wav', 

		text = 'Будь рядом со мной, брат!'

	},

	{

		label = 'Прочь',

		sound = 'vo/ravenholm/monk_blocked01.wav', 

		text = 'Прочь с дороги!'

	},

	{

		label = 'Осторожно',

		sound = 'vo/ravenholm/monk_blocked02.wav', 

		text = 'Осторожно!'

	},

	{

		label = 'Прикрой меня',

		sound = 'vo/ravenholm/monk_coverme01.wav', 

		text = 'Прикрой меня, брат!'

	},

	{

		label = 'Ко мне, брат',

		sound = 'vo/ravenholm/monk_coverme04.wav', 

		text = 'Ко мне, брат!'

	},

	{

		label = 'Осторожнее',

		sound = 'vo/ravenholm/monk_danger03.wav', 

		text = 'Осторожнее, брат!'

	},

	{

		label = 'За мной',

		sound = 'vo/ravenholm/monk_followme.wav', 

		text = 'За мной!'

	},

	{

		label = 'Помоги',

		sound = 'vo/ravenholm/monk_helpme02.wav', 

		text = 'Помоги, брат!'

	},

	{

		label = 'Да пребудет с тобой Светлейший Свет!',

		sound = 'vo/ravenholm/monk_kill05.wav', 

		text = 'Да пребудет с тобой Светлейший Свет!'

	},

	{

		label = 'Да, иди ко мне',

		sound = 'vo/ravenholm/engage01.wav', 

		text = 'Да, иди ко мне, иди!'

	},

	{

		label = 'Всё лучше и лучше',

		sound = 'vo/ravenholm/cartrap_better.wav', 

		text = 'Всё лучше и лучше!'

	},

	{

		label = 'Иди быстрее',

		sound = 'vo/ravenholm/exit_goquickly.wav', 

		text = 'Иди быстрее!'

	},

	{

		label = 'Отлично сработано',

		sound = 'vo/ravenholm/firetrap_welldone.wav', 

		text = 'Отлично сработано, брат!'

	},

	{

		label = 'Быстрее, брат!',

		sound = 'vo/ravenholm/monk_quicklybro.wav', 

		text = 'Быстрее'

	},

	{

		label = 'Они идут',

		sound = 'vo/ravenholm/shotgun_theycome.wav', 

		text = 'Они идут.'

	},

	{

		label = 'Приветствую, брат',

		sound = 'vo/ravenholm/yard_greetings.wav', 

		text = 'Приветствую, брат. Наконец-то мы встретились.'

	},

 })

end



--HECu

rp.AddRelationships(TEAM_СSOLD, RANK_LEADER, {FACTION_HECU})

--Rebels

rp.AddRelationships(TEAM_KAEF, RANK_TRAINER, {FACTION_REBEL})

rp.AddRelationships(TEAM_GORDON_FREEMAN, RANK_LEADER, {FACTION_REBEL})

rp.AddRelationships(TEAM_BARNEY, RANK_OFFICER, {FACTION_REBEL})

rp.AddRelationships(TEAM_ALEX, RANK_OFFICER, {FACTION_REBEL})

rp.AddRelationships(TEAM_KLEINER, RANK_OFFICER, {FACTION_REBEL})

rp.AddRelationships(TEAM_ELI, RANK_LEADER, {FACTION_REBEL})

rp.AddRelationships(TEAM_REBEL_VETERAN, RANK_OFFICER, {FACTION_REBEL})







rp.AddDoorGroup('Сопротивление', rp.GetFactionTeams(FACTION_REBEL, FACTION_HECU))

rp.AddDoorGroup('ОВСП', rp.GetFactionTeams(FACTION_HECU))

rp.AddAgenda('Повестка дня', TEAM_ELI, rp.GetFactionTeams({FACTION_REBEL, FACTION_HECU}))

rp.AddAgenda('Повестка дня', TEAM_CWU_LEADER, rp.GetFactionTeams(FACTION_REBEL))

rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_REBEL, FACTION_HECU, FACTION_HECU})))