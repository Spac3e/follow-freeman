--

--9-th Legion

--

local legion_spawns = {
	rp_city17_urfim = {Vector(5909.273926,-2033.834595,2180.031250), Vector(6020.626465,-2035.396851,2180.031250), Vector(6064.172363,-1968.121948,2180.031250), Vector(5985.590332,-1967.364258,2180.031250)},
}

rp.addTeam("Штурмовик 9-th Legion", {

    color = Color(0, 191, 255),

	model = {"models/niik/player/01ar_combine_soldier02_pm_n.mdl"},

	description = [[

]],

	weapons = {"weapon_bp_oicw","swb_p228", "swb_m4a1", "climb_swep"},

	salary = 30,

	max = 0,

	command = "leshturm",

	vip = true,

	spawns = legion_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(150) end,

	customCheck = function(ply) return CLIENT or (ply:GetOrg() == "9-th Legions" && (ply:GetOrgData().Rank == 'Recruit' or ply:GetOrgData().Rank == 'Private' or ply:GetOrgData().Rank == 'Sergeant' or ply:GetOrgData().Rank == 'Lieutenant' or ply:GetOrgData().Rank == 'Co-Leader' or ply:GetOrgData().Rank == 'Major' or ply:GetOrgData().Rank == 'Captain' or ply:GetOrgData().Rank == 'Leader')) or ply:IsRoot() end,

	CustomCheckFailMsg = '9thLegion',

	unlockTime = 100 * 3600,

	faction = FACTION_LEGION,

	rationCount = 4,

	loyalty = 4,

})



rp.addTeam("Пулемётчик 9-th Legion", {

    color = Color(0, 191, 255),

	model = {"models/niik/player/01ar_combine_soldier02_pm_n.mdl"},

	description = [[

]],

	weapons = {"swb_m249","swb_deagle", "climb_swep"},

	salary = 30,

	max = 4,

	command = "lemashin",

	vip = true,

	spawns = legion_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(350) end,

	customCheck = function(ply) return CLIENT or (ply:GetOrg() == "9-th Legions" && (ply:GetOrgData().Rank == 'Private' or ply:GetOrgData().Rank == 'Sergeant' or ply:GetOrgData().Rank == 'Lieutenant' or ply:GetOrgData().Rank == 'Major' or ply:GetOrgData().Rank == 'Co-Leader' or ply:GetOrgData().Rank == 'Captain' or ply:GetOrgData().Rank == 'Leader')) or ply:IsRoot() end,

	CustomCheckFailMsg = '9thLegion',

	unlockTime = 100 * 3600,

	faction = FACTION_LEGION,

	rationCount = 4,

	loyalty = 4,

})



TEAM_LEGION_MED = rp.addTeam("Медик 9-th Legion", {

    color = Color(0, 191, 255),

	model = {"models/niik/player/ar_combine_soldier03b_pm_n.mdl"},

	description = [[

]],

	weapons = {"swb_m3super90","swb_tmp", "weapon_medkit", "med_kit", "climb_swep"},

	salary = 30,

	max = 4,

	command = "lemed",

	vip = true,

	spawns = legion_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(100) end,

	customCheck = function(ply) return CLIENT or (ply:GetOrg() == "9-th Legions" && (ply:GetOrgData().Rank == 'Sergeant' or ply:GetOrgData().Rank == 'Lieutenant' or ply:GetOrgData().Rank == 'Major' or ply:GetOrgData().Rank == 'Co-Leader' or ply:GetOrgData().Rank == 'Captain' or ply:GetOrgData().Rank == 'Leader')) or ply:IsRoot() end,

	CustomCheckFailMsg = '9thLegion',

	unlockTime = 100 * 3600,

	faction = FACTION_LEGION,

	rationCount = 4,

	loyalty = 4,

})



TEAM_LEENG = rp.addTeam("Инженер 9-th Legion", {

    color = Color(0, 191, 255),

	model = {"models/niik/player/01ar_combine_soldier01_pm_n.mdl"},

	description = [[

]],

	weapons = {"swb_p90","swb_usp","weapon_bp_hopwire","weapon_c4","climb_swep","weapon_slam","weapon_frag"},

	salary = 30,

	max = 3,

	command = "leeng",

	vip = true,

	spawns = legion_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(150) end,

	customCheck = function(ply) return CLIENT or (ply:GetOrg() == "9-th Legions" && (ply:GetOrgData().Rank == 'Lieutenant' or ply:GetOrgData().Rank == 'Major' or ply:GetOrgData().Rank == 'Captain' or ply:GetOrgData().Rank == 'Co-Leader' or ply:GetOrgData().Rank == 'Leader')) or ply:IsRoot() end,

	CustomCheckFailMsg = '9thLegion',

	canCapture = true,

	unlockTime = 100 * 3600,

	faction = FACTION_LEGION,

	rationCount = 4,

	loyalty = 4,

})



TEAM_LEENG_SVY = rp.addTeam("Сверх-Юнит 9-th Legion", {

    color = Color(0, 191, 255),

	model = {"models/player/neo_heavy.mdl"},

	description = [[

]],

	weapons = {"swb_xm1014","swb_m249","weapon_frag","swb_pistol","weapon_slam","weapon_c4","weapon_bp_hopwire"},

	salary = 30,

	max = 2,

	command = "leesvy3",

	vip = true,

	spawns = legion_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(700) ply:SetHealth(150) ply:SetMaxHealth(200) end,

	customCheck = function(ply) return CLIENT or (ply:GetOrg() == "9-th Legions" && (ply:GetOrgData().Rank == 'Lieutenant' or ply:GetOrgData().Rank == 'Major' or ply:GetOrgData().Rank == 'Captain' or ply:GetOrgData().Rank == 'Co-Leader' or ply:GetOrgData().Rank == 'Leader')) or ply:IsRoot() end,

	CustomCheckFailMsg = '9thLegion',

	canCapture = true,

	unlockTime = 300 * 3600,

	hpRegen = 5,

	faction = FACTION_LEGION,

	rationCount = 4,

	loyalty = 4,

})



TEAM_SKI = rp.addTeam("Ученый 9-th Legion", {

    color = Color(0, 191, 255),

	model = "models/niik/player/sparbine_soldier_pm.mdl",

	description = [[

]],

	weapons = {"weapon_357","swb_ar3","weapon_frag", "weapon_crossbow", "weapon_bp_sniper","swb_shotgun", "weapon_ota_reprogrammer", "climb_swep"},

	salary = 20,

	max = 1,

	command = "sci",

	spawns = legion_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(150) ply:SetRunSpeed(350) end,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:1:73077290" or ply:IsRoot() end,

	CustomCheckFailMsg = '9thLegion',

	canCapture = true,

	faction = FACTION_LEGION,

	rationCount = 4,

	loyalty = 4,

})



rp.addTeam("Кобра", {
	
    color = Color(3, 175, 170),

	model = "models/ninja/chinese_fplay_niikfix.mdl",

	description = [[Кобра это сестра Валькирии, которая решила модернизировать себя с помощью биотехнологий для того, чтобы стать лучше сестры, она модернизировала все своё тело, даже избавилась от чувства страха и жалости.

	 Ей поручают самые сложные задания, которые она выполняет так, что никто не знает как она выглядит.

	 Кобра не имеет страха ни перед чем, она бездушный убийца из-за чего ей и дали прозвище - Кобра. Перепрограммированая 9 легионом



	 Спасибо за покупку Александер

	]],

	weapons = {"swb_shotgun"},

	salary = 25,

	command = "kokobr",

	max = 1,

	spawns = legion_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(200) end,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:1:114982642" or ply:IsRoot() end,

	faction = FACTION_LEGION,

	rationCount = 1,

	loyalty = 1

})



rp.addTeam("Сапер 9-th Legion", {

    color = Color(3, 175, 170),

	model = "models/jessev92/player/hl2/conceptbine.mdl",

	description = [[



	 Спасибо за покупку Павел

	]],

	weapons = {"swb_m3super90","swb_m249","climb_swep","weapon_hcanister","keypad_cracker"},

	salary = 25,

	command = "saperrlik",

	max = 1,

	spawns = legion_spawns,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:0:55603376" or ply:IsRoot() end,

	faction = FACTION_LEGION,

	rationCount = 1,

	loyalty = 1

})



rp.SetFactionVoices({FACTION_LEGION}, {

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

				label = 'Разрушьте покрытие!',

				sound = 'npc/metropolice/vo/destroythatcover.wav',

				text = 'Разрушьте покрытие!',

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

				text = 'Зарегестрирована смерть. Квартал готов к зачистке.'

			},

			{

				label = 'Следите за ним',

				sound = 'npc/metropolice/vo/watchit.wav',

				text = 'Следите за ним.'

			},

			{

				label = 'Банка 1',

				sound = 'npc/metropolice/vo/pickupthecan1.wav',

				text = 'Подним эту банку!.'

			},

			{

				label = 'Банка 2',

				sound = 'npc/metropolice/vo/pickupthecan2.wav',

				text = 'Подним банку!.'

			},

			{

				label = 'Банка 3',

				sound = 'npc/metropolice/vo/pickupthecan3.wav',

				text = 'Я сказал, подними банку!.'

			},

			{

				label = 'Банка 4',

				sound = 'npc/metropolice/vo/putitinthetrash1.wav',

				text = 'А теперь положи ее в мусорку!.'

			},

			{

				label = 'Банка 5',

				sound = 'npc/metropolice/vo/putitinthetrash2.wav',

				text = 'Я сказал, положи ее в мусорку!.'

			},

})

--

--Pulp

--



local pulp_spawns = {
	rp_city17_urfim = {Vector(-5442.462891,-5677.480957,80.031250), Vector(-5245.602539,-5687.049805,80.031250)},
}

TEAM_SWAT = rp.addTeam("Довоенный спецназ", {

    color = Color(0, 0, 0),

	model = {"models/player/swat.mdl","models/player/riot.mdl"},

	description = [[

]],

	weapons = {"swb_357","swb_ar3", "weapon_frag", "weapon_crossbow","swb_m3super90"},

	salary = 30,

	max = 4,

	command = "swat",

	spawns = pulp_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(150) end,

	customCheck = function(ply) return ply:GetOrg() == "Pulp Fiction" or ply:IsRoot() end,

	faction = FACTION_PULP,

	unlockTime = 100 * 3600,

	rationCount = 4,

	loyalty = 1,

})



TEAM_SWAT_MED = rp.addTeam("Боевой медик", {

    color = Color(0, 0, 0),

	model = {"models/player/gasmask.mdl"},

	description = [[

]],

	weapons = {"swb_p228","swb_mac10", "weapon_frag", "weapon_medkit", "med_kit"},

	salary = 30,

	max = 3,

	command = "swatmed",

	spawns = pulp_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(150) end,

	customCheck = function(ply) return ply:GetOrg() == "Pulp Fiction" or ply:IsRoot() end,

	faction = FACTION_PULP,

	canCapture = true,

	unlockTime = 150 * 3600,

	rationCount = 4,

	loyalty = 1,

})



TEAM_SWAT_SM = rp.addTeam("SMIT", {

    color = Color(0, 0, 0),

	model = {"models/players/outlaw/bmsfemassasin.mdl"},

	description = [[ Специальная Модернизированная Команда Невидимок.

	Учёные из сопротивления, под надзором и при помощи Инквизитора, создали особый проект, основываясь на готовых технологиях Альянса. Проект костюма невидимки. Иначе - стелс система.

Пока что было создано всего три экземпляра брони.



Костюм имел свойство преломлять, отражать и проецировать свет, но технология была далека от совершенства. Резкие движения могут быть замечены с близкого расстояния, особенно для отряда сверхчеловеческого патруля.



Существенным минусом длительного ношения брони стала частичная потеря памяти, расстройство личности и, как правило, потеря большинства эмоций. Во время испытаний пострадали люди, носившие броню, пускай их удалось откачать, но некоторые последствия были неизлечимы. Испытания на самых стойких людях не дали результата, психика многих не выдерживала. Исследования было решено прекратить, пока не пришла немая девушка по имени Элли Хаос. Многие знали её трагическую историю, когда горы трупов окружали её. Психика была нарушена, Элли сломана и больше не могла говорить. Ей множество раз отказывали в испытаниях, но в конце концов Инквизитор дал согласие.



Результат был поражающим. Спустя неделю упорных тренировок Элли потеряла большинство старых воспоминаний, боль прошлого стремительно ушла. Вместо отчаяния пришло новое чувство - благодарность и жажда служить тому, кто помог избавиться от страданий. Элли Хаос и возглавила отряд S.M.I.T.



После этого испытания проводились на душевно больных девушках, которые не смогли спокойно пережить семичасовую войну и её первые годы.

]],

	weapons = {"weapon_bp_sniper","swb_awp", "swb_p228", "swb_knife","climb_swep","weapon_camo"},

	salary = 30,

	max = 3,

	command = "swatsm",

	spawns = pulp_spawns,

	PlayerSpawn = function(ply) ply:SetRunSpeed(350) end,

	customCheck = function(ply) return ply:GetOrg() == "Pulp Fiction" or ply:IsRoot() end,

	faction = FACTION_PULP,

	unlockTime = 200 * 3600,

	rationCount = 2,

	loyalty = 1,

})



rp.addTeam("Инквизитор", {

    color = Color(0, 0, 0),

	model = "models/hunk_orc.mdl",

	description = [[Наёмный убийца, некогда элитный снайпер Альянса, давший волю чувствам.]],

	weapons = {"weapon_pistol","swb_ar3", "lockpick", "keypad_cracker", "swb_knife", "weapon_bp_sniper","climb_swep"},

	salary = 35,

	max = 1,

	command = "inq",

	spawns = pulp_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(150) end,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:1:71049696" or ply:IsRoot() end,

	faction = FACTION_PULP,

	canCapture = true,

	rationCount = 3,

	loyalty = 3,

	hitman = true,

})



rp.addTeam("Ветеран SWAT", {

    color = Color(0, 0, 0),

	model = "models/konnie/blackopsmodel/blackopsmodel_niikfix.mdl",

	description = [[Правила: является бойцом S.W.A.T. , подчиняется инквизитору, может действовать во всех секторах в том числе и в одиночку.

	Личная профа Михаила]],

	weapons = {"swb_deagle","swb_m249"},

	salary = 28,

	max = 1,

	command = "vetsw",

	spawns = pulp_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(300) end,

	customCheck = function(ply) return ply:SteamID() == "STEAM_0:0:134718150" or ply:IsRoot() end,

	faction = FACTION_PULP,

	canCapture = true,

	rationCount = 3,

	loyalty = 3,

})



--

--Sons of Sunrise

--

local sunrise_spawns = {
	rp_city17_urfim = {Vector(789, 6198, -458)},
}

TEAM_SUN_Fan = rp.addTeam("Фанатик Рассвета", {

    color = Color(0, 255, 255),

	model = {"models/industrial_uniforms/pm_industrial_uniform2.mdl"},

	description = [[

Фанатик Рассвета 



Доведенный идеями культа Рассвета до безумия член организации, решивший собственными руками очистить город 



от захватчиков и их последователей.

]],

	weapons = {"weapon_lordi_sledgehammer","lockpick","keypad_cracker"},

	salary = 20,

	max = 0,

	command = "SunFan",

	spawns = sunrise_spawns,

	unlockTime = 100 * 3600,

	PlayerSpawn = function(ply) ply:GiveArmor(250) end,

    customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'Sons of Sunrise' && ply:GetOrgData().Rank == 'The Insider' or ply:GetOrgData().Rank == 'The Disciple' or ply:GetOrgData().Rank == 'The Apprentice' or ply:GetOrgData().Rank == 'The Master' or ply:GetOrgData().Rank == 'The Honorable Master' or ply:GetOrgData().Rank == 'The Guard of Sunrise' or ply:GetOrgData().Rank == 'The Apostle of Sunrise' or ply:GetOrgData().Rank == 'The Will of Sunrise' or  ply:GetOrgData().Rank =='The Prophet of Sunrise') end,

	faction = FACTION_SUNRISE,

	candisguise = true,

	disguise_faction = FACTION_CITIZEN,


	rationCount = 0,

	loyalty = 1,

})

TEAM_SUN_RIS = rp.addTeam("Последователь Рассвета", {

    color = Color(0, 255, 255),

	model = {"models/killzone/pm_hazmat_niikfix.mdl"},

	description = [[

Последователь Рассвета 



Посвященный член культа, доказавший свою преданность истинам и учениям культа, подготовленный к военным действиям. 



Готов отдать жизнь во имя великой войны с Альянсом и его марионетками.

]],

	weapons = {"weapon_bp_rtboicw","swb_m3super90","weapon_lordi_sledgehammer","lockpick","keypad_cracker","med_kit"},

	salary = 30,

	max = 0,

	command = "SunRis",

	spawns = sunrise_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(500) ply:SetHealth(150) ply:SetMaxHealth(150) 

		ply:SetBodygroup(1, 2)

		ply:SetBodygroup(2, 0)

		ply:SetBodygroup(3, 2)

		ply:SetBodygroup(4, 2)

		ply:SetBodygroup(5, 1)

		ply:SetBodygroup(6, 1)

		ply:SetBodygroup(7, 2)

		ply:SetBodygroup(8, 1)

		end,

	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'Sons of Sunrise' && ply:GetOrgData().Rank == 'The Honorable Master' or ply:GetOrgData().Rank == 'The Guard of Sunrise' or ply:GetOrgData().Rank == 'The Apostle of Sunrise' or ply:GetOrgData().Rank == 'The Will of Sunrise' or ply:GetOrgData().Rank == 'The Prophet of Sunrise') end,

	faction = FACTION_SUNRISE,

	rationCount = 2,

	candisguise = true,

	disguise_faction = FACTION_CITIZEN,

	unlockTime = 200 * 3600,

	max = 4,

	loyalty = 1,

})

rp.addTeam("Проповедник Рассвета", {

    color = Color(0, 255, 255),

	model = {"models/killzone/pm/pm_engi_trooper_niikfix.mdl"},

	description = [[

]],

	weapons = {"swb_xm1014","swb_deagle", "seig_hail", "weapon_bp_iceaxe"},

	salary = 30,

	max = 6,

	command = "sunrisoedprop",

	spawns = sunrise_spawns,

	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetMaxHealth(150)  end,

	armor = 600,

	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'Sons of Sunrise' && ply:GetOrgData().Rank == 'The Honorable Master' or ply:GetOrgData().Rank == 'The Guard of Sunrise' or ply:GetOrgData().Rank == 'The Apostle of Sunrise' or ply:GetOrgData().Rank == 'The Will of Sunrise' or ply:GetOrgData().Rank == 'The Prophet of Sunrise') end,

	faction = FACTION_SUNRISE,

	rationCount = 1,

	loyalty = 2,

})

TEAM_SUN_STR = rp.addTeam("Страж Рассвета", {

    color = Color(0, 255, 255),

	model = {"models/killzone/pm_sniper_niikfix.mdl"},

	description = [[

Страж Рассвета 



Тяжеловооруженный защитник догматов Рассвета.



 Авангард силовых акций организации. Щит и меч культа.

]],

	weapons = {"weapon_bp_sniper","swb_xm1014","swb_m249","door_ram","lockpick","keypad_cracker", "cloaking-10seconds"},

	salary = 30,

	max = 0,

	command = "SunSTR",

	hpRegen = 5,

	spawns = sunrise_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(700) ply:SetHealth(250) ply:SetMaxHealth(250) 

		ply:SetBodygroup(1, 2)

		ply:SetBodygroup(2, 1)

		ply:SetBodygroup(3, 2)

		ply:SetBodygroup(4, 2)

		ply:SetBodygroup(5, 1)

		ply:SetBodygroup(6, 2)

		ply:SetBodygroup(7, 0)

		ply:SetBodygroup(8, 1)

		ply:SetBodygroup(9, 1)

		end,

	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'Sons of Sunrise' && ply:GetOrgData().Rank == 'The Guard of Sunrise' or ply:GetOrgData().Rank == 'The Apostle of Sunrise' or ply:GetOrgData().Rank == 'The Will of Sunrise' or ply:GetOrgData().Rank == 'The Prophet of Sunrise') end,

	faction = FACTION_SUNRISE,

	candisguise = true,

	disguise_faction = FACTION_CITIZEN,

	canCapture = true,

	rationCount = 2,

	unlockTime = 366 * 3600,

	max = 4,

	loyalty = 1,

})



TEAM_SUN_AP = rp.addTeam("Апостол Рассвета", {

    color = Color(0, 255, 255),

	model = {"models/player/tfa_kz_helghast_assault.mdl"},

	description = [[

Апостол Рассвета 



Член узкого круга Рассвета, 



чьи боевые показатели были искусственно повышены до сверхчеловеческого уровня 



специальной неокомпозитной броней и физическими модификациями тела. Не чувствует страха и боли.



Верен исключительно принципам Рассвета.

]],

	weapons = {"door_ram","sh_blinkswep","swb_xm1014","weapon_gauss_rifle","swb_m249","door_ram","lockpick","keypad_cracker"},

	salary = 40,

	max = 0,

	command = "SunAP",

	spawns = sunrise_spawns,

	PlayerSpawn = function(ply) ply:GiveArmor(1000) ply:SetHealth(250) ply:SetRunSpeed(350) end,

	faction = FACTION_SUNRISE,

	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'Sons of Sunrise' && ply:GetOrgData().Rank == 'The Apostle of Sunrise' or ply:GetOrgData().Rank == 'The Will of Sunrise' or ply:GetOrgData().Rank == 'The Prophet of Sunrise') end,

	candisguise = true,

	disguise_faction = FACTION_CITIZEN,

	canCapture = true,

	hpRegen = 10,

	rationCount = 3,

	unlockTime = 680 * 3600,

	max = 2,

	vip = true,

	loyalty = 2,

})

rp.AddDoorGroup('Нексус', rp.GetFactionTeams({FACTION_COMBINE, FACTION_DPF, FACTION_OTA, FACTION_HELIX, FACTION_DAP, FACTION_LEGION}, {TEAM_KAEF, TEAM_MAYOR1, TEAM_CWU_LEADER, TEAM_REFERENT, TEAM_EMPLOYER, TEAM_VASIL, TEAM_SKI}))

rp.AddDoorGroup('Сыны Рассвета',{FACTION_SUNRISE})



rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_SUNRISE})))

rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_PULP})))

rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_LEGION})))

