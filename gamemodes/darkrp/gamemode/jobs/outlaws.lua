
-----------------------------------------------------
local outlaws_spawns = {
    rp_city17_utfim = {Vector(364.929352,-1615.417236,104.443916),Vector(335.879730,-1508.044800,96.756744)},
}

local outlaws_melee_sweps = {'weapon_hl2brokenbottle', 'weapon_hl2pipe', 'weapon_hl2shovel'}

local function giveRandomMeleeOutlaws(ply) ply:Give(table.Random(outlaws_melee_sweps)) end



rp.addTeam("Гражданин Карманник", {

	color = Color(150, 170, 200),

	model = {

'models/player/tnb/citizens/male_02.mdl',

'models/player/tnb/citizens/male_03.mdl',

'models/player/tnb/citizens/male_04.mdl',

'models/player/tnb/citizens/male_05.mdl',

'models/player/tnb/citizens/male_06.mdl',

'models/player/tnb/citizens/male_07.mdl',

'models/player/tnb/citizens/male_08.mdl',

'models/player/tnb/citizens/male_09.mdl',

},

	description = [[Вы обычный гражданский, способный обчистить карманы любого, кто хоть немного зазевался.]],

	weapons = {'pickpocket'},

	salary = 5,

	command = "theif",

	spawns = outlaws_spawns,

	faction = FACTION_OUTLAWS,

	rationCount = 1,

	max = 3,

	unlockPrice = 200,

	unlockTime = 1*3600,

	PlayerLoadout = giveRandomMeleeOutlaws,

	speed = 0.8,

	canWear = true,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

    ply:SetBodygroup(1, 0)

	ply:SetBodygroup(2, 0)

	ply:SetBodygroup(3, 0)

	ply:SetBodygroup(4, 0)

	end,

	loyalty = 1

})



TEAM_MARAD = rp.addTeam("Гражданин Вор", {

    color = Color(150, 170, 200),

	model = {

'models/player/tnb/citizens/male_02.mdl',

'models/player/tnb/citizens/male_03.mdl',

'models/player/tnb/citizens/male_04.mdl',

'models/player/tnb/citizens/male_05.mdl',

'models/player/tnb/citizens/male_06.mdl',

'models/player/tnb/citizens/male_07.mdl',

'models/player/tnb/citizens/male_08.mdl',

'models/player/tnb/citizens/male_09.mdl',

},

	description = [[Бывший инженер ГСР, вставивший на скользкий путь.

Выживает за счет своего таланта вскрывать абсолютно любой замок.

	]],

	weapons = {"lockpick", "keypad_cracker"},

	salary = 8,

	max = 3,

	command = "outl1",

	spawns = outlaws_spawns,

	faction = FACTION_OUTLAWS,

	PlayerSpawn = giveRandomMeleeOutlaws,

	rationCount = 1,

	unlockPrice = 1500,

	unlockTime = 5*3600,

	speed = 0.8,

	canWear = true,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

    ply:SetBodygroup(1, 0)

	ply:SetBodygroup(2, 0)

	ply:SetBodygroup(3, 0)

	ply:SetBodygroup(4, 0)

	end,

	loyalty = 1

})



TEAM_DEZ = rp.addTeam("Гражданин Налетчик", {

    color = Color(150, 170, 200),

	model = {

'models/player/tnb/citizens/male_02.mdl',

'models/player/tnb/citizens/male_03.mdl',

'models/player/tnb/citizens/male_04.mdl',

'models/player/tnb/citizens/male_05.mdl',

'models/player/tnb/citizens/male_06.mdl',

'models/player/tnb/citizens/male_07.mdl',

'models/player/tnb/citizens/male_08.mdl',

'models/player/tnb/citizens/male_09.mdl',

},

	description = [[Житель города, владеющий боевыми навыками, полученными на улице.

Пытается выжить при помощи грабежа и убийств. 

]],

	weapons = {"lockpick", "keypad_cracker"},

	salary = 15,

	max = 3,

	command = "outl2",

	spawns = outlaws_spawns,

	PlayerLoadout = giveRandomMeleeOutlaws,

	PlayerSpawn = function(ply) ply:GiveArmor(30) end,

	faction = FACTION_OUTLAWS,

	rationCount = 1,

	unlockPrice = 10500,

	unlockTime = 20*3600,

	speed = 0.8,

	canCapture = true,

	canWear = true,

	loyalty = 1,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

	ply:SetBodygroup(1, 0)

	ply:SetBodygroup(2, 0)

	ply:SetBodygroup(3, 0)

	ply:SetBodygroup(4, 0)

	end,

})





rp.AddDoorGroup('Изгои', rp.GetFactionTeams(FACTION_OUTLAWS))

rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_OUTLAWS})))



