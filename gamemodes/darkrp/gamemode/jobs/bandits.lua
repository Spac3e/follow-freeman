
-----------------------------------------------------
local outlaws_spawns = {
	rp_city17_urfim = rp.GetSpawnPoint(SPAWN_RESTAURANT)
}

local outlaws_melee_sweps = {'weapon_hl2brokenbottle', 'weapon_hl2pipe', 'weapon_hl2shovel'}

local function giveRandomMeleeOutlaws(ply) ply:Give(table.Random(outlaws_melee_sweps)) end



if !isSerious then

TEAM_REBEL_BARMEN = rp.addTeam("Бармен", {

	color = Color(3, 175, 170),

	model = {

		"models/player/monk.mdl"

	},

	description = [[Может продавать еду, наркотики и медикаменты, а также скупать наркотики.



Разрешено действовать в пределах D5 и D6]],

	weapons = {"weapon_bp_annabelle", "weapon_art_buyer"},

	--unlockPrice = 50000,

	command = "barmen",

	salary = 10,

	admin = 0,

	max = 1,

	spawns = outlaws_spawns,

	faction = FACTION_BANDITS,

	PlayerSpawn = giveRandomMeleeOutlaws,

	rationCount = 1,

	unlockPrice = 7500,

	unlockTime = 15*3600,

	loyalty = 1

})

end 



if !isSerious then

TEAM_DEZ = rp.addTeam("Дезертир", {

    color = Color(3, 175, 170),

	model = "models/player/tnb/citizens/male_12.mdl",

	description = [[Бывший юнит гражданской обороны, сбежавший в закрытый район.

Пытается выжить при помощи грабежа и убийств. 

Имеет различные комплекты формы ГО, с помощью которых может маскироваться и выходить в город в личных целях.



Разрешено дейстовать во всех секторах, только под маскировкой.

]],

	weapons = {"swb_357", "swb_knife", "swb_shotgun", "keypad_cracker", "swb_knife"},

	salary = 15,

	max = 2,

	command = "dezer",

	spawns = outlaws_spawns,

	armor = 50,

	faction = FACTION_BANDITS,

	rationCount = 1,

	unlockPrice = 100000,

	unlockTime = 300*3600,

	canCapture = true,

	candisguise = true,

	disguise_faction = FACTION_COMBINE,

	loyalty = 2,

	SetBodygroups = function(ply)

	ply:SetSkin(0)

	ply:SetBodygroup(1, 6)

	ply:SetBodygroup(2, 4)

	ply:SetBodygroup(3, math.random(0,1))

	ply:SetBodygroup(4, table.Random({0,1,3}))

	end,

	hitman = true,

})

end



if !isSerious then

TEAM_VALK = rp.addTeam("Валькирия", {

    color = Color(3, 175, 170),

	model = "models/player/tnb/citizens/female_07.mdl",

	description = [[Хорошо обученная и подготовленная к любым непредвиденным ситуациям наемница, жаждущая убивать.

Принимается за любое дело, связанное с устранинием цели. 

Имеет повышенную скорость бега.

Разрешено дейстовать во всех секторах, только под маскировкой.]],

	weapons = {"weapon_pistol","swb_ar2", "lockpick", "keypad_cracker", "swb_knife", "weapon_bp_sniper","climb_swep"},

	salary = 20,

	command = "outl3",

	max = 1,

	spawns = outlaws_spawns,

	PlayerSpawn = function(ply) ply:SetRunSpeed(350) end,

	armor = 220,

	faction = FACTION_BANDITS,

	rationCount = 2,

	unlockTime = 650*3600,

	unlockPrice = 225000,

	canCapture = true,

	loyalty = 1,

	hitman = true,

	candisguise = true,

	disguise_faction = FACTION_CITIZEN,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

	ply:SetBodygroup(1, 14)

	ply:SetBodygroup(2, 2)

	ply:SetBodygroup(3, 1)

	ply:SetBodygroup(4, math.random(0,1))

	end,

	vip = true

})

end 



if !isSerious then

TEAM_SOLDVR = rp.addTeam("Солдат возрождения ", {

    color = Color(3, 175, 170),

	model = "models/arachnit/hdtf/characters/soldier/soldier_player.mdl",

	description = [[Солдат возрождения.

	Это бывший солдат Армии США, который после 7 часовой войны стал сражаться после альянса своими силами. 

	Он не доверяет силам сопротивления. Поэтому решил ошиваться в D4 рядом с изгоями ему там спокойней. Может помочь сопротивлению в рейде против альянса.

	Спасибо за покупку Евгений Потехин.

	]],

	weapons = {"weapon_bp_sniper","sh_blinkswep","swb_shotgun","swb_m249"},

	salary = 25,

	command = "soldvr",

	max = 1,

	spawns = outlaws_spawns,

	armor = 500,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:0:66917341" or ply:IsRoot() end,

	faction = FACTION_BANDITS,

	rationCount = 1,

	hpRegen = 4,

	loyalty = 1

})

end 



rp.AddDoorGroup('Отверженные', rp.GetFactionTeams(FACTION_BANDITS))

rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_BANDITS})))



if !isSerious then

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