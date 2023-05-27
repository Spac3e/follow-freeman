--[[
Server Name: λ HL2RP | Classic | Cuтu-17
Server IP:   185.221.196.56:27016
File Path:   gamemodes/urf_imrp/gamemode/config/jobs.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local citizens = {
'models/player/tnb/citizens/male_02_fix.mdl',
'models/player/tnb/citizens/male_04_fix.mdl',
'models/player/tnb/citizens/male_07_fix.mdl',
'models/player/tnb/citizens/male_09_fix.mdl',
'models/player/tnb/citizens/female_01_fix.mdl',
'models/player/tnb/citizens/female_02_fix.mdl',
'models/player/tnb/citizens/female_04_fix.mdl'}

if !isWhiteForest then
TEAM_CITIZEN = rp.addTeam('Неопознанное лицо', {
	color = Color(150, 170, 200),
	model = citizens,
	description = [[
Только прибывший в город.

Лояльность ГО: Низкая
]],
	command = 'unknowcitizen',
	salary = 3,
	speed = 0.8,
	faction = FACTION_CITIZEN,
	rationCount = 1,
	loyalty = 1,
	canUseHire = true,
	canWear = !isSerious,
	disallowDonateWeapons = isIndsutrial,
	SetBodygroups = function(ply)
	ply:SetSkin(math.random(0,3))
	ply:SetBodygroup(1, 0)
	ply:SetBodygroup(2, 0)
	ply:SetBodygroup(3, 0)
	ply:SetBodygroup(4, 0)
	end,
	appearance = 
	{
		{
            mdl = {
            'models/player/tnb/citizens/male_02_fix.mdl',
            'models/player/tnb/citizens/male_04_fix.mdl',
            'models/player/tnb/citizens/male_07_fix.mdl',
            'models/player/tnb/citizens/male_09_fix.mdl',
            'models/player/tnb/citizens/female_01_fix.mdl',
            'models/player/tnb/citizens/female_02_fix.mdl',
            'models/player/tnb/citizens/female_04_fix.mdl'},
			bodygroups = {
				[1] = {0},
				[2] = {0},
				[3] = {0},
				[4] = {0},
			}
		},
	},	
})

rp.addTeam('Гражданин', {
	color = Color(150, 170, 200),
	model = citizens,
	description = [[
Немного освоившийся в городе гражданин.

Лояльность ГО: Низкая
]],
	weapons = {},
	command = 'citizen',
	salary = 4,
	speed = 0.8,
	faction = FACTION_CITIZEN,
	rationCount = 1,
	unlockTime = 0.5 * 3600,
	loyalty = 1,
	canWear = !isSerious,
	disallowDonateWeapons = isIndsutrial,
	SetBodygroups = function(ply)
	ply:SetSkin(math.random(0,3))
	ply:SetBodygroup(1, 0)
	ply:SetBodygroup(2, 0)
	ply:SetBodygroup(3, 0)
	ply:SetBodygroup(4, 0)
	end,
	appearance = 
	{
		{
            mdl = {
            'models/player/tnb/citizens/male_02_fix.mdl',
            'models/player/tnb/citizens/male_04_fix.mdl',
            'models/player/tnb/citizens/male_07_fix.mdl',
            'models/player/tnb/citizens/male_09_fix.mdl',
            'models/player/tnb/citizens/female_01_fix.mdl',
            'models/player/tnb/citizens/female_02_fix.mdl',
            'models/player/tnb/citizens/female_04_fix.mdl'},
			bodygroups = {
				[1] = {0},
				[2] = {0},
				[3] = {0},
				[4] = {0},
			}
		},
	},	
})

rp.addTeam('Добропорядочный Гражданин', {
	color = Color(150, 170, 200),
	model = citizens,
	description = [[
Гражданин, не замеченный в совершении преступлений.
Получает 1 дополнительный рацион.

Лояльность ГО: Средняя
]],
	weapons = {},
	command = 'goodcitizen',
	salary = 5,
	speed = 0.8,
	faction = FACTION_CITIZEN,
	rationCount = 1,
	unlockTime = 6 * 3600,
	loyalty = 2,
	disallowDonateWeapons = isIndsutrial,
	canWear = !isSerious,
	SetBodygroups = function(ply)
	ply:SetSkin(math.random(0,3))
	ply:SetBodygroup(1, 0)
	ply:SetBodygroup(2, 0)
	ply:SetBodygroup(3, 0)
	ply:SetBodygroup(4, 0)
	end,
	appearance = 
	{
		{

            mdl = {
            'models/player/tnb/citizens/male_02_fix.mdl',
            'models/player/tnb/citizens/male_04_fix.mdl',
            'models/player/tnb/citizens/male_07_fix.mdl',
            'models/player/tnb/citizens/male_09_fix.mdl',
            'models/player/tnb/citizens/female_01_fix.mdl',
            'models/player/tnb/citizens/female_02_fix.mdl',
            'models/player/tnb/citizens/female_04_fix.mdl'},
			bodygroups = {
				[1] = {0},
				[2] = {0},
				[3] = {0},
				[4] = {0},
			}
		},
	},	
})

rp.addTeam('Доверенный Гражданин', {
	color = Color(150, 170, 200),
	model = citizens,
	description = [[
Гражданин, заработавший своим трудом доверие среди жителей города.
Получает 1 дополнительный рацион.

Лояльность ГО: Средняя
]],
	weapons = {},
	command = 'dovercitizen',
	salary = 6,
	faction = FACTION_CITIZEN,
	rationCount = 1,
	speed = 0.8,
	unlockTime = 50 * 3600,
	loyalty = 2,
	disallowDonateWeapons = isIndsutrial,
	canWear = !isSerious,
	SetBodygroups = function(ply)
	ply:SetSkin(math.random(0,3))
	ply:SetBodygroup(1, 0)
	ply:SetBodygroup(2, 0)
	ply:SetBodygroup(3, 0)
	ply:SetBodygroup(4, 0)
	end,
	appearance = 
	{
		{
            mdl = {
            'models/player/tnb/citizens/male_02_fix.mdl',
            'models/player/tnb/citizens/male_04_fix.mdl',
            'models/player/tnb/citizens/male_07_fix.mdl',
            'models/player/tnb/citizens/male_09_fix.mdl',
            'models/player/tnb/citizens/female_01_fix.mdl',
            'models/player/tnb/citizens/female_02_fix.mdl',
            'models/player/tnb/citizens/female_04_fix.mdl'},
			bodygroups = {
				[1] = {0},
				[2] = {0},
				[3] = {0},
				[4] = {0},
			}
		},
	},	
})

rp.addTeam('Почетный гражданин', {
	color = Color(150, 170, 200),
	model = citizens,
	description = [[
Гражданин,которого ставят в пример другим за его заслуги.
Получает 2 дополнительных рациона.

Лояльность ГО: Средняя
]],
	weapons = {},
	command = 'pochetcitizen',
	salary = 7,
	faction = FACTION_CITIZEN,
	speed = 0.8,
	rationCount = 1,
	unlockTime = 120 * 3600,
	unlockPrice = 5000,
	loyalty = 2,
	disallowDonateWeapons = isIndsutrial,
	SetBodygroups = function(ply)
	ply:SetSkin(math.random(0,3))
	ply:SetBodygroup(1, 0)
	ply:SetBodygroup(2, 0)
	ply:SetBodygroup(3, 0)
	ply:SetBodygroup(4, 0)
	--ply:SetSkin(math.random(0,3))
	--ply:SetBodygroup(1, 3)
	--ply:SetBodygroup(2, 1)
	--ply:SetBodygroup(3, 0)
	--ply:SetBodygroup(4, 0)
	end,
	appearance = 
	{
		{
            mdl = {
            'models/player/tnb/citizens/male_02_fix.mdl',
            'models/player/tnb/citizens/male_04_fix.mdl',
            'models/player/tnb/citizens/male_07_fix.mdl',
            'models/player/tnb/citizens/male_09_fix.mdl',
            'models/player/tnb/citizens/female_01_fix.mdl',
            'models/player/tnb/citizens/female_02_fix.mdl',
            'models/player/tnb/citizens/female_04_fix.mdl'},
			bodygroups = {
				[1] = {0},
				[2] = {0},
				[3] = {0},
				[4] = {0},
			}
		},
	},	
})
TEAM_LOYAL = rp.addTeam('Лоялист', {
	color = Color(150, 170, 200),
	model = citizens,
	description = [[
Гражданин, доказавший свою преданность Всеобщему Союзу и его идеалам.
Получает 3 дополнительных рациона.

Лояльность ГО: Высокая
]],
	weapons = {},
	command = 'loyalcitizen',
	salary = 8,
	faction = FACTION_CITIZEN,
	rationCount = 1,
	speed = 0.8,
	unlockTime = isSerious && 1500 * 3600 || 350 * 3600,
	unlockPrice = 7500,
	loyalty = 3,
	disallowDonateWeapons = isIndsutrial,
	SetBodygroups = function(ply)
	ply:SetSkin(math.random(0,3))
	ply:SetBodygroup(1, 3)
	ply:SetBodygroup(2, 1)
	ply:SetBodygroup(3, 0)
	ply:SetBodygroup(4, 0)
	end,
	appearance = 
	{
		{
            mdl = {
            'models/player/tnb/citizens/male_02_fix.mdl',
            'models/player/tnb/citizens/male_04_fix.mdl',
            'models/player/tnb/citizens/male_07_fix.mdl',
            'models/player/tnb/citizens/male_09_fix.mdl',
            'models/player/tnb/citizens/female_01_fix.mdl',
            'models/player/tnb/citizens/female_02_fix.mdl',
            'models/player/tnb/citizens/female_04_fix.mdl'},
			bodygroups = {
				[1] = {0},
				[2] = {0},
				[3] = {0},
				[4] = {0},
			}
		},
	},	
})

TEAM_REFERENT = rp.addTeam('Референт Администрации', {
	color = Color(150, 170, 200),
	model = {
	'models/player/humans/suitfem/female_02_fix.mdl',
	"models/player/taggart/gallahan_fix.mdl"},
	description = [[
Гражданин, приближенный к Администрации Города.
Получает 3 дополнительных рациона.

Вы имеете право на пребывание в холе нексуса, исключительно вместе с сотрудником ГО.
К вам должен быть приставлен сотрудник ГО как телохранитель.

Лояльность ГО: Высокая
]],
	command = 'bestcitizen',
	spawn_points = {
		[SPAWN_BUNKER] = true,
		[SPAWN_D6] = true,
		[SPAWN_TRAIN] = true,
		[SPAWN_NEXUS] = true,
	},
	salary = 9,
	faction = FACTION_CITIZEN,
	appearance = 
	{
		{
			mdl = {
			'models/teslacloud/cityadmin/female01.mdl',
			'models/teslacloud/cityadmin/female04.mdl',
			'models/teslacloud/cityadmin/female03.mdl',
			'models/teslacloud/cityadmin/female07.mdl',
			'models/teslacloud/cityadmin/male01.mdl',
			'models/teslacloud/cityadmin/male010.mdl',
			'models/teslacloud/cityadmin/male02.mdl',
			'models/teslacloud/cityadmin/male05.mdl',
			'models/teslacloud/cityadmin/male06.mdl',
			'models/teslacloud/cityadmin/male07.mdl',
			'models/teslacloud/cityadmin/male08.mdl',
			'models/teslacloud/cityadmin/male09.mdl'},
			bodygroups = {
				[1] = {1,2,3,4,5,6,7,8},
				[2] = {0,1,2,3,4,5},

			}
		},
	},	
	rationCount = 1,
	speed = 0.8,
	unlockTime = isSerious && 2000 * 3600 || 600 * 3600,
	unlockPrice = 15500,
	loyalty = 3,
	disallowDonateWeapons = isIndsutrial,
})
end


/* WHITE FOREST */

if isWhiteForest then
TEAM_CITIZEN = rp.addTeam('Беженец', {
	color = Color(150, 170, 200),
	model = {"models/player/tnb/citizens/male_11_fix.mdl","models/player/tnb/citizens/female_02_fix.mdl"},
	description = [[
Вы сбежали из захваченного силами альянса города.
Ваша главная цель выжить в Роще
]],
	command = 'bezcit',
	salary = 4,
	speed = 0.8,
	faction = FACTION_CITIZEN,
	rationCount = 1,
	loyalty = 5,
	canWear = !isSerious,
	appearance =
	{
		{mdl = {
		'models/player/tnb/citizens/male_11_fix.mdl',
		'models/player/tnb/citizens/female_02_fix.mdl',},
		  skins	   = {0,1},
		   bodygroups = {
				[1] = {0,1},
				[2] = {0},
				[3] = {0,1,2},
				[4] = {0,1,2,3,4},
						}
		},
	},
})

TEAM_BEG = rp.addTeam('Депортированный', {
	color = Color(150, 170, 200),
	model = {"models/player/tnb/citizens/male_12_fix.mdl","models/player/tnb/citizens/female_10_fix.mdl"},
	description = [[
Вы были выселены за городскую зону силами альянса. 
Вас выбросили на растерзание охотникам и другим сущностям.
]],
	command = 'depcit',
	salary = 3,
	speed = 0.8,
	unlockTime = 20 * 3600,
	faction = FACTION_CITIZEN,
	rationCount = 1,
	loyalty = 5,
	canWear = !isSerious,
	appearance = 
	{
		{
			mdl = {
				'models/player/tnb/citizens/male_12_fix.mdl',
				'models/player/tnb/citizens/female_10_fix.mdl',
			},
			skins = {0},
			bodygroups = {
				[1] = {0,1},
				[2] = {0},
				[3] = {0,1,2},
				[4] = {0,1,2,3,4},
			}
		},
	},	
})

rp.addTeam('Сбежавший раб', {
	color = Color(150, 170, 200),
	model = "models/player/vortigaunt_fix.mdl",
	description = [[
Вы вортигонт, который осмелился снять с себя кандалы.
Из-за долгого ношения кандалов, ваши вортигонтские силы покинули вас и вы потеряли связь с измирением дзен.
]],
	weapons = {},
	command = 'vortrab',
	salary = 5,
	speed = 0.8,
	faction = FACTION_CITIZEN,
	rationCount = 1,
	unlockTime = 250 * 3600,
	unlockPrice = 3000,
	loyalty = 5,
	canWear = !isSerious,
})


rp.addTeam('Бывший заключенный', {
	color = Color(150, 170, 200),
	model = {"models/player/tnb/citizens/male_10_fix.mdl"},
	description = [[
Во время восстания и атаки Гордона Фримена для спасения Илая Венса, Нова Проспект был сильн поврежден, а затем уничтожен.
Во время этого, некоторым заключенным удалось сбежать из Новы Проспект и уйти оттуда.
После нескольких недель блуждания, они наткнулись на некий лес и бывшую базу "Белую Рощу", которой раньше владела "Черная Меза".
]],
	weapons = {},
	command = 'bezcit',
	salary = 4,
	speed = 0.8,
	faction = FACTION_CITIZEN,
	rationCount = 1,
	unlockTime = 350 * 3600,
	unlockPrice = 3000,
	loyalty = 5,
	canWear = !isSerious,
	appearance =
	{
		{mdl = {
		'models/player/tnb/citizens/male_10_fix.mdl',},
		  skins	   = {0},
		   bodygroups = {
				[1] = {5},
				[2] = {6},
				[3] = {1},
				[4] = {0},
						}
		},
	},
})

rp.addTeam('Выживший', {
	color = Color(150, 170, 200),
	model = {"models/player/tnb/citizens/male_14_fix.mdl"},
	description = [[
Ветеран Белой Рощи. Уже хорошо освоился здесь. Он знает, как выживать и прятаться от сил Альянса, чтобы его не нашли.
За время, проведенное в Белой Роще, он смог найти немного оружия и боеприпасов к нему. Это также сыграло роль в его выживании.
Он может торговаться с силами сопротивления, чтобы получить у них какую-либо информацию, так как повстанцы его уже хорошо знают, но недостаточно, чтобы принять в свои ряды.
]],
	weapons = {},
	command = 'dovercitizen',
	salary = 6,
	faction = FACTION_CITIZEN,
	rationCount = 1,
	speed = 0.8,
	unlockTime = 550 * 3600,
	unlockPrice = 5000,
	loyalty = 5,
	canWear = !isSerious,
	appearance =
	{
		{mdl = {
		'models/player/tnb/citizens/male_14_fix.mdl'},
		  skins	   = {0},
		   bodygroups = {
				[1] = {6},
				[2] = {3,6},
				[3] = {0,1},
				[4] = {0,1,2,3,4},
						}
		},
	},
})

rp.addTeam('Отшельник', {
	color = Color(150, 170, 200),
	model = {"models/player/tnb/citizens/male_18_fix.mdl","models/player/tnb/citizens/female_02_fix.mdl"},
	description = [[
Вы хитрый, в роще вы оказались еще перед началом 7 часовой войны.
Вы заранее подготовились: изучили окружение и местную фауну.
Ваши навыки выживания на высоте.
]],
	weapons = {},
	command = 'dovercitizen',
	salary = 6,
	faction = FACTION_CITIZEN,
	rationCount = 1,
	speed = 0.8,
	unlockTime = 1000 * 3600,
	unlockPrice = 4000,
	loyalty = 5,
	canWear = !isSerious,
	appearance =
	{
		{mdl = {
		'models/player/tnb/citizens/male_18_fix.mdl',
		'models/player/tnb/citizens/female_02_fix.mdl',},
		  skins	   = {0,1},
		   bodygroups = {
				[1] = {16},
				[2] = {2,6},
				[3] = {0,1},
				[4] = {0,1,2,3,4},
						}
		},
	},
})

end

if !isIndsutrial1 then 
TEAM_GMAN = rp.addTeam('G-Man', {
	color = Color(148, 0, 211),
	model = "models/player/gman_high.mdl", 
	description = [[
Ты самая настоящая легенда - ты G-Man.
Ты имеешь право присутствовать везде, где только можно
Ведь никто не знает-кто ты...

Вас никто не видит, пока вы сами не начнете взаимодействовать с ними.
]],
	command = 'gman',
	weapons = {'sh_blinkswep'},
	salary = 20,
	faction = FACTION_CITIZEN,
	rationCount = 1,
	unlockTime = 2500 * 3600,
	loyalty = 4,
	CantUseDisguise = true,
    disableDisguise=true,
	noHunger = true,
	admin = 1,
	PlayerSpawn = function(ply) ply:GodEnable(true) end,
})

rp.SetTeamVoices(TEAM_GMAN, {
	{
		label = 'Пробуждение 1',
		sound = 'vo/gman_misc/gman_riseshine.wav', 
		text = 'Проснитесь и пойте, мистер Фриман, проснитесь и пойте.',  
		soundDuration = 6
	},
	{
		label = 'Пробуждение 2',
		sound = 'vo/gman_misc/gman_02.wav', 
		text = 'Не то, чтобы я хотел сказать, что вы спите на работе;',
		soundDuration = 6 
	},
	{
		label = 'Пробуждение 3',
		sound = 'vo/gman_misc/gman_03.wav', 
		text = 'Нужный человек в нужном месте может перевернуть мир.',
		soundDuration = 6
	},
	{
		label = 'Пробуждение 4',
		sound = 'vo/gman_misc/gman_04.wav', 
		text = 'Так что, проснитесь, Мистер Фриман, проснитесь, вас снова ждут великие дела.',
		soundDuration = 6
	},
	{
		label = 'Время 1',
		sound = 'vo/citadel/gman_exit01.wav', 
		text = 'Время, Доктор Фриман?',
		soundDuration = 6
	},
	{
		label = 'Время 2',
		sound = 'vo/citadel/gman_exit02.wav', 
		text = 'Неужели оно вновь пришло?',
		soundDuration = 6
	},
	{
		label = 'Время 3',
		sound = 'vo/citadel/gman_exit03.wav', 
		text = 'Кажется, что вы только прибыли.',
		soundDuration = 6
	},
	{
		label = 'Время 4',
		sound = 'vo/citadel/gman_exit04.wav', 
		text = 'Вы сделали великие дела в столь короткое время.', 
		soundDuration = 6
	},
	{
		label = 'Время 5',
		sound = 'vo/citadel/gman_exit05.wav', 
		text = 'Собственно, вы настолько хороши, что я получил несколько интересных предложений на ваш счет.',
		soundDuration = 6
	},
	{
		label = 'Время 6',
		sound = 'vo/citadel/gman_exit06.wav', 
		text = 'Чем обманывать вас иллюзией выбора, я сам возьму на себя эту привилегию.', 
		soundDuration = 6
	},
	{
		label = 'Время 7',
		sound = 'vo/citadel/gman_exit07.wav', 
		text = 'Я прошу прощения за то, что кажется вам деспотичным навязыванием своей воли, доктор Фримен.', 
		soundDuration = 6
	},
	{
		label = 'Время 8',
		sound = 'vo/citadel/gman_exit08.wav', 
		text = 'Я не вправе сейчас говорить это.', 
		soundDuration = 6
	},
	{
		label = 'Время 9',
		sound = 'vo/citadel/gman_exit09.wav', 
		text = 'Между тем…', 
		soundDuration = 6
	},
	{
		label = 'Время 10',
		sound = 'vo/citadel/gman_exit10.wav', 
		text = '...Здесь я исчезаю.', 
		soundDuration = 6
	},
})
end
hook('OnPlayerChangedTeam', function(ply, prevTeam, t)
	if prevTeam == TEAM_GMAN then
		ply:GodEnable(false)
	end
end)
