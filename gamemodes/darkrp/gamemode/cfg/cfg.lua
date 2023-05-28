
rp.Discount = 1

rp.cfg.ManagerURL = 'https://discord.gg/tAkd8Y99hS'

rp.cfg.MaxPrinters = 3

rp.cfg.MayorKillReward = 6000
rp.cfg.MayorDelay = 300
rp.cfg.MaxArmor = 600
rp.cfg.MaxHealth = 300

rp.cfg.whitelistHandler = 'https://urf.im/hl2rp/propswhitelist.php'

rp.cfg.StartMoney 		= 1000
rp.cfg.StartKarma		= 50

rp.cfg.OrgCost 			= 10000

rp.cfg.HungerRate 		= 1200

rp.cfg.DoorCostMin		= 7
rp.cfg.DoorCostMax 		= 30
rp.cfg.PropertyTax		= 1

rp.cfg.PropLimit 		= 30

rp.cfg.RagdollDelete	= 60

-- Speed
rp.cfg.WalkSpeed 		= 120
rp.cfg.RunSpeed 		= 240

-- Printers
rp.cfg.PrintDelay 		= 60
rp.cfg.PrintAmount = 25
rp.cfg.InkCost 			= 15

-- Hits
rp.cfg.HitExpire		= 600
rp.cfg.HitCoolDown 		= 300
rp.cfg.HitMinCost 		= 500
rp.cfg.HitMaxCost 		= 100000

-- Afk
rp.cfg.AfkDemote 		= (60 * 10) * 1
rp.cfg.AfkPropRemove 	= (60 * 25) * 1
rp.cfg.AfkDoorSell 		= (60 * 30) * 1
rp.cfg.AfkKick			= (60 * 90) * 1

rp.RadioChanels = {}

-- Lotto
rp.cfg.MinLotto 		= 100
rp.cfg.MaxLotto 		= 5000

rp.cfg.DefaultLaws 		= [[
** Законы Сity 17 **

- Ампутация: Проникновение в сектор D6,Сотрудничество с сопротивлением,
Оружие.
- Карцер: Нелегальные вещи,
проникновение в Нексус, лозунги против Гражданской Обороны.
- Перевоспитание: Непослушание, бег,
электронные сигареты.
]]

rp.cfg.DisallowDrop = {
	arrest_stick 	= true,
	door_ram 		= true,
	gmod_camera 	= true,
	gmod_tool 		= true,
	keys 			= true,
	med_kit 		= true,
	pocket 			= true,
	stunstick 		= false,
	unarrest_stick 	= false,
	weapon_keypadchecker = true,
	weapon_physcannon = true,
	weapon_physgun 	= true,
	weaponchecker 	= true,
	weapon_fists 	= true
}

rp.cfg.IDCard = rp.cfg.IDCard or {
	statuses = {
		[0] = "Нищий",
		[3000] = "Бедный",
		[50000] = "Среднее",
		[90000] = "Выше среднего",
		[190000] = "Зажиточный",
		[550000] = "Богат"
	},
	-- "NICK показал документ под номером NUM LOYALITY. Благосостояние: STATUS"
	text = "%s показал документ под номером %s %s. Благосостояние: %s"
}

rp.cfg.FoodSystem = {
    Faction = {},
    Loyalty = {
        [1] = "urf_foodsystem_ration_normal",
        [2] = "urf_foodsystem_ration_normal",
        [3] = "urf_foodsystem_ration_expanded",
        [4] = "urf_foodsystem_ration_expanded",
    },
}

rp.cfg.ServerUniqID = 'hl2_alyx'
rp.cfg.ServerUID             = "hl2rp_alyx";

rp.cfg.GreenZones = {
	rp_c18_divrp = {
		--{Vector(638, 2854, 1094), Vector(1581, 3906, 1693),},
	},
	rp_industrial17_urfim = {
	--	{Vector(5104, 4720, 328), Vector(6372, 5535, 466),}
	},
	rp_city17_urfim = {
	},
	rp_mk_city17_urfim = {
	},
}
rp.cfg.SpawnPoints = {}

function rp.AddSpawnPoint(name, t)
	t = t[game.GetMap()]
	if t then
		local id = #rp.cfg.SpawnPoints+1
		rp.cfg.SpawnPoints[id] = {
			Name = name,
			Spawns = t.Spawns,
			Model = t.Model,
			Pos = t.Pos,
			Ang = t.Ang,
			ID = id
		}
		return id
	end
	return 0
end

rp.cfg.DefaultWeapons = {
	'weapon_hands',
	'weapon_physgun',
	'gmod_tool',
	'keys',
	'pocket',
}

rp.cfg.SpaycanRefill = 50

rp.cfg.Static = {
	rp_city17_urfim  = {
		{
			mdl = 'models/props_lab/blastdoor001b.mdl',
			pos = Vector(-11218.671875, 11832.563477, 28.732141),
			ang = Angle(-89.998, -179.992, 180.000),
			mat = 'phoenix_storms/metalfence004a',
		},
		{
			mdl = 'models/props_c17/gate_door01a.mdl',
			pos = Vector(-9740.323242, 12600.328125, -743.648743),
			ang = Angle(0.000, 90.000, -0.000),
			mat = '',
		}
	}
}
rp.cfg.MaterialOverride = {
	rp_city17_urfim  = {
		{'logos/sup', 'https://pp.vk.me/c625727/v625727756/104e5/K5FpATRXJxw.jpg'},
	//	{'logos/sup', 'http://skr.su/var/files/125027.jpg/uploaded-files/125027/1462495685.6679.252957962.jpg'}, -- 9 мая
	}
}
rp.cfg.Dumpsters = {
	["rp_city17_urfim "] = {
		{Vector(-4468, 4635, -71), Angle(0,-90,0)},
		{Vector(1821, -2261, -119), Angle(0, -180, 0)},
		{Vector(-2264, -3355, 281), Angle(0, -90, 0)},
		{Vector(-2562, -1968, -119), Angle(0, 90, 0)},
	},
}
rp.cfg.CopShops = {
	rp_city17_urfim  = {
		Pos = Vector(-3263, 8784, 640),
		Ang = Angle(0, -149, 0),
	}
}
rp.cfg.DrugBuyers = {
	rp_city17_urfim  = {
		Pos = Vector(-3263, 8784, 640),
		Ang = Angle(0, -149, 0),
	}
}
rp.cfg.Arcades = {
	rp_city17_urfim  = {
	Pos = Vector(-3263, 8784, 640),
	Ang = Angle(0, -149, 0),
	}
}

rp.cfg.Forcefields = {
	rp_city17_urfim  = {}
}

rp.cfg.VendingMachinesNPC = {
	rp_city17_urfim  = {
		{
			Pos = Vector(-2271.734131, 874.188477, 48.267384),
			Ang = Angle(0.000, -90.000, 0.000),
			NPCPos = Vector(-2204.442139, 857.604004, 0.031250),
			NPCAng = Angle(0.000, 237.447, 0.000),
		}
	}
}
rp.cfg.Scenes = {
	rp_city17_urfim  = {
		{
			Model = 'models/breen.mdl',
			Pos = Vector(1290.500122, 3803.964355, 47.433594),
			Ang = Angle(0.000, 180.000, 0.000),
			Scene = "scenes/breencast/collaboration.vcd",
			Delay = 15
		},
	},	
}
rp.cfg.ScannerSpawns = {
	rp_city17_urfim  = {
		{Vector(4776, 3418, 681), Angle(0, -180, 0)},
		{Vector(4755, 3730, 681), Angle(0, -180, 0)}
	},
}
rp.cfg.VendingMachines = {
	rp_city17_urfim  = {}
}
rp.cfg.RationDispenser = {
	rp_city17_urfim  = {}
}
rp.cfg.RationDispenserHuge = {
	rp_city17_urfim  = {}
}
rp.cfg.CombineLocks = {
	rp_city17_urfim  = {}
}

-- Spawn
rp.cfg.SpawnDisallow = {
	prop_physics		= true,
	media_radio 		= true,
	media_tv 			= true,
	ent_textscreen 		= true,
	ent_picture 		= true,
	gmod_rtcameraprop	= true,
	metal_detector		= true,
	flag 				= true,
}

local isSerious = game.GetMap("netu_off_net_no_obrubleno_map_drugoe_nigga_pigga_snigga_digga_varus_barus_cock_ass_nigga_fat_balls_dog.bsp")
if !isSerious then isSerious = false end
rp.cfg.Spawns = {
	rp_city17_urfim  = {
		Vector(102, 422, -196), -- bottom upper left corner
		Vector(1640, -872, 393),  -- top lower right corner 
	},
}

rp.cfg.TeamSpawns = rp.cfg.TeamSpawns or {
	rp_city17_urfim  = {}
}
-- Stamina
rp.cfg.MaxStamina = isSerious && 70 || 50
rp.cfg.StaminaRestoreTime = 30
rp.cfg.ZombieReward = 50

SPAWN_RESTAURANT = rp.AddSpawnPoint('Кафе', {
	rp_city17_urfim  = {
		Spawns = {
			Vector(-2465.945068,-8110.797852,40.031250),
			Vector(-2543.021484,-8112.385742,40.031250),
			Vector(-2594.904053,-8113.454102,40.031250),
			Vector(-2596.899414,-8011.494141,40.031250),
			Vector(-2536.019043,-8010.240234,40.031250),
			Vector(-2466.140869,-8008.800781,40.031250),
		},
		Model = "models/Humans/Group01/Female_04.mdl",
		Pos = Vector(-2508.006348,-7517.253418,80.031250),
		Ang = Angle(0, 180, 0),
	},
})

SPAWN_BUNKER = rp.AddSpawnPoint('Бункер', {
	rp_city17_urfim  = {
		Spawns = {
			Vector(-632.210754,5782.363281,-465.968750),
			Vector(-627.622559,5670.012207,-465.968750),
			Vector(-623.533813,5563.905273,-465.968750),
			Vector(-684.386108,5561.559082,-465.968750),
			Vector(-688.672546,5672.879883,-465.968750),
			Vector(-692.820313,5780.502441,-465.968750),
		},
		Model = "models/Humans/Group01/Female_04.mdl",
		Pos = Vector(-743.968750,5558.068848,-465.968750),
		Ang = Angle(0, 0, 0),
	},
})

SPAWN_D6 = rp.AddSpawnPoint('D6', {
	rp_city17_urfim = {
		Spawns = {
			Vector(-4506.691406,-6015.672363,80.031250),
			Vector(-4496.379395,-6140.284668,80.031250),
			Vector(-4496.830078,-6228.174316,80.031250),
			Vector(-4570.321289,-6228.513184,80.031250),
		},
		Model = "models/Humans/Group01/Female_04.mdl",
		Pos = Vector(-4407.968750,-4595.382813,76.031250),
		Ang = Angle(0, 180, 0),
	},
})

SPAWN_DVOR = rp.AddSpawnPoint('Двор', {
	rp_city17_urfim = {
		Spawns = {
			Vector(-3680, 11525, 640),
			Vector(-3584, 11523, 636),
			Vector(-3477, 11514, 636),
			Vector(-3368, 11501, 640),
			Vector(-3524, 11672, 636),
			Vector(-3244, 11743, 669),
		},
		Model = "models/Humans/Group01/Female_04.mdl",
		Pos = Vector(-3263, 8784, 640),
		Ang = Angle(0, -149, 0),
	},
})

SPAWN_TRAIN = rp.AddSpawnPoint('Поезд', {
	rp_city17_urfim = {
		Spawns = {
			Vector(-4684.192871,-303.446259,48.031250),
			Vector(-4685.877441,-196.188049,48.031250),
			Vector(-4550.905762,-194.071106,48.031250),
			Vector(-4549.040039,-312.820496,48.031250),
			Vector(-4434.491211,-311.023834,48.031250),
			Vector(-4436.354492,-192.453308,48.031250),
		},
		Model = "models/Humans/Group01/Female_04.mdl",
		Pos = Vector(-3263, 8784, 640),
		Ang = Angle(0, -149, 0),
	},
})

SPAWN_NEXUS = rp.AddSpawnPoint('Нексус', {
	rp_city17_urfim = {
		Spawns = {
			Vector(6497.427246,-1412.783691,4156.031250),
			Vector(6325.881348,-1834.920532,4156.031250),
			Vector(5713.220215,-1058.832764,4156.911133),
		},
		Model = "models/Humans/Group01/Female_04.mdl",
		Pos = Vector(5679.037109,-928.030457,4156.031250),
		Ang = Angle(0, -90, 0),
	},
})

rp.cfg.DefaultSpawnPoints = {
}

rp.cfg.SpawnPos = {
	rp_city17_urfim = {
		Vector(-3598.748291,-201.331543,48.031250), 
		Vector(-3597.135986,-292.811859,48.031250), 
        Vector(-4041.913330,-295.828796,48.031250), 
		Vector(-4044.740723,-187.646194,48.031250),
		Vector(-4489.057617,-203.720566,48.031250),
		Vector(-4534.450684,-315.901550,48.031250),
		Vector(-3167.226563,-99.505379,48.031250),
		Vector(-3183.401367,-581.856262,48.031250),
	},
}

-- Jail
rp.cfg.WantedTime		= 180
rp.cfg.WarrantTime		= 180
rp.cfg.ArrestTimeMin 	= 60
rp.cfg.ArrestTimeMax 	= 400

rp.cfg.Jails = {
	rp_city17_urfim = {
		Vector(-3057, -641, -200),
		Vector(-2198, 425, 200),
	},
}
rp.cfg.JailPos = {
	rp_city17_urfim = {
		
	}
}
-- Theater
rp.cfg.Theaters = {
	rp_city17_urfim = {
		Screen = {
			Pos = Vector(2999, -6703,230),
			Ang = Angle(0,270,90),
			Scale = 0.12
		},
		Projector = {
			Pos = Vector(2058, 6738, -1068),
			Ang = Angle(-0.000, -179.999, 0.000),
		},
		Area = {
			Vector(2588, -7100, 0),
			Vector(3006, -6590, 294),
		}
	}
}

rp.cfg.DefaultVoices = {
	{
		label = 'Привет', // кнопка в меню
		sound = 'vo/npc/male01/hi01.wav', 
		text = 'Привет.' // текст в чате
	},
	{
		label = 'Да',
		sound = 'vo/npc/male01/yeah02.wav',
		text = 'Да!',
	},
	{
		label = 'Нет',
		sound = 'vo/npc/male01/no01.wav',
		text = 'Нет!',
	},
	{
		label = 'Хорошо',
		sound = 'vo/npc/male01/ok01.wav',
		text = 'Хорошо.'
	},
	{
		label = 'Отлично',
		sound = 'vo/npc/male01/nice.wav',
		text = 'Отлично.'
	},
	{
		label = 'Вперёд',
		sound = 'vo/npc/male01/letsgo01.wav',
		text = 'Вперёд!'
	},
	{
		label = 'Я ранен',
		sound = 'vo/npc/male01/imhurt01.wav',
		text = 'Я ранен!'
	},
	{
		label = 'Извини',
		sound = 'vo/npc/male01/sorry01.wav',
		text = 'Извини.'
	},
	{
		label = 'В укрытие',
		sound = 'vo/npc/male01/takecover02.wav',
		text = 'В укрытие!'
	},
	{
		label = 'Осторожно',
		sound = 'vo/npc/male01/watchout.wav',
		text = 'Осторожно!',
	},
	{
		label = 'Убирайся',
		sound = 'vo/npc/male01/gethellout.wav',
		text = 'Убирайся!'
	},
	{
		label = 'Есть один',
		sound = 'vo/npc/male01/gotone01.wav',
		text = 'Есть один!',
	},
	{
		label = 'Помогите',
		sound = 'vo/npc/male01/help01.wav',
		text = 'Помогите!',
	},
	{
		label = 'Воина не кончится',
		sound = 'cit/question01.wav',
		text = 'Эта война вообще, похоже, не кончится.',
	},
	{
		label = 'Свобода',
		sound = 'cit/question07.wav',
		text = 'Чувствуешь? Это свобода!',
	},
	{
		label = 'Мало шансов',
		sound = 'cit/question21.wav',
		text = 'Я конечно не игрок, но шансов у нас мало...',
	},
	{
		label = 'Хуже и хуже',
		sound = 'cit/question12.wav',
		text = 'Мне сдается, что все идет только хуже и хуже!',
	},
	{
		label = 'Смысл был',
		sound = 'cit/vanswer09.wav',
		text = 'В этом почти был смысл...',
	},
	{
		label = 'Женюсь',
		sound = 'cit/question29.wav',
		text = 'Когда все кончится, я женюсь!',
	},
	{
		label = 'Альянс лучше',
		sound = 'cit/cit_remarks20.wav',
		text = 'Верите или нет, но при Альянсе мне было лучше...',
	},
	{
		label = 'Не крабы',
		sound = 'cit/cit_remarks19.wav',
		text = 'Хоть они и зовутся крабами, но на вкус совсем не похожи.',
	},
}


-- Automated announcements
rp.cfg.AnnouncementDelay = 0
rp.cfg.Announcements = {}

rp.cfg.OrgBannerUrl = 'http://api.urf.im/handler/orgs_banner.php?sv=' .. rp.cfg.ServerUID
rp.cfg.whitelistHandler = 'http://api.urf.im/handler/props_whitelist.php?sv=' .. rp.cfg.ServerUID

rp.cfg.WhitelistedProps = [[ [{"Model":"models/balloons/balloon_classicheart.mdl"}, {"Model":"models/balloons/balloon_dog.mdl"}, {"Model":"models/balloons/balloon_star.mdl"}, {"Model":"models/cmz/combinev1.mdl"}, {"Model":"models/cmz/combinev10.mdl"}, {"Model":"models/cmz/combinev11.mdl"}, {"Model":"models/cmz/combinev12.mdl"}, {"Model":"models/cmz/combinev13.mdl"}, {"Model":"models/cmz/combinev14.mdl"}, {"Model":"models/cmz/combinev15.mdl"}, {"Model":"models/cmz/combinev16.mdl"}, {"Model":"models/cmz/combinev17.mdl"}, {"Model":"models/cmz/combinev2.mdl"}, {"Model":"models/cmz/combinev4.mdl"}, {"Model":"models/cmz/combinev5.mdl"}, {"Model":"models/cmz/combinev6.mdl"}, {"Model":"models/cmz/combinev7.mdl"}, {"Model":"models/cmz/combinev8.mdl"}, {"Model":"models/cmz/combinev9.mdl"}, {"Model":"models/cmz/combine_big1.mdl"}, {"Model":"models/cmz/combine_big10.mdl"}, {"Model":"models/cmz/combine_big11.mdl"}, {"Model":"models/cmz/combine_big12.mdl"}, {"Model":"models/cmz/combine_big13.mdl"}, {"Model":"models/cmz/combine_big14.mdl"}, {"Model":"models/cmz/combine_big15.mdl"}, {"Model":"models/cmz/combine_big16.mdl"}, {"Model":"models/cmz/combine_big17.mdl"}, {"Model":"models/cmz/combine_big2.mdl"}, {"Model":"models/cmz/combine_big4.mdl"}, {"Model":"models/cmz/combine_big5.mdl"}, {"Model":"models/cmz/combine_big6.mdl"}, {"Model":"models/cmz/combine_big7.mdl"}, {"Model":"models/cmz/combine_big8.mdl"}, {"Model":"models/cmz/combine_big9.mdl"}, {"Model":"models/combinefortification/combinebunkerbothside1.mdl"}, {"Model":"models/combinefortification/combinebunkerfront1.mdl"}, {"Model":"models/combinefortification/combinebunkergate1.mdl"}, {"Model":"models/combinefortification/combinebunkergateshied1.mdl"}, {"Model":"models/combinefortification/combinebunkernosheild.mdl"}, {"Model":"models/combinefortification/combinecheckpointlittle.mdl"}, {"Model":"models/combinefortification/combinegatelittle.mdl"}, {"Model":"models/combinefortification/combineguardcontrol.mdl"}, {"Model":"models/combinefortification/combineguardtower.mdl"}, {"Model":"models/combinefortification/combinehouse.mdl"}, {"Model":"models/combinefortification/combinemobiledefclosev1.mdl"}, {"Model":"models/combinefortification/combinemoibledefence.mdl"}, {"Model":"models/combinefortification/combinevehiculegate.mdl"}, {"Model":"models/combinefortification/combinewallv2.mdl"}, {"Model":"models/combinefortifictaionpack/cbgate02a.mdl"}, {"Model":"models/combinefortifictaionpack/cbroof.mdl"}, {"Model":"models/combinefortifictaionpack/cbwallplate.mdl"}, {"Model":"models/combinefortifictaionpack/combineheavygate01a.mdl"}, {"Model":"models/combinefortifictaionpack/pillard01a.mdl"}, {"Model":"models/combinefortifictaionpack/plate01a.mdl"}, {"Model":"models/combinefortifictaionpack/wall01a.mdl"}, {"Model":"models/combineinteriorpack/cmbarmory02a.mdl"}, {"Model":"models/combineinteriorpack/cmbcheckpoint.mdl"}, {"Model":"models/combineinteriorpack/pillard04a.mdl"}, {"Model":"models/combine_small_tv1c.mdl"}, {"Model":"models/combine_tv1.mdl"}, {"Model":"models/combine_tv2.mdl"}, {"Model":"models/combine_tv_3_1.mdl"}, {"Model":"models/hunter/blocks/cube025x025x025.mdl"}, {"Model":"models/hunter/blocks/cube025x05x025.mdl"}, {"Model":"models/hunter/blocks/cube025x075x025.mdl"}, {"Model":"models/hunter/blocks/cube025x125x025.mdl"}, {"Model":"models/hunter/blocks/cube025x150x025.mdl"}, {"Model":"models/hunter/blocks/cube025x1x025.mdl"}, {"Model":"models/hunter/blocks/cube025x2x025.mdl"}, {"Model":"models/hunter/blocks/cube025x3x025.mdl"}, {"Model":"models/hunter/blocks/cube025x4x025.mdl"}, {"Model":"models/hunter/blocks/cube025x5x025.mdl"}, {"Model":"models/hunter/blocks/cube025x6x025.mdl"}, {"Model":"models/hunter/blocks/cube025x7x025.mdl"}, {"Model":"models/hunter/blocks/cube025x8x025.mdl"}, {"Model":"models/hunter/blocks/cube05x05x025.mdl"}, {"Model":"models/hunter/blocks/cube05x05x05.mdl"}, {"Model":"models/hunter/blocks/cube05x075x025.mdl"}, {"Model":"models/hunter/blocks/cube05x105x05.mdl"}, {"Model":"models/hunter/blocks/cube05x1x025.mdl"}, {"Model":"models/hunter/blocks/cube05x1x05.mdl"}, {"Model":"models/hunter/blocks/cube05x2x025.mdl"}, {"Model":"models/hunter/blocks/cube05x2x05.mdl"}, {"Model":"models/hunter/blocks/cube05x3x025.mdl"}, {"Model":"models/hunter/blocks/cube05x3x05.mdl"}, {"Model":"models/hunter/blocks/cube05x4x025.mdl"}, {"Model":"models/hunter/blocks/cube05x4x05.mdl"}, {"Model":"models/hunter/blocks/cube05x5x025.mdl"}, {"Model":"models/hunter/blocks/cube05x5x05.mdl"}, {"Model":"models/hunter/blocks/cube05x6x025.mdl"}, {"Model":"models/hunter/blocks/cube05x6x05.mdl"}, {"Model":"models/hunter/blocks/cube05x7x025.mdl"}, {"Model":"models/hunter/blocks/cube05x7x05.mdl"}, {"Model":"models/hunter/blocks/cube05x8x025.mdl"}, {"Model":"models/hunter/blocks/cube05x8x05.mdl"}, {"Model":"models/hunter/blocks/cube075x075x025.mdl"}, {"Model":"models/hunter/blocks/cube075x075x075.mdl"}, {"Model":"models/hunter/blocks/cube075x1x025.mdl"}, {"Model":"models/hunter/blocks/cube075x2x025.mdl"}, {"Model":"models/hunter/blocks/cube075x2x075.mdl"}, {"Model":"models/hunter/blocks/cube075x3x025.mdl"}, {"Model":"models/hunter/blocks/cube075x4x025.mdl"}, {"Model":"models/hunter/blocks/cube075x6x025.mdl"}, {"Model":"models/hunter/blocks/cube075x8x025.mdl"}, {"Model":"models/hunter/blocks/cube1x150x1.mdl"}, {"Model":"models/hunter/blocks/cube1x1x025.mdl"}, {"Model":"models/hunter/blocks/cube1x1x1.mdl"}, {"Model":"models/hunter/blocks/cube1x2x025.mdl"}, {"Model":"models/hunter/blocks/cube1x3x025.mdl"}, {"Model":"models/hunter/blocks/cube1x4x025.mdl"}, {"Model":"models/hunter/blocks/cube1x5x025.mdl"}, {"Model":"models/hunter/blocks/cube1x6x025.mdl"}, {"Model":"models/hunter/blocks/cube1x7x025.mdl"}, {"Model":"models/hunter/blocks/cube1x8x025.mdl"}, {"Model":"models/hunter/blocks/cube2x2x025.mdl"}, {"Model":"models/hunter/blocks/cube2x3x025.mdl"}, {"Model":"models/hunter/blocks/cube2x4x025.mdl"}, {"Model":"models/hunter/blocks/cube2x6x025.mdl"}, {"Model":"models/hunter/blocks/cube3x3x025.mdl"}, {"Model":"models/hunter/blocks/cube3x4x025.mdl"}, {"Model":"models/hunter/blocks/cube3x6x025.mdl"}, {"Model":"models/hunter/blocks/cube3x8x025.mdl"}, {"Model":"models/hunter/blocks/cube4x4x025.mdl"}, {"Model":"models/hunter/blocks/cube8x8x05.mdl"}, {"Model":"models/hunter/blocks/cube8x8x1.mdl"}, {"Model":"models/hunter/geometric/hex025x1.mdl"}, {"Model":"models/hunter/geometric/hex1x1.mdl"}, {"Model":"models/hunter/geometric/pent1x1.mdl"}, {"Model":"models/hunter/geometric/tri1x1eq.mdl"}, {"Model":"models/hunter/misc/lift2x2.mdl"}, {"Model":"models/hunter/misc/platehole1x1a.mdl"}, {"Model":"models/hunter/misc/platehole4x4.mdl"}, {"Model":"models/hunter/misc/shell2x2b.mdl"}, {"Model":"models/hunter/misc/shell2x2c.mdl"}, {"Model":"models/hunter/misc/shell2x2d.mdl"}, {"Model":"models/hunter/misc/stair1x1.mdl"}, {"Model":"models/hunter/plates/plate1x1.mdl"}, {"Model":"models/hunter/plates/plate1x2.mdl"}, {"Model":"models/hunter/plates/plate1x3.mdl"}, {"Model":"models/hunter/plates/plate1x4.mdl"}, {"Model":"models/hunter/plates/plate1x5.mdl"}, {"Model":"models/hunter/plates/plate1x6.mdl"}, {"Model":"models/hunter/plates/plate1x7.mdl"}, {"Model":"models/hunter/plates/plate1x8.mdl"}, {"Model":"models/hunter/plates/plate2x2.mdl"}, {"Model":"models/hunter/plates/plate2x3.mdl"}, {"Model":"models/hunter/plates/plate2x4.mdl"}, {"Model":"models/hunter/plates/plate2x5.mdl"}, {"Model":"models/hunter/plates/plate3x3.mdl"}, {"Model":"models/hunter/plates/plate3x4.mdl"}, {"Model":"models/hunter/plates/plate3x5.mdl"}, {"Model":"models/hunter/plates/plate3x6.mdl"}, {"Model":"models/hunter/plates/plate4x4.mdl"}, {"Model":"models/hunter/plates/plate5x5.mdl"}, {"Model":"models/hunter/plates/platehole1x1.mdl"}, {"Model":"models/hunter/plates/platehole1x2.mdl"}, {"Model":"models/hunter/plates/platehole2x2.mdl"}, {"Model":"models/hunter/plates/platehole3.mdl"}, {"Model":"models/hunter/triangles/025x025.mdl"}, {"Model":"models/hunter/triangles/025x025mirrored.mdl"}, {"Model":"models/hunter/triangles/05x05.mdl"}, {"Model":"models/hunter/triangles/05x05mirrored.mdl"}, {"Model":"models/hunter/triangles/075x075.mdl"}, {"Model":"models/hunter/triangles/075x075mirrored.mdl"}, {"Model":"models/hunter/triangles/1x05x1.mdl"}, {"Model":"models/hunter/triangles/1x1.mdl"}, {"Model":"models/hunter/triangles/1x1mirrored.mdl"}, {"Model":"models/hunter/triangles/1x1x1.mdl"}, {"Model":"models/hunter/triangles/1x1x5.mdl"}, {"Model":"models/hunter/triangles/2x2.mdl"}, {"Model":"models/hunter/triangles/2x2mirrored.mdl"}, {"Model":"models/hunter/triangles/3x3.mdl"}, {"Model":"models/hunter/triangles/3x3mirrored.mdl"}, {"Model":"models/hunter/triangles/4x4.mdl"}, {"Model":"models/hunter/triangles/4x4mirrored.mdl"}, {"Model":"models/hunter/triangles/5x5.mdl"}, {"Model":"models/hunter/tubes/circle2x2.mdl"}, {"Model":"models/hunter/tubes/circle2x2b.mdl"}, {"Model":"models/hunter/tubes/circle2x2c.mdl"}, {"Model":"models/hunter/tubes/circle2x2d.mdl"}, {"Model":"models/hunter/tubes/circle4x4.mdl"}, {"Model":"models/hunter/tubes/tube1x1x1.mdl"}, {"Model":"models/hunter/tubes/tube1x1x1b.mdl"}, {"Model":"models/hunter/tubes/tube1x1x1c.mdl"}, {"Model":"models/hunter/tubes/tube1x1x2.mdl"}, {"Model":"models/hunter/tubes/tube1x1x2b.mdl"}, {"Model":"models/hunter/tubes/tube1x1x2c.mdl"}, {"Model":"models/hunter/tubes/tube1x1x3.mdl"}, {"Model":"models/hunter/tubes/tube1x1x3c.mdl"}, {"Model":"models/hunter/tubes/tube1x1x4.mdl"}, {"Model":"models/hunter/tubes/tube1x1x4c.mdl"}, {"Model":"models/hunter/tubes/tube1x1x4d.mdl"}, {"Model":"models/hunter/tubes/tube1x1x5.mdl"}, {"Model":"models/hunter/tubes/tube1x1x5b.mdl"}, {"Model":"models/hunter/tubes/tube1x1x5c.mdl"}, {"Model":"models/hunter/tubes/tube1x1x5d.mdl"}, {"Model":"models/hunter/tubes/tube1x1x6.mdl"}, {"Model":"models/hunter/tubes/tube1x1x6b.mdl"}, {"Model":"models/hunter/tubes/tube1x1x6c.mdl"}, {"Model":"models/hunter/tubes/tube1x1x6d.mdl"}, {"Model":"models/hunter/tubes/tube1x1x8.mdl"}, {"Model":"models/hunter/tubes/tube1x1x8b.mdl"}, {"Model":"models/hunter/tubes/tube1x1x8c.mdl"}, {"Model":"models/hunter/tubes/tube1x1x8d.mdl"}, {"Model":"models/hunter/tubes/tube2x2x+.mdl"}, {"Model":"models/hunter/tubes/tube2x2x025.mdl"}, {"Model":"models/hunter/tubes/tube2x2x025c.mdl"}, {"Model":"models/hunter/tubes/tube2x2x05.mdl"}, {"Model":"models/hunter/tubes/tube2x2x05b.mdl"}, {"Model":"models/hunter/tubes/tube2x2x05c.mdl"}, {"Model":"models/hunter/tubes/tube2x2x05d.mdl"}, {"Model":"models/hunter/tubes/tube2x2x1.mdl"}, {"Model":"models/hunter/tubes/tube2x2x1b.mdl"}, {"Model":"models/hunter/tubes/tube2x2x1c.mdl"}, {"Model":"models/hunter/tubes/tube2x2x1d.mdl"}, {"Model":"models/hunter/tubes/tube2x2x2.mdl"}, {"Model":"models/hunter/tubes/tube2x2x2b.mdl"}, {"Model":"models/hunter/tubes/tube2x2x2c.mdl"}, {"Model":"models/hunter/tubes/tube2x2x2d.mdl"}, {"Model":"models/hunter/tubes/tube2x2x4.mdl"}, {"Model":"models/hunter/tubes/tube2x2x4b.mdl"}, {"Model":"models/hunter/tubes/tube2x2x4c.mdl"}, {"Model":"models/hunter/tubes/tube2x2x4d.mdl"}, {"Model":"models/hunter/tubes/tube2x2x8.mdl"}, {"Model":"models/hunter/tubes/tube2x2x8b.mdl"}, {"Model":"models/hunter/tubes/tube2x2x8c.mdl"}, {"Model":"models/hunter/tubes/tube2x2x8d.mdl"}, {"Model":"models/hunter/tubes/tube2x2xt.mdl"}, {"Model":"models/hunter/tubes/tube2x2xta.mdl"}, {"Model":"models/hunter/tubes/tube2x2xtb.mdl"}, {"Model":"models/hunter/tubes/tube4x4x05.mdl"}, {"Model":"models/hunter/tubes/tube4x4x05b.mdl"}, {"Model":"models/hunter/tubes/tube4x4x05c.mdl"}, {"Model":"models/hunter/tubes/tube4x4x1.mdl"}, {"Model":"models/hunter/tubes/tube4x4x1b.mdl"}, {"Model":"models/hunter/tubes/tube4x4x1c.mdl"}, {"Model":"models/hunter/tubes/tube4x4x1d.mdl"}, {"Model":"models/hunter/tubes/tube4x4x1to2x2.mdl"}, {"Model":"models/hunter/tubes/tube4x4x2b.mdl"}, {"Model":"models/hunter/tubes/tube4x4x2c.mdl"}, {"Model":"models/hunter/tubes/tube4x4x2d.mdl"}, {"Model":"models/hunter/tubes/tubebend1x1x90.mdl"}, {"Model":"models/hunter/tubes/tubebend1x2x90b.mdl"}, {"Model":"models/hunter/tubes/tubebend2x2x90.mdl"}, {"Model":"models/hunter/tubes/tubebend2x2x90outer.mdl"}, {"Model":"models/hunter/tubes/tubebend2x2x90square.mdl"}, {"Model":"models/hunter/tubes/tubebendinsidesquare2.mdl"}, {"Model":"models/hunter/tubes/tubebendoutsidesquare.mdl"}, {"Model":"models/hunter/tubes/tubebendoutsidesquare2.mdl"}, {"Model":"models/items/357ammo.mdl"}, {"Model":"models/items/ammocrate_ar2.mdl"}, {"Model":"models/items/ammocrate_grenade.mdl"}, {"Model":"models/items/ammocrate_rockets.mdl"}, {"Model":"models/items/boxmrounds.mdl"}, {"Model":"models/mechanics/gears2/pinion_20t1.mdl"}, {"Model":"models/mechanics/gears2/pinion_20t2.mdl"}, {"Model":"models/mechanics/gears2/pinion_20t3.mdl"}, {"Model":"models/mechanics/solid_steel/box_beam_4.mdl"}, {"Model":"models/mechanics/solid_steel/i_beam_4.mdl"}, {"Model":"models/military/boothwindow.mdl"}, {"Model":"models/military/doorframe.mdl"}, {"Model":"models/military/glasspane.mdl"}, {"Model":"models/military/metalcover.mdl"}, {"Model":"models/military/metalstairs.mdl"}, {"Model":"models/military/platform1.mdl"}, {"Model":"models/military/platform2.mdl"}, {"Model":"models/military/platform3.mdl"}, {"Model":"models/military/platform4.mdl"}, {"Model":"models/military/platform5.mdl"}, {"Model":"models/military/railing128.mdl"}, {"Model":"models/military/stairset.mdl"}, {"Model":"models/military/windowbig.mdl"}, {"Model":"models/nova/chair_wood01.mdl"}, {"Model":"models/phxtended/tri1x1x1solid.mdl"}, {"Model":"models/phxtended/tri2x1x2solid.mdl"}, {"Model":"models/phxtended/tri2x2x2solid.mdl"}, {"Model":"models/props/door1.mdl"}, {"Model":"models/props/door2.mdl"}, {"Model":"models/props/door4.mdl"}, {"Model":"models/props/door5.mdl"}, {"Model":"models/props/fence1.mdl"}, {"Model":"models/props/fence2.mdl"}, {"Model":"models/props/fence3.mdl"}, {"Model":"models/props/fence5.mdl"}, {"Model":"models/props/fence6.mdl"}, {"Model":"models/props/fence7.mdl"}, {"Model":"models/props/fence8.mdl"}, {"Model":"models/props/fence9.mdl"}, {"Model":"models/props/floor3.mdl"}, {"Model":"models/props/floor3_quarter.mdl"}, {"Model":"models/props/foundation01.mdl"}, {"Model":"models/props/platform3.mdl"}, {"Model":"models/props/roof1.mdl"}, {"Model":"models/props/roof3.mdl"}, {"Model":"models/props/roof_grate1.mdl"}, {"Model":"models/props/stairhalf.mdl"}, {"Model":"models/props/stair_pref1.mdl"}, {"Model":"models/props/stair_pref2.mdl"}, {"Model":"models/props/storefront.mdl"}, {"Model":"models/props/wall10.mdl"}, {"Model":"models/props/wall3.mdl"}, {"Model":"models/props/wall4.mdl"}, {"Model":"models/props/wall5.mdl"}, {"Model":"models/props/wall6.mdl"}, {"Model":"models/props/wall7.mdl"}, {"Model":"models/props/wall8.mdl"}, {"Model":"models/props/wallcap4.mdl"}, {"Model":"models/props/wallcap5.mdl"}, {"Model":"models/props/wallcap6.mdl"}, {"Model":"models/props/wallcap7.mdl"}, {"Model":"models/props/wallcap8.mdl"}, {"Model":"models/props/wallcap9.mdl"}, {"Model":"models/props/window1.mdl"}, {"Model":"models/props/window2.mdl"}, {"Model":"models/props/window3.mdl"}, {"Model":"models/props/window4.mdl"}, {"Model":"models/props/window5.mdl"}, {"Model":"models/props_borealis/bluebarrel001.mdl"}, {"Model":"models/props_borealis/borealis_door001a.mdl"}, {"Model":"models/props_borealis/mooring_cleat01.mdl"}, {"Model":"models/props_c17/bench01a.mdl"}, {"Model":"models/props_c17/briefcase001a.mdl"}, {"Model":"models/props_c17/cashregister01a.mdl"}, {"Model":"models/props_c17/chair02a.mdl"}, {"Model":"models/props_c17/chair_kleiner03a.mdl"}, {"Model":"models/props_c17/chair_office01a.mdl"}, {"Model":"models/props_c17/chair_stool01a.mdl"}, {"Model":"models/props_c17/computer01_keyboard.mdl"}, {"Model":"models/props_c17/display_cooler01a.mdl"}, {"Model":"models/props_c17/door01_left.mdl"}, {"Model":"models/props_c17/door02_double.mdl"}, {"Model":"models/props_c17/fence01a.mdl"}, {"Model":"models/props_c17/fence01b.mdl"}, {"Model":"models/props_c17/fence02a.mdl"}, {"Model":"models/props_c17/fence02b.mdl"}, {"Model":"models/props_c17/fence03a.mdl"}, {"Model":"models/props_c17/furniturebed001a.mdl"}, {"Model":"models/props_c17/furniturechair001a.mdl"}, {"Model":"models/props_c17/furniturecouch001a.mdl"}, {"Model":"models/props_c17/furniturecouch002a.mdl"}, {"Model":"models/props_c17/furniturecupboard001a.mdl"}, {"Model":"models/props_c17/furnituredrawer001a.mdl"}, {"Model":"models/props_c17/furnituredrawer001a_chunk01.mdl"}, {"Model":"models/props_c17/furnituredrawer001a_chunk02.mdl"}, {"Model":"models/props_c17/furnituredrawer001a_chunk03.mdl"}, {"Model":"models/props_c17/furnituredrawer001a_chunk05.mdl"}, {"Model":"models/props_c17/furnituredrawer001a_chunk06.mdl"}, {"Model":"models/props_c17/furnituredrawer002a.mdl"}, {"Model":"models/props_c17/furnituredrawer003a.mdl"}, {"Model":"models/props_c17/furnituredresser001a.mdl"}, {"Model":"models/props_c17/furniturefridge001a.mdl"}, {"Model":"models/props_c17/furnituremattress001a.mdl"}, {"Model":"models/props_c17/furnitureradiator001a.mdl"}, {"Model":"models/props_c17/furnitureshelf001a.mdl"}, {"Model":"models/props_c17/furnitureshelf001b.mdl"}, {"Model":"models/props_c17/furnitureshelf002a.mdl"}, {"Model":"models/props_c17/furnituresink001a.mdl"}, {"Model":"models/props_c17/furniturestove001a.mdl"}, {"Model":"models/props_c17/furnituretable001a.mdl"}, {"Model":"models/props_c17/furnituretable002a.mdl"}, {"Model":"models/props_c17/furnituretable003a.mdl"}, {"Model":"models/props_c17/furnituretoilet001a.mdl"}, {"Model":"models/props_c17/furniturewashingmachine001a.mdl"}, {"Model":"models/props_c17/gaspipes006a.mdl"}, {"Model":"models/props_c17/gate_door01a.mdl"}, {"Model":"models/props_c17/gravestone001a.mdl"}, {"Model":"models/props_c17/gravestone002a.mdl"}, {"Model":"models/props_c17/gravestone003a.mdl"}, {"Model":"models/props_c17/gravestone004a.mdl"}, {"Model":"models/props_c17/gravestone_coffinpiece001a.mdl"}, {"Model":"models/props_c17/gravestone_coffinpiece002a.mdl"}, {"Model":"models/props_c17/gravestone_cross001b.mdl"}, {"Model":"models/props_c17/lamp001a.mdl"}, {"Model":"models/props_c17/lampshade001a.mdl"}, {"Model":"models/props_c17/lockers001a.mdl"}, {"Model":"models/props_c17/metalladder001.mdl"}, {"Model":"models/props_c17/oildrum001.mdl"}, {"Model":"models/props_c17/playgroundtick-tack-toe_block01a.mdl"}, {"Model":"models/props_c17/playground_teetertoter_seat.mdl"}, {"Model":"models/props_c17/playground_teetertoter_stan.mdl"}, {"Model":"models/props_c17/pottery02a.mdl"}, {"Model":"models/props_c17/pottery03a.mdl"}, {"Model":"models/props_c17/pottery05a.mdl"}, {"Model":"models/props_c17/pottery07a.mdl"}, {"Model":"models/props_c17/pottery08a.mdl"}, {"Model":"models/props_c17/pottery09a.mdl"}, {"Model":"models/props_c17/shelfunit01a.mdl"}, {"Model":"models/props_c17/streetsign001c.mdl"}, {"Model":"models/props_c17/streetsign002b.mdl"}, {"Model":"models/props_c17/streetsign003b.mdl"}, {"Model":"models/props_c17/streetsign004e.mdl"}, {"Model":"models/props_c17/streetsign004f.mdl"}, {"Model":"models/props_c17/streetsign005b.mdl"}, {"Model":"models/props_c17/streetsign005c.mdl"}, {"Model":"models/props_c17/streetsign005d.mdl"}, {"Model":"models/props_c17/suitcase_passenger_physics.mdl"}, {"Model":"models/props_c17/tv_monitor01.mdl"}, {"Model":"models/props_combine/breenbust.mdl"}, {"Model":"models/props_combine/breenchair.mdl"}, {"Model":"models/props_combine/breenclock.mdl"}, {"Model":"models/props_combine/breenconsole.mdl"}, {"Model":"models/props_combine/breendesk.mdl"}, {"Model":"models/props_combine/breenglobe.mdl"}, {"Model":"models/props_combine/breenpod.mdl"}, {"Model":"models/props_combine/breenpod_inner.mdl"}, {"Model":"models/props_combine/cell_01_pod.mdl"}, {"Model":"models/props_combine/cell_01_pod_cheap.mdl"}, {"Model":"models/props_combine/combinebutton.mdl"}, {"Model":"models/props_combine/combine_barricade_bracket01a.mdl"}, {"Model":"models/props_combine/combine_barricade_bracket01b.mdl"}, {"Model":"models/props_combine/combine_barricade_bracket02a.mdl"}, {"Model":"models/props_combine/combine_barricade_bracket02b.mdl"}, {"Model":"models/props_combine/combine_barricade_med01a.mdl"}, {"Model":"models/props_combine/combine_barricade_med01b.mdl"}, {"Model":"models/props_combine/combine_barricade_med02a.mdl"}, {"Model":"models/props_combine/combine_barricade_med02b.mdl"}, {"Model":"models/props_combine/combine_barricade_med02c.mdl"}, {"Model":"models/props_combine/combine_barricade_med03b.mdl"}, {"Model":"models/props_combine/combine_barricade_med04b.mdl"}, {"Model":"models/props_combine/combine_barricade_short01a.mdl"}, {"Model":"models/props_combine/combine_barricade_short02a.mdl"}, {"Model":"models/props_combine/combine_barricade_short03a.mdl"}, {"Model":"models/props_combine/combine_barricade_tall01a.mdl"}, {"Model":"models/props_combine/combine_barricade_tall01b.mdl"}, {"Model":"models/props_combine/combine_barricade_tall03a.mdl"}, {"Model":"models/props_combine/combine_barricade_tall03b.mdl"}, {"Model":"models/props_combine/combine_barricade_tall04a.mdl"}, {"Model":"models/props_combine/combine_barricade_tall04b.mdl"}, {"Model":"models/props_combine/combine_booth_med01a.mdl"}, {"Model":"models/props_combine/combine_booth_short01a.mdl"}, {"Model":"models/props_combine/combine_emitter01.mdl"}, {"Model":"models/props_combine/combine_fence01a.mdl"}, {"Model":"models/props_combine/combine_fence01b.mdl"}, {"Model":"models/props_combine/combine_interface001.mdl"}, {"Model":"models/props_combine/combine_interface002.mdl"}, {"Model":"models/props_combine/combine_interface003.mdl"}, {"Model":"models/props_combine/combine_intmonitor001.mdl"}, {"Model":"models/props_combine/combine_intmonitor003.mdl"}, {"Model":"models/props_combine/combine_intwallunit.mdl"}, {"Model":"models/props_combine/combine_light001a.mdl"}, {"Model":"models/props_combine/combine_light002a.mdl"}, {"Model":"models/props_combine/combine_window001.mdl"}, {"Model":"models/props_combine/headcrabcannister01a.mdl"}, {"Model":"models/props_combine/masterinterface.mdl"}, {"Model":"models/props_combine/railing_128.mdl"}, {"Model":"models/props_combine/railing_256.mdl"}, {"Model":"models/props_combine/railing_512.mdl"}, {"Model":"models/props_combine/railing_corner_inside.mdl"}, {"Model":"models/props_combine/railing_corner_outside.mdl"}, {"Model":"models/props_debris/metal_panel01a.mdl"}, {"Model":"models/props_debris/metal_panel02a.mdl"}, {"Model":"models/props_debris/wall001a_base.mdl"}, {"Model":"models/props_docks/dock01_pole01a_128.mdl"}, {"Model":"models/props_docks/dock01_pole01a_256.mdl"}, {"Model":"models/props_doors/door03_slotted_left.mdl"}, {"Model":"models/props_forest/bunkbed.mdl"}, {"Model":"models/props_forest/bunkbed2.mdl"}, {"Model":"models/props_interiors/bathtub01a.mdl"}, {"Model":"models/props_interiors/furniture_chair03a.mdl"}, {"Model":"models/props_interiors/furniture_couch01a.mdl"}, {"Model":"models/props_interiors/furniture_couch02a.mdl"}, {"Model":"models/props_interiors/furniture_desk01a.mdl"}, {"Model":"models/props_interiors/furniture_lamp01a.mdl"}, {"Model":"models/props_interiors/furniture_shelf01a.mdl"}, {"Model":"models/props_interiors/furniture_vanity01a.mdl"}, {"Model":"models/props_interiors/pot01a.mdl"}, {"Model":"models/props_interiors/pot02a.mdl"}, {"Model":"models/props_interiors/radiator01a.mdl"}, {"Model":"models/props_interiors/refrigerator01a.mdl"}, {"Model":"models/props_interiors/refrigeratordoor01a.mdl"}, {"Model":"models/props_interiors/refrigeratordoor02a.mdl"}, {"Model":"models/props_interiors/sinkkitchen01a.mdl"}, {"Model":"models/props_interiors/vendingmachinesoda01a.mdl"}, {"Model":"models/props_interiors/vendingmachinesoda01a_door.mdl"}, {"Model":"models/props_junk/cardboard_box001a.mdl"}, {"Model":"models/props_junk/cardboard_box001a_gib01.mdl"}, {"Model":"models/props_junk/cardboard_box001b.mdl"}, {"Model":"models/props_junk/cardboard_box002a.mdl"}, {"Model":"models/props_junk/cardboard_box002a_gib01.mdl"}, {"Model":"models/props_junk/cardboard_box002b.mdl"}, {"Model":"models/props_junk/cinderblock01a.mdl"}, {"Model":"models/props_junk/garbage128_composite001b.mdl"}, {"Model":"models/props_junk/garbage128_composite001c.mdl"}, {"Model":"models/props_junk/garbage_milkcarton002a.mdl"}, {"Model":"models/props_junk/glassbottle01a.mdl"}, {"Model":"models/props_junk/glassjug01.mdl"}, {"Model":"models/props_junk/harpoon002a.mdl"}, {"Model":"models/props_junk/metalbucket01a.mdl"}, {"Model":"models/props_junk/metalbucket02a.mdl"}, {"Model":"models/props_junk/metalgascan.mdl"}, {"Model":"models/props_junk/plasticbucket001a.mdl"}, {"Model":"models/props_junk/plasticcrate01a.mdl"}, {"Model":"models/props_junk/popcan01a.mdl"}, {"Model":"models/props_junk/pushcart01a.mdl"}, {"Model":"models/props_junk/ravenholmsign.mdl"}, {"Model":"models/props_junk/shovel01a.mdl"}, {"Model":"models/props_junk/trafficcone001a.mdl"}, {"Model":"models/props_junk/trashbin01a.mdl"}, {"Model":"models/props_junk/trashdumpster02b.mdl"}, {"Model":"models/props_junk/wood_crate001a.mdl"}, {"Model":"models/props_junk/wood_crate001a_damaged.mdl"}, {"Model":"models/props_junk/wood_crate002a.mdl"}, {"Model":"models/props_junk/wood_pallet001a.mdl"}, {"Model":"models/props_lab/bewaredog.mdl"}, {"Model":"models/props_lab/blastdoor001a.mdl"}, {"Model":"models/props_lab/blastdoor001b.mdl"}, {"Model":"models/props_lab/blastdoor001c.mdl"}, {"Model":"models/props_lab/cactus.mdl"}, {"Model":"models/props_lab/desklamp01.mdl"}, {"Model":"models/props_lab/filecabinet02.mdl"}, {"Model":"models/props_lab/frame002a.mdl"}, {"Model":"models/props_lab/harddrive01.mdl"}, {"Model":"models/props_lab/harddrive02.mdl"}, {"Model":"models/props_lab/huladoll.mdl"}, {"Model":"models/props_lab/kennel_physics.mdl"}, {"Model":"models/props_lab/monitor01a.mdl"}, {"Model":"models/props_lab/monitor01b.mdl"}, {"Model":"models/props_lab/monitor02.mdl"}, {"Model":"models/props_lab/reciever01a.mdl"}, {"Model":"models/props_lab/workspace003.mdl"}, {"Model":"models/props_phx/construct/concrete_barrier00.mdl"}, {"Model":"models/props_phx/construct/concrete_barrier01.mdl"}, {"Model":"models/props_phx/construct/glass/glass_angle180.mdl"}, {"Model":"models/props_phx/construct/glass/glass_angle360.mdl"}, {"Model":"models/props_phx/construct/glass/glass_angle90.mdl"}, {"Model":"models/props_phx/construct/glass/glass_curve180x1.mdl"}, {"Model":"models/props_phx/construct/glass/glass_curve180x2.mdl"}, {"Model":"models/props_phx/construct/glass/glass_curve360x1.mdl"}, {"Model":"models/props_phx/construct/glass/glass_curve360x2.mdl"}, {"Model":"models/props_phx/construct/glass/glass_curve90x1.mdl"}, {"Model":"models/props_phx/construct/glass/glass_curve90x2.mdl"}, {"Model":"models/props_phx/construct/glass/glass_dome180.mdl"}, {"Model":"models/props_phx/construct/glass/glass_dome90.mdl"}, {"Model":"models/props_phx/construct/glass/glass_plate1x1.mdl"}, {"Model":"models/props_phx/construct/glass/glass_plate1x2.mdl"}, {"Model":"models/props_phx/construct/glass/glass_plate2x2.mdl"}, {"Model":"models/props_phx/construct/glass/glass_plate2x4.mdl"}, {"Model":"models/props_phx/construct/glass/glass_plate4x4.mdl"}, {"Model":"models/props_phx/construct/metal_angle180.mdl"}, {"Model":"models/props_phx/construct/metal_angle360.mdl"}, {"Model":"models/props_phx/construct/metal_angle90.mdl"}, {"Model":"models/props_phx/construct/metal_dome180.mdl"}, {"Model":"models/props_phx/construct/metal_dome90.mdl"}, {"Model":"models/props_phx/construct/metal_plate1.mdl"}, {"Model":"models/props_phx/construct/metal_plate1x2.mdl"}, {"Model":"models/props_phx/construct/metal_plate1x2_tri.mdl"}, {"Model":"models/props_phx/construct/metal_plate1_tri.mdl"}, {"Model":"models/props_phx/construct/metal_plate2x2.mdl"}, {"Model":"models/props_phx/construct/metal_plate2x2_tri.mdl"}, {"Model":"models/props_phx/construct/metal_plate2x4.mdl"}, {"Model":"models/props_phx/construct/metal_plate2x4_tri.mdl"}, {"Model":"models/props_phx/construct/metal_plate4x4.mdl"}, {"Model":"models/props_phx/construct/metal_plate4x4_tri.mdl"}, {"Model":"models/props_phx/construct/metal_plate_curve.mdl"}, {"Model":"models/props_phx/construct/metal_plate_curve180.mdl"}, {"Model":"models/props_phx/construct/metal_plate_curve180x2.mdl"}, {"Model":"models/props_phx/construct/metal_plate_curve2.mdl"}, {"Model":"models/props_phx/construct/metal_plate_curve2x2.mdl"}, {"Model":"models/props_phx/construct/metal_plate_curve360.mdl"}, {"Model":"models/props_phx/construct/metal_plate_curve360x2.mdl"}, {"Model":"models/props_phx/construct/metal_plate_pipe.mdl"}, {"Model":"models/props_phx/construct/metal_tube.mdl"}, {"Model":"models/props_phx/construct/metal_tubex2.mdl"}, {"Model":"models/props_phx/construct/metal_wire1x1.mdl"}, {"Model":"models/props_phx/construct/metal_wire1x1x1.mdl"}, {"Model":"models/props_phx/construct/metal_wire1x1x2.mdl"}, {"Model":"models/props_phx/construct/metal_wire1x1x2b.mdl"}, {"Model":"models/props_phx/construct/metal_wire1x2.mdl"}, {"Model":"models/props_phx/construct/metal_wire1x2b.mdl"}, {"Model":"models/props_phx/construct/metal_wire1x2x2b.mdl"}, {"Model":"models/props_phx/construct/metal_wire2x2.mdl"}, {"Model":"models/props_phx/construct/metal_wire2x2b.mdl"}, {"Model":"models/props_phx/construct/metal_wire2x2x2b.mdl"}, {"Model":"models/props_phx/construct/metal_wire_angle180x1.mdl"}, {"Model":"models/props_phx/construct/metal_wire_angle180x2.mdl"}, {"Model":"models/props_phx/construct/metal_wire_angle360x1.mdl"}, {"Model":"models/props_phx/construct/metal_wire_angle90x1.mdl"}, {"Model":"models/props_phx/construct/metal_wire_angle90x2.mdl"}, {"Model":"models/props_phx/construct/plastic/plastic_angle_360.mdl"}, {"Model":"models/props_phx/construct/windows/window1x1.mdl"}, {"Model":"models/props_phx/construct/windows/window1x2.mdl"}, {"Model":"models/props_phx/construct/windows/window2x4.mdl"}, {"Model":"models/props_phx/construct/windows/window4x4.mdl"}, {"Model":"models/props_phx/construct/windows/window_angle180.mdl"}, {"Model":"models/props_phx/construct/windows/window_angle360.mdl"}, {"Model":"models/props_phx/construct/windows/window_angle90.mdl"}, {"Model":"models/props_phx/construct/windows/window_curve180x1.mdl"}, {"Model":"models/props_phx/construct/windows/window_curve180x2.mdl"}, {"Model":"models/props_phx/construct/windows/window_curve360x1.mdl"}, {"Model":"models/props_phx/construct/windows/window_curve90x1.mdl"}, {"Model":"models/props_phx/construct/windows/window_curve90x2.mdl"}, {"Model":"models/props_phx/construct/wood/wood_boardx1.mdl"}, {"Model":"models/props_phx/games/chess/black_bishop.mdl"}, {"Model":"models/props_phx/games/chess/black_dama.mdl"}, {"Model":"models/props_phx/games/chess/black_king.mdl"}, {"Model":"models/props_phx/games/chess/black_knight.mdl"}, {"Model":"models/props_phx/games/chess/black_pawn.mdl"}, {"Model":"models/props_phx/games/chess/black_queen.mdl"}, {"Model":"models/props_phx/games/chess/black_rook.mdl"}, {"Model":"models/props_phx/games/chess/white_bishop.mdl"}, {"Model":"models/props_phx/games/chess/white_dama.mdl"}, {"Model":"models/props_phx/games/chess/white_king.mdl"}, {"Model":"models/props_phx/games/chess/white_knight.mdl"}, {"Model":"models/props_phx/games/chess/white_pawn.mdl"}, {"Model":"models/props_phx/games/chess/white_queen.mdl"}, {"Model":"models/props_phx/games/chess/white_rook.mdl"}, {"Model":"models/props_phx/rt_screen.mdl"}, {"Model":"models/props_rooftop/satellitedish02.mdl"}, {"Model":"models/props_trainstation/bench_indoor001a.mdl"}, {"Model":"models/props_trainstation/payphone001a.mdl"}, {"Model":"models/props_trainstation/tracksign02.mdl"}, {"Model":"models/props_trainstation/tracksign07.mdl"}, {"Model":"models/props_trainstation/tracksign08.mdl"}, {"Model":"models/props_trainstation/tracksign09.mdl"}, {"Model":"models/props_trainstation/tracksign10.mdl"}, {"Model":"models/props_trainstation/traincar_seats001.mdl"}, {"Model":"models/props_trainstation/trainstation_clock001.mdl"}, {"Model":"models/props_trainstation/trainstation_post001.mdl"}, {"Model":"models/props_trainstation/trashcan_indoor001a.mdl"}, {"Model":"models/props_trainstation/trashcan_indoor001b.mdl"}, {"Model":"models/props_wasteland/barricade001a.mdl"}, {"Model":"models/props_wasteland/barricade002a.mdl"}, {"Model":"models/props_wasteland/cafeteria_bench001a.mdl"}, {"Model":"models/props_wasteland/cafeteria_table001a.mdl"}, {"Model":"models/props_wasteland/controlroom_chair001a.mdl"}, {"Model":"models/props_wasteland/controlroom_desk001a.mdl"}, {"Model":"models/props_wasteland/controlroom_desk001b.mdl"}, {"Model":"models/props_wasteland/controlroom_filecabinet001a.mdl"}, {"Model":"models/props_wasteland/controlroom_filecabinet002a.mdl"}, {"Model":"models/props_wasteland/controlroom_storagecloset001a.mdl"}, {"Model":"models/props_wasteland/exterior_fence001a.mdl"}, {"Model":"models/props_wasteland/exterior_fence001b.mdl"}, {"Model":"models/props_wasteland/exterior_fence002a.mdl"}, {"Model":"models/props_wasteland/exterior_fence002b.mdl"}, {"Model":"models/props_wasteland/exterior_fence002c.mdl"}, {"Model":"models/props_wasteland/exterior_fence002d.mdl"}, {"Model":"models/props_wasteland/exterior_fence003a.mdl"}, {"Model":"models/props_wasteland/exterior_fence003b.mdl"}, {"Model":"models/props_wasteland/interior_fence001a.mdl"}, {"Model":"models/props_wasteland/interior_fence001b.mdl"}, {"Model":"models/props_wasteland/interior_fence001c.mdl"}, {"Model":"models/props_wasteland/interior_fence001d.mdl"}, {"Model":"models/props_wasteland/interior_fence001e.mdl"}, {"Model":"models/props_wasteland/interior_fence001g.mdl"}, {"Model":"models/props_wasteland/interior_fence002a.mdl"}, {"Model":"models/props_wasteland/interior_fence002b.mdl"}, {"Model":"models/props_wasteland/interior_fence002c.mdl"}, {"Model":"models/props_wasteland/interior_fence002e.mdl"}, {"Model":"models/props_wasteland/interior_fence002f.mdl"}, {"Model":"models/props_wasteland/interior_fence003a.mdl"}, {"Model":"models/props_wasteland/interior_fence003b.mdl"}, {"Model":"models/props_wasteland/interior_fence003d.mdl"}, {"Model":"models/props_wasteland/interior_fence003e.mdl"}, {"Model":"models/props_wasteland/kitchen_counter001a.mdl"}, {"Model":"models/props_wasteland/kitchen_counter001b.mdl"}, {"Model":"models/props_wasteland/kitchen_counter001c.mdl"}, {"Model":"models/props_wasteland/kitchen_fridge001a.mdl"}, {"Model":"models/props_wasteland/kitchen_shelf001a.mdl"}, {"Model":"models/props_wasteland/kitchen_shelf002a.mdl"}, {"Model":"models/props_wasteland/laundry_cart001.mdl"}, {"Model":"models/props_wasteland/laundry_cart002.mdl"}, {"Model":"models/props_wasteland/light_spotlight01_lamp.mdl"}, {"Model":"models/props_wasteland/prison_bedframe001b.mdl"}, {"Model":"models/props_wasteland/prison_celldoor001b.mdl"}, {"Model":"models/props_wasteland/prison_cellwindow002a.mdl"}, {"Model":"models/props_wasteland/prison_heater001a.mdl"}, {"Model":"models/props_wasteland/prison_shelf002a.mdl"}, {"Model":"models/props_wasteland/wood_fence02a.mdl"}, {"Model":"models/rt screens/computer_monitor.mdl"}, {"Model":"models/rt screens/monitor01a.mdl"}, {"Model":"models/rt screens/monitor01b.mdl"}, {"Model":"models/rt screens/monitor02.mdl"}, {"Model":"models/rt screens/tv_monitor01.mdl"}, {"Model":"models/weapons/w_c4_planted.mdl"}] ]]

rp.AtmosphericSounds = { -- todo
    rp_industrial17_urfim = {
        {
            sound = 'music/HL1_song19.mp3',
            pos = {Vector(3975, 1085, 59), Vector(6519, 5538, 1991)}, -- D5
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song1.mp3',
            pos = {Vector(-3690, 6456, -729), Vector(10308, 14090, 1525)}, -- Пляж
            soundLevel = 40,
        },

        {
            sound = 'music/HL2_song27_trainstation2.mp3',
            pos = {Vector(-886, 993, -46), Vector(2399, 2390, 1218)}, -- D1
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song19.mp3',
            pos = {Vector(-4733, 2491, 134), Vector(-559, 3815, 1022)}, -- Вокзал
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song26_trainstation1.mp3',
            pos = {Vector(-276, 2663, -29), Vector(3171, 5776, 1965)}, -- D2
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song0.mp3',
            pos = {Vector(3625, 1165, -308), Vector(3486, 5588, 1894)}, -- D4
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song25_Teleporter.mp3',
            pos = {Vector(2169, 2348, 2962), Vector(3281, 4247, 4288)}, -- кабинет АГ
            soundLevel = 40,
        },
},
    rp_city17_build210 = {
        {
            sound = 'music/HL2_song26_trainstation1.mp3',
            pos = {Vector(-1087, -2159, 33), Vector(1101, 1358, 853)}, -- ГП
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song19.mp3',
            pos = {Vector(-7372, -1646, -167), Vector(-1450, 2007, 1137)}, -- Вокзал
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song1.mp3',
            pos = {Vector(-1242, -4164, -61), Vector(161, -1991, 1109)}, -- D6
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song2.mp3',
            pos = {Vector(451, -6066, -162), Vector(3132, -2121, 1152)}, -- D4
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song23_SuitSong3.mp3',
            pos = {Vector(-5385, -4653, -91), Vector(-1755, -1531, 1210)}, -- Повстанцы
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song27_trainstation2.mp3',
            pos = {Vector(-1602, 1781, 43), Vector(1587, 5944, 1404)}, -- D5
            soundLevel = 40,
        },
        {
            sound = 'music/radio1.mp3',
            pos = {Vector(1833, -2271, -747), Vector(3357, -177, -140)}, -- station15
        },
        {
            sound = 'music/Ravenholm_1.mp3',
            pos = {Vector(-859, 259, -794), Vector(2098, 8740, -196)}, -- Подземка
        },
        {
            sound = 'music/HL2_song25_Teleporter.mp3',
            pos = {Vector(3162, -2938, 3706), Vector(7760, 512, 6582),}, -- кабинет АГ
            soundLevel = 40,
        },
       },
       rp_c18_divrp = {
        {
            sound = 'music/HL2_song26_trainstation1.mp3',
            pos = {Vector(-664, -5384, 578), Vector(2098, -1811, 2841)}, -- Выход вокзал
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song27_trainstation2.mp3',
            pos = {Vector(-1303, -1621, 445), Vector(1094, 138, 2743)}, -- ГП
            soundLevel = 40,
        },
        {
            sound = 'music/Ravenholm_1.mp3',
            pos = {Vector(-3326, 2477, 498), Vector(-1989, 5244, 791)}, -- Метро
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song10.mp3',
            pos = {Vector(-1312, 224, 581), Vector(-735, 1770, 1081)}, -- D6
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song23_SuitSong3.mp3',
            pos = {Vector(-2708, 2994, 850), Vector(-41, 6241, 1164)}, -- Повстанцы
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song19.mp3',
            pos = {Vector(209, 1548, 1164), Vector(2172, 3463, 1872)}, --D5
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song25_Teleporter.mp3',
            pos = {Vector(1184, -1684, 1477), Vector(2158, -13, 1921)}, -- кабинет АГ
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song0.mp3',
            pos = {Vector(1145, -520, 593), Vector(1565, 270, 977)}, -- завод
            soundLevel = 40,
        },
       },
       rp_city8_urfim = {
        {
            sound = 'music/HL2_song19.mp3',
            pos = {Vector(-3210, -1358, -55), Vector(-1727, 268, 755)}, -- Выход вокзал
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song27_trainstation2.mp3',
            pos = {Vector(-1147, 2834, -95), Vector(1587, 4389, 1000)}, -- ГП
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song26_trainstation1.mp3',
            pos = {Vector(-505, 1026, -47), Vector(1991, 1857, 78)}, -- Метро
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song10.mp3',
            pos = {Vector(-507, -1143, -45), Vector(2578, -651, 927)}, -- D6
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song23_SuitSong3.mp3',
            pos = {Vector(2043, -379, -45), Vector(3357, 2308, 606)}, -- Повстанцы
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song19.mp3',
            pos = {Vector(-3775, 2089, -35), Vector(-2189, 3863, 1175)}, --D5
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song0.mp3',
            pos = {Vector(2163, 3484, -47), Vector(2976, 4135, 208)}, -- завод
            soundLevel = 40,
        },
       },
       rp_city17_urfim = {
        {
            sound = 'music/HL2_song26_trainstation1.mp3',
            pos = {Vector(-1087, -2159, 33), Vector(1101, 1358, 853)}, -- ГП
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song19.mp3',
            pos = {Vector(-7372, -1646, -167), Vector(-1450, 2007, 1137)}, -- Вокзал
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song1.mp3',
            pos = {Vector(-1242, -4164, -61), Vector(161, -1991, 1109)}, -- D6
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song2.mp3',
            pos = {Vector(451, -6066, -162), Vector(3132, -2121, 1152)}, -- D4
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song23_SuitSong3.mp3',
            pos = {Vector(-5385, -4653, -91), Vector(-1755, -1531, 1210)}, -- Повстанцы
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song27_trainstation2.mp3',
            pos = {Vector(-1602, 1781, 43), Vector(1587, 5944, 1404)}, -- D5
            soundLevel = 40,
        },
        {
            sound = 'music/radio1.mp3',
            pos = {Vector(1833, -2271, -747), Vector(3357, -177, -140)}, -- station15
        },
        {
            sound = 'music/Ravenholm_1.mp3',
            pos = {Vector(-859, 259, -794), Vector(2098, 8740, -196)}, -- Подземка
        },
        {
            sound = 'music/HL2_song25_Teleporter.mp3',
            pos = {Vector(3162, -2938, 3706), Vector(7760, 512, 6582),}, -- кабинет АГ
            soundLevel = 40,
        },
        {
            sound = 'lu/sound base.mp3',
            pos = {Vector(7678, -855, 1830), Vector(5582, -2385, 3071)}, -- кабинет АГ
            soundLevel = 40,
        },
       },
       rp_whiteforest_urfim = {
        {
            sound = 'back/vlvx_song20.mp3',
            pos = {Vector(1349, -11881, -181), Vector(7501, -4318, 2074)}, -- База ГО
            soundLevel = 40,
        },
        {
            sound = 'back/vlvx_song9.mp3',
            pos = {Vector(-5811, 7310, -409), Vector(-297, 13916, 1848)}, -- База Ребелов
            soundLevel = 40,
        },
        {
            sound = 'back/nectar.mp3',
            pos = {Vector(10671, 1137, 474), Vector(14971, 7915, 3002)}, -- База муравьев
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song2.mp3',
            pos = {Vector(-8701, -4161, -527), Vector(18, 2633, 1758)}, -- Лес (Музыка не подобрана)
            soundLevel = 40,
        },
        {
            sound = 'back/ol07_advisor_00_01_22.wav',
            pos = {Vector(4960, -2737, 33), Vector(6428, -841, 505)}, -- База Зомби
            soundLevel = 40,
        },
       },
       rp_mk_city17_urfim = {
        {
            sound = 'music/HL2_song26_trainstation1.mp3',
            pos = {Vector(-4240, 10375, 4957), Vector(-1997, 8389, 3700)}, -- ГП
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song19.mp3',
            pos = {Vector(-8529, 8194, 4525), Vector(-4663, 11070, 3628)}, -- Вокзал
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song1.mp3',
            pos = {Vector(-5557, 15140, 4701), Vector(-1784, 12778, 3687)}, -- D6
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song2.mp3',
            pos = {Vector(-3505, 5802, 4869), Vector(-8146, 4727, 3680)}, -- D4
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song23_SuitSong3.mp3',
            pos = {Vector(-5020, 14881, 3270), Vector(-2514, 12309, 2467)}, -- Повстанцы
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song27_trainstation2.mp3',
            pos = {Vector(-491, 5271, 4516), Vector(-2653, 6489, 3344)}, -- D5
            soundLevel = 40,
        },
        {
            sound = 'music/Ravenholm_1.mp3',
            pos = {Vector(-1145, 14911, 3412), Vector(1212, 6753, 2389)}, -- Подземка
        },
        {
            sound = 'music/HL2_song25_Teleporter.mp3',
            pos = {Vector(3949, 11164, 6964), Vector(91, 8313, 8921)}, -- кабинет АГ
            soundLevel = 40,
        },
       },
    rp_city17_urfim_v2 = {
        {
            sound = 'music/HL2_song26_trainstation1.mp3',
            pos = {Vector(2722.366943, 1798.420166, 38.406067), Vector(5685, 5126, 1102)}, -- ГП
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song19.mp3',
            pos = {Vector(396.151154, 2726.339600, 38.290874), Vector(2499, 5220, 427)}, -- Вокзал
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song1.mp3',
            pos = {Vector(-1992.933472, -2025.624878, 38.359623), Vector(4082.585938, -251.320801, 764.278809)}, -- D6
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song2.mp3',
            pos = {Vector(2750.378906, 5922.312012, 38.329319), Vector(5862, 9207, 1043)}, -- D4
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song23_SuitSong3.mp3',
            pos = {Vector(-5350, -1788, -275), Vector(-2232, 660, 1015)}, -- Повстанцы
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song27_trainstation2.mp3',
            pos = {Vector(1868, 3885, -1098), Vector(4029, 8931, -302)}, -- Убежище
            soundLevel = 40,
        },
        {
            sound = 'music/HL2_song25_Teleporter.mp3',
            pos = {Vector(7914, 2062, 2214), Vector(8073.741699, 2213.726074, 7193.854492),}, -- кабинет АГ
            soundLevel = 40,
        },
    },
}
