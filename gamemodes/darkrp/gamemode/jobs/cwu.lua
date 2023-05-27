if SERVER then resource.AddWorkshop('425584810') end

local cwu_spawns = {
	rp_city17_urfim = {
		Vector(-1039.968750,1571.189209,264.031250), Vector(-906.143677,1583.453125,264.031250)
	},
}

local mayor_spawn = {
	rp_city17_urfim = rp.GetSpawnPoint(SPAWN_NEXUS),
}



local yellow_citizens = {
'models/player/tnb/citizens/male_02.mdl',
'models/player/tnb/citizens/male_03.mdl',
'models/player/tnb/citizens/male_04.mdl',
'models/player/tnb/citizens/male_05.mdl',
'models/player/tnb/citizens/male_06.mdl',
'models/player/tnb/citizens/male_07.mdl',
'models/player/tnb/citizens/male_08.mdl',
'models/player/tnb/citizens/male_09.mdl',
}



if isIndsutrial then

	TEAM_CWU_WORKER = rp.addTeam("ГСР// Рабочий", {

		color = Color(218, 165, 32),

		model = yellow_citizens,

		description = [[Ваша задача работать на местном заводе по сжиганию и переработке мусора.

	Заряжайте автоматы с Газировкой.



	Лояльность ГО: Средняя

	]],

		--unlockPrice = 50000,

		--unlockTime = 60 * 3600,

		weapons = {},

		salary = 15,

		command = "gsrwork",

		spawns = {rp_city17_urfim = cwu_spawns, rp_industrial17_v1 = {Vector(4308, 3891, 200)}},

		faction = FACTION_CWU,

		rationCount = 4,

		speed = 0.8,

		unlockTime = 4*3600,

		unlockPrice = 2500,

		SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

	ply:SetBodygroup(1, 2)

	ply:SetBodygroup(2, 1)

	ply:SetBodygroup(3, 0)

	ply:SetBodygroup(4, 0)

	end,

		loyalty = 2

	})

end



TEAM_COOK = rp.addTeam("ГСР// ЗАВПИТ", {

	color = Color(218, 165, 32),

	model = yellow_citizens,

	description = [[Вы ответственны за распределение провизии среди граждан.

	Заряжайте автоматы с Газировкой.



Лояльность ГО: Средняя]],

	salary = 10,

	command = "gsrcook",

	max = 4,

	speed = 0.8,

	spawns = cwu_spawns,

	faction = FACTION_CWU,

	rationCount = 4,

	unlockPrice = 25,

	unlockPrice = 75,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

	ply:SetBodygroup(1, 2)

	ply:SetBodygroup(2, 1)

	ply:SetBodygroup(3, 1)

	ply:SetBodygroup(4, 0)

	end,

	loyalty = 2

})



TEAM_CWU_MEDIC = rp.addTeam("ГСР// ФЕЛЬДШЕР", {

	color = Color(218, 165, 32),

	model = {

		"models/player/tnb/citizens/female_11.mdl",

	},

	description = [[Ваша задача организовывать центры здоровья для граждан.

	Заряжайте автоматы с Газировкой.



Лояльность ГО: Средняя

]],

	weapons = {"med_kit"},

	salary = 10,

	command = "gsrmed",

	spawns = cwu_spawns,

	faction = FACTION_CWU,

	rationCount = 4,

	speed = 0.8,

	max = 4,

	unlockTime = 1.5*3600,

	unlockPrice = 250,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,1))

	ply:SetBodygroup(1, 2)

	ply:SetBodygroup(2, 0)

	ply:SetBodygroup(3, 0)

	ply:SetBodygroup(4, 0)

	end,

	loyalty = 2

})





TEAM_CWU_RADIOOWNER = rp.addTeam("ГСР// РАДИО-ТЕХНИК", {

	color = Color(218, 165, 32),

	model = yellow_citizens,

	description = [[Ваша задача обеспечивать досуг граждан города посредством организации развлекательных радио-трансляций.

Размещение радиооборудования под открытым небом (на улицах) категорически запрещено.

Заряжайте автоматы с Газировкой.



Лояльность ГО: Средняя]],

	salary = 7,

	command = "gsrteh",

	max = 2,

	spawns = cwu_spawns,

	faction = FACTION_CWU,

	rationCount = 4,

	speed = 0.8,

	unlockTime = 3*3600,

	unlockPrice = 700,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

	ply:SetBodygroup(1, 2)

	ply:SetBodygroup(2, 1)

	ply:SetBodygroup(3, 0)

	ply:SetBodygroup(4, 0)

	end,

	loyalty = 2

})





TEAM_CINEMAOWNER = rp.addTeam("ГСР// КИНОМЕХАНИК", {

	color = Color(218, 165, 32),

	model = yellow_citizens,

	description = [[Ваша задача обеспечивать досуг граждан города посредством организации развлекательных киносеансов.

Размещать видеооборудование под открытым небом (на улицах) категорически запрещено.

Проигрываемый видеоряд может быть подвержен цензуре со стороны OfC+.

Заряжайте автоматы с Газировкой.



Лояльность ГО: Высокая

]],

	salary = 14,

	command = "gsrkino",

	spawns = {rp_city17_urfim = {Vector(-863.839417,1605.749390,264.031250)}, rp_c18_divrp = {Vector(-2218, 1116, 860)}, rp_industrial17_v1 = {Vector(2749, 1714, 136)}},

	max = 2,

	faction = FACTION_CWU,

	rationCount = 4,

	speed = 0.8,

	unlockTime = 5*3600,

	unlockPrice = 5000,

	SetBodygroups = function(ply)

	ply:SetSkin(math.random(0,3))

	ply:SetBodygroup(1, 2)

	ply:SetBodygroup(2, 1)

	ply:SetBodygroup(3, 0)

	ply:SetBodygroup(4, 0)

	end,

	loyalty = 3

})



TEAM_VORTI = rp.addTeam("ГСР// ВОРТИГОНТ", {

	color = Color(218, 165, 32),

	model = {

		"models/player/vortigauntslave.mdl"

	},

	description = [[Вы вортигонт-раб. Вас может купить состоятельный гражданин, и вы будете обязаны ему прислуживать.

Вы можете продавать еду и медикаменты.]],

	weapons = {},

	salary = 20,

	command = "vortigaunt_slave",

	unlockPrice = 10000,

	speed = 0.8,

	unlockTime = 30 * 3600,

	faction = FACTION_CWU,

	loyalty = 2,

	max = 2,

	rationCount = 4,

	spawns = cwu_spawns,

	hirable = true,

	hirePrice = 75,

})



TEAM_CWU_LEADER = rp.addTeam("ГСР// ПЕРВЫЙ СЕКРЕТАРЬ", {

	color = Color(218, 165, 32),

	model = {

		"models/player/tnb/citizens/male_16.mdl",

	},

	description = [[Следите, координируйте и управляйте всеми службами ГСР.



Вы имеете право на пребывание в нексусе (любой этаж).

К вам должен быть приставлен сотрудник ГО как телохранитель (ранга RCT+).



Лояльность ГО: Максимальная

]],

	salary = 30,

	command = "gsrleader",

	max = 1,

	spawns = cwu_spawns,

	faction = FACTION_CWU,

	rationCount = 4,

	speed = 0.8,

	reversed = true,

	unlockTime = 50*3600,

	unlockPrice = 20000,

	SetBodygroups = function(ply)

	ply:SetSkin(0)

	ply:SetBodygroup(1, 2)

	ply:SetBodygroup(2, 1)

	ply:SetBodygroup(3, 1)

	ply:SetBodygroup(4, 0)

	end,

	spawn_points = {

		[SPAWN_NEXUS] = true,

	},

	loyalty = 4

})

local nextMayor = 0

//local mayorModels = isIndsutrial && {'models/consul.mdl'} || {"models/player/breen.mdl", 'models/combineadmin/player/female_01.mdl', 'models/combineadmin/player/female_02.mdl'}

local mayorModels = {'models/player/taggart/gallahan.mdl','models/player/humans/suitfem/female_02.mdl'}

local mayorName = isIndsutrial && 'Консул' ||  "Администратор Города"

TEAM_MAYOR1 = rp.addTeam(mayorName, {

	color = Color(255, 145, 0,255),

	model = isIndsutrial && mayorModels || "models/player/breen.mdl",

	description = [[Главная персона в городе.



Когда вы живы, все работники ГСР и агенты Патруля Альянса получают увеличенную заработную плату.

Если повстанцы вас убьют, они получат награду, так что будьте аккуратны.



Вы не имеете прямого контроля над ГО, однако к вашему мнению должны прислушиваться.

Вы имеете полный контроль над сотрудниками ГСР.



Вы имеете право на пребывание в нексусе (любой этаж).

Вы имеете право проходить без очереди на любом посту.

Вы имеете право присутствовать на посту D6.

К вам должен быть приставлен сотрудник ГО как телохранитель (ранга 02+).



Лояльность ГО: Максимальная]],

	weapons = {},

	command = "mayor1",

	spawns = mayor_spawn,

	unlockPrice = 50000,

	salary = 40,

	speed = 0.8,

	reversed = true,

	max = 1,

	faction = FACTION_CWU,

	rationCount = 5,

	unlockTime = 100*3600,

	spawn_points = {

		[SPAWN_NEXUS] = true,

	},

	loyalty = 4,

	customCheck = function(ply) return nextMayor < CurTime() end,

	CustomCheckFailMsg = 'MayorDelay',

	PlayerDeath = function(ply, weapon, killer) 

		nextMayor = CurTime() + rp.cfg.MayorDelay

		if killer:IsPlayer() && killer:IsRebel() then

			for k, v in pairs(player.GetAll()) do

				if v:IsRebel() then

					v:AddMoney(rp.cfg.MayorKillReward)

				end

			end

			rp.FlashNotifyAll('Новости альянса', rp.Term('MayorKilled'), killer)

		else

			rp.FlashNotifyAll('Новости альянса', rp.Term('MayorKilledByIncident'))

		end

		ply:ChangeTeam(rp.GetDefaultTeam(ply), true)

	end,

	PlayerDisconnected = function(ply) 

		nextMayor = CurTime() + rp.cfg.MayorDelay

	end

})



if SERVER then

	local math_floor = math.floor

	local team_NumPlayers = team.NumPlayers

	hook.Add("PlayerPayDay", function(ply, amount)

		if (ply:IsCombine() || ply:IsCWU()) && team_NumPlayers(TEAM_MAYOR1) > 0 then

			rp.Notify(ply, NOTIFY_GREEN, rp.Term('MayorSalaryIncrease'))

			return math_floor(amount * 1.4)

		end

	end)

end





rp.AddRelationships(TEAM_MAYOR1, RANK_LEADER, {FACTION_CWU})

rp.AddRelationships(TEAM_CWU_LEADER, RANK_OFFICER, {FACTION_CWU})



rp.AddDoorGroup('Лазарет', rp.GetFactionTeams({FACTION_COMBINE, FACTION_DPF, FACTION_OTA, FACTION_HELIX, FACTION_DAP}, {TEAM_KAEF, TEAM_MAYOR1, TEAM_CWU_LEADER, TEAM_REFERENT}))

rp.AddDoorGroup('Нексус', rp.GetFactionTeams({FACTION_COMBINE, FACTION_DPF, FACTION_OTA, FACTION_HELIX, FACTION_DAP, FACTION_LEGION}, {TEAM_KAEF, TEAM_MAYOR1, TEAM_CWU_LEADER, TEAM_REFERENT, TEAM_EMPLOYER, TEAM_VASIL, TEAM_SKI}))

rp.AddDoorGroup('Администратор', {TEAM_MAYOR1, TEAM_DVL, TEAM_SEC, TEAM_EPU, TEAM_EMPLOYER, TEAM_DAPPCL, TEAM_DAPWARD, TEAM_SKI})

rp.AddDoorGroup('ГСР', rp.GetFactionTeams({FACTION_CWU, FACTION_COMBINE, FACTION_DPF, FACTION_HELIX, FACTION_OTA, FACTION_DAP}, {TEAM_EMPLOYER, TEAM_JUD, TEAM_VASIL}))

rp.addGroupChat(unpack(rp.GetFactionTeams(FACTION_CWU)))



rp.SetTeamVoices(TEAM_MAYOR1, {

	{

		label = 'Коллаборационисты ч1',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_collaboration01.wav', 

		text = 'Мне стало известно, что в последнее время меня называют коллаборационистом, как будто сотрудничать — позорно.',  

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Коллаборационисты ч2',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_collaboration02.wav', 

		text = ' Я спрашиваю вас, что может быть лучше стремления к сотрудничеству?',

		broadcast = true,

		soundDuration = 15 

	},

	{

		label = 'Коллаборационисты ч3',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_collaboration03.wav', 

		text = ' В нашей беспрецедентной ситуации отказ от сотрудничества — это отказ от развития, равный самоубийству.',

		broadcast = true,

		soundDuration = 15 

	},

	{

		label = 'Коллаборационисты ч4',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_collaboration04.wav', 

		text = 'Отказывалась ли двоякодышащая рыба от воздуха? Нет.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Коллаборационисты ч5',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_collaboration05.wav', 

		text = 'Она храбро ползла по суше, тогда как ее сородичи оставались в черной бездне океана, вглядываясь во тьму, невежественные и обреченные, несмотря на вечную бдительность.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Коллаборационисты ч6',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_collaboration06.wav', 

		text = 'Станем ли мы повторять путь трилобитов?',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Коллаборационисты ч7',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_collaboration07.wav', 

		text = 'Неужели всем достижениям человечества суждено стать лишь осколками пластика, разбросанными на окаменевшем ложе между Бургес-Шейлом и тысячелетним слоем грязи?',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Коллаборационисты ч8',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_collaboration08.wav', 

		text = 'Чтобы не изменять себе и своей судьбе, мы должны стремиться к большему. Мы выросли из своей колыбели. Бессмысленно требовать материнского молока, когда истинная помощь ждет нас среди звезд.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Коллаборационисты ч9',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_collaboration09.wav', 

		text = 'И лишь всеобщий союз, который люди недалекие именуют «Комбайном», поможет нам достичь их.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Коллаборационисты ч10',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_collaboration10.wav', 

		text = 'Поэтому я заявляю — да, я коллаборационист. Мы все должны охотно сотрудничать, если хотим пожать плоды объединения.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Коллаборационисты ч11',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_collaboration11.wav', 

		text = 'И мы определенно пожнем их.',

		broadcast = true,

		soundDuration = 8

	},

	{

		label = 'Гордон нарушитель 1',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_disruptor01.wav', 

		text = 'Теперь есть твердые доказательства того, что среди нас появился изменник, который в глазах иных граждан предстает как мессия.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Гордон нарушитель 2',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_disruptor02.wav', 

		text = 'Он — воплощение темнейших инстинктов, невежества и разрушения. Самые ужасные моменты инцидента в Черной Мезе связаны с его именем.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Гордон нарушитель 3',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_disruptor03.wav', 

		text = 'И все же наивные умы наделяют его романтическим ореолом и присваивают ему такие опасные поэтические прозвища, как «Свободный человек» и «Прокладывающий путь».',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Гордон нарушитель 4',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_disruptor04.wav', 

		text = 'Позвольте напомнить вам об опасности следования таким мифам.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Гордон нарушитель 5',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_disruptor05.wav', 

		text = 'Мы едва начали выбираться из глубокой пропасти в развитии нашего вида. Не будем же скатываться обратно во тьму забвения, только что познав свет.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Гордон нарушитель 6',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_disruptor06.wav', 

		text = 'Если вы увидите этого человека, сообщите нам.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Гордон нарушитель 7',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_disruptor07.wav', 

		text = 'Ваши заслуги перед Альянсом будут вознаграждены. Соучастие же в его делах не останется безнаказанным.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Гордон нарушитель 8',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_disruptor08.wav', 

		text = 'Думайте. Остерегайтесь. Знайте.',

		broadcast = true,

		soundDuration = 7

	},

	{

		label = 'City 17 ч1',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_welcome01.wav', 

		text = 'Добро пожаловать! Добро пожаловать в Сити 17.',

		broadcast = true,

		soundDuration = 7

	},

	{

		label = 'City 17 ч2',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_welcome02.wav', 

		text = 'Сами вы его выбрали, или его выбрали за вас — это лучший город из оставшихся.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'City 17 ч3',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_welcome03.wav', 

		text = 'Я такого высокого мнения о Сити 17, что решил разместить свое правительство здесь, в Цитадели, столь заботливо предоставленной нашими Покровителями.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'City 17 ч4',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_welcome04.wav', 

		text = 'Я горжусь тем, что называю Сити 17 своим домом.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'City 17 ч5',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_welcome05.wav', 

		text = '*Рассказывает о Городе*',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'City 17 ч6',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_welcome06.wav', 

		text = 'Итак, собираетесь ли вы остаться здесь, или же вас ждут неизвестные дали, добро пожаловать в Сити 17.',

		broadcast = true,

		soundDuration = 8 

	},

	{

		label = 'City 17 ч7',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_welcome07.wav', 

		text = 'Здесь безопасно.',

		broadcast = true,

		soundDuration = 6

	},

	{

		label = 'Инстинкты ч1',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct01.wav', 

		text = 'Позвольте мне зачитать письмо, которое я получил. «Уважаемый доктор Брин. Почему Альянс подавляет наш цикл размножения? Искренне Ваш, обеспокоенный гражданин».',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч2',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct02.wav', 

		text = 'Спасибо за письмо, гражданин. Конечно, ваш вопрос касается основных биологических потребностей, надежд и страхов за будущее вида.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч3',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct03.wav', 

		text = 'Я вижу и несколько невысказанных вопросов. Знают ли наши Покровители, что для нас лучше? Что дает им право принимать такие решения за человечество? Отключат ли они когда-нибудь поле подавления и позволят ли нам размножаться?',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч4',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct04.wav', 

		text = 'Позвольте мне развеять сомнения, лежащие в основе вашего беспокойства, чем отвечать на каждый невысказанный вопрос.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч5',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct05.wav', 

		text = 'Сначала давайте рассмотрим факт того, что впервые в истории мы стоим на пороге бессмертия.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч6',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct06.wav', 

		text = 'Этот факт влечет за собой далеко идущие выводы. Он требует полного пересмотра наших генетических потребностей.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч7',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct07.wav', 

		text = 'Он требует планирования и обдумывания, что идет вразрез с нашими психологическими установками.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч8',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct08.wav', 

		text = 'В такое время необходимо, может быть, напомнить себе, что наш истинный враг — это инстинкт.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч9',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct09.wav', 

		text = 'Инстинкты воспитывали нас, когда мы только становились.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч10',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct10.wav', 

		text = 'Инстинкты заботились о нас и оберегали нас в те тяжкие годы, когда мы делали первые орудия, готовили скудную пищу на костре',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч11',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct11.wav', 

		text = 'и вздрагивали от теней, скачущих на стенах пещеры.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч12',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct12.wav', 

		text = 'Но инстинкт неотделим от своего двойника — суеверия.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч13',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct13.wav', 

		text = 'Инстинкт неразрывно связан с необдуманными импульсами, и теперь мы видим его истинную природу. Но инстинкт знает о своей бесполезности и, как загнанный в угол зверь, ни за что не сдастся без кровавого боя.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч14',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct14.wav', 

		text = 'Он может нанести человечеству смертельную рану.',

		broadcast = true,

		soundDuration = 8

	},

	{

		label = 'Инстинкты ч15',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct15.wav', 

		text = 'Инстинкт создает своих тиранов и призывает нас восставать против них.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч16',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct16.wav', 

		text = 'Он говорит нам, что неизвестное — это угроза, а не возможность.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч17',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct17.wav', 

		text = 'Инстинкт хитро и незаметно уводит нас с пути изменений и прогресса.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч18',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct18.wav', 

		text = 'Поэтому инстинкт должен быть подавлен.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч19',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct19.wav', 

		text = 'С ним нужно нещадно бороться, начиная с основной потребности человека — потребности в размножении.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч20',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct20.wav', 

		text = 'Мы должны благодарить Покровителей за помощь в борьбе с этой всепоглощающей силой.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч21',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct21.wav', 

		text = 'Нажав на переключатель, они изгнали наших демонов одним движением.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч22',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct22.wav', 

		text = 'Они дали нам силы, которые мы сами не могли найти, чтобы справиться с этой манией.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч23',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct23.wav', 

		text = 'Они указали нам цель. Они помогли нам обратить взоры к звездам.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч24',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct24.wav', 

		text = 'Я уверяю вас, подавляющее поле будет снято в тот день, когда мы овладеем собой, когда мы докажем, что больше в нем не нуждаемся.',

		broadcast = true,

		soundDuration = 15

	},

	{

		label = 'Инстинкты ч25',

		color = Color(255, 165, 0),

		sound = 'vo/Breencast/br_instinct25.wav', 

		text = 'И этот день превращения, по сведениям из надежного источника, недалек.',

		broadcast = true,

		soundDuration = 15

	},

	

 })





rp.SetTeamVoices(TEAM_VORTI, {  

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

