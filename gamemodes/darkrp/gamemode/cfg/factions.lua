FACTION_CITIZEN = rp.AddFaction({name = 'Citizen', printName = 'Гражданские', npcs = {
	rp_city17_urfim = {
		{Vector(-1212.031250,-55.881424,144.031250), Angle(0, -180, 0), 'models/Humans/Group01/Female_04.mdl'}
	}
}})

FACTION_CWU = rp.AddFaction({name = 'CWU', printName = 'ГСР', npcs = {
	rp_city17_urfim = {
		{Vector(-874.370178,1556.031250,136.031250), Angle(0,-90,0), 'models/Humans/Group02/Male_04.mdl'}
	}
}})

FACTION_REBEL = rp.AddFaction({name = 'Rebel', printName = 'Сопротивление', npcs = {
	rp_city17_urfim = {
		{Vector(-904.559631,5936.031250,-465.968750), Angle(0, 90, 0), 'models/Humans/Group03/male_09.mdl'},
	}
}})

FACTION_COMBINE = rp.AddFaction({name = 'Combine', printName = 'MPF', npcs = {
	rp_city17_urfim = {
		{Vector(1365.863647,412.031250,80.031250), Angle(0, -90, 0), 'models/dpfilms/metropolice/playermodels/pm_policetrench_fix.mdl'}
	}
}})

FACTION_OTA = rp.AddFaction({name = 'OTA', printName = 'OTA', npcs = {
	rp_city17_urfim = {
		{Vector(1595.555786,412.031250,80.031250), Angle(0, -90, 0), 'models/player/combine_super_elite_soldier_fix.mdl'}
	}
}})

FACTION_HELIX = rp.AddFaction({name = 'HELIX', printName = 'MPF.HELIX', npcs = {
	rp_city17_urfim = {
		{Vector(1979.940552,206.857437,80.031250), Angle(0, -180, 0), 'models/dpfilms/metropolice/civil_medic.mdl'}
	}
}})

FACTION_DAP = rp.AddFaction({name = 'DAP', printName = 'DAP', npcs = {
	rp_city17_urfim = {
		{Vector(1979.983643,-172.817169,80.031250), Angle(0, -180, 0), 'models/phill/combine_soldier.mdl'}
	}
}})

FACTION_ADMINS = rp.AddFaction({name = 'Admin', printName = 'Администрация', npcs = {
	rp_city17_urfim = {
		{Vector(-91.232323,5.626954,2176.031250), Angle(0, 180, 0), 'models/dpfilms/metropolice/playermodels/pm_badass_police_fix.mdl'}
	}
}})

FACTION_DPF = rp.AddFaction({name = 'DPF', printName = 'Дивизион Blade', npcs = {
	rp_city17_urfim = {
		{Vector(1979.979980,287.139587,80.031250), Angle(0, -180, 0), 'models/dpfilms/metropolice/rtb_police.mdl'}

	}
}})

FACTION_HECU = rp.AddFaction({name = 'HECU', printName = 'ОВСП', npcs = {
	rp_city17_urfim = {
		{Vector(-480.031250,5130.462891,-465.968750), Angle(0, 180, 0), 'models/odessa.mdl'},
	},
}})

FACTION_ZOMBIE = rp.AddFaction({name = 'Zombie', printName = 'Зомби', npcs = {
	rp_city17_urfim = {
		{Vector(2143.996338,4867.285645,-465.968750), Angle(0, 180, 0), 'models/Zombie/Classic.mdl'}
	},
}})

FACTION_REFUGEES = rp.AddFaction({name = 'Refugees', printName = 'Беженцы', npcs = {
	rp_city17_urfim = {
		{Vector(-2570.096680,-7260.031250,80.031250), Angle(0, -90, 0), 'models/Humans/Group02/Female_03.mdl'}
	}
}})

FACTION_OUTLAWS = rp.AddFaction({name = 'Outlaws', printName = 'Изгои', npcs = { 
	rp_city17_urfim = {
		{Vector(703.215027,-1967.985107,80.031250), Angle(0, -90, 0),  'models/player/tnb/citizens/male_10_fix.mdl'},
}
}, 
	OnSpawn = function(ent)
		ent:SetSkin(0)
		ent:SetBodygroup(1, 7)
		ent:SetBodygroup(2, 6)
		ent:SetBodygroup(3, math.random(0,1))
		ent:SetBodygroup(4, math.random(0,1)) 
	end,
})

FACTION_BANDITS = rp.AddFaction({name = 'Bandits', printName = 'Отверженные', npcs = { 
    rp_city17_urfim = {
		{Vector(-2879.679688,-7260.000488,80.031250), Angle(0, -90, 0), 'models/player/tnb/citizens/male_12_fix.mdl'}
	},

}, 
	OnSpawn = function(ent)
		ent:SetSkin(0)
		ent:SetBodygroup(1, 7)
		ent:SetBodygroup(2, 6)
		ent:SetBodygroup(3, 1)
		ent:SetBodygroup(4, 1) 
	end,
})

FACTION_LEGION = rp.AddFaction({name = 'Legion', printName = '9-th Legion', npcs = {
	rp_city17_urfim = {
		{Vector(5301.151855,-739.968750,76.031250), Angle(0, 90, 0),  'models/niik/player/01ar_combine_soldier02_pm_n.mdl'}
	}
}})

FACTION_SUNRISE = rp.AddFaction({name = 'Sunrise', printName = 'Сыны Рассвета', npcs = {
	rp_city17_urfim = {
		{Vector(928, 5707, -466), Angle(0, 178, 0),  'models/player/tfa_kz_helghast_assault.mdl'}
	}
}})

FACTION_ANTIHUMAN = rp.AddFaction({name = 'OTA.Anti-human', printName = 'OTA.Anti-Human', npcs = {
	rp_city17_urfim = {
		{Vector(5816, -2035, 2180), Angle(0, 51, 0), 'models/dpfilms/metropolice/playermodels/pm_police_fragger_fix.mdl'}
	},
}, footstepSound = {
	Sound("npc/metropolice/gear1.wav"),
	Sound("npc/metropolice/gear2.wav"),
	Sound("npc/metropolice/gear3.wav"),
	Sound("npc/metropolice/gear4.wav"),
	Sound("npc/metropolice/gear5.wav"),
	Sound("npc/metropolice/gear6.wav"),
},
	OTARelations = Color(51, 204, 0),
})	

FACTION_BANDITS2 = rp.AddFaction({name = 'Sons of Anarchy', printName = 'Sons of Anarchy', npcs = {
	rp_city17_urfim = {
		{Vector(-5720, -7669, 80), Angle(0, 0, 0), 'models/player/trent/uc_soldier.mdl'},
	},
}, 
	OTARelations = Color(255, 0, 0),
})

FACTION_APETIR = rp.AddFaction({name = 'Aperture Laboratory', printName = 'Aperture Laboratory', npcs = {
	rp_city17_urfim = {
		{Vector(1119, 966, -466), Angle(0, -91, 0), 'models/player/portal/male_02_aperture.mdl'},
	},
}, 
	OTARelations = Color(255, 0, 0),
})

FACTION_LU = rp.AddFaction({name = 'LU', printName = 'Отряд LU', npcs = {
	rp_city17_urfim = {
		{Vector(-3897, -75, 80), Angle(0, 8, 0), 'models/player/arctic.mdl'},
	},
}, 
	OTARelations = Color(255, 0, 0),
})

FACTION_PULP = rp.AddFaction({name = 'SWAT', printName = 'SWAT', npcs = {
	rp_city17_urfim = {
		{Vector(-5577.836426,-5884.031250,80.031250), Angle(0, -90, 0),  'models/player/ct_urban.mdl'}
	},
}})

function PLAYER:IsZombie()
	return self:GetFaction() == FACTION_ZOMBIE
end

function PLAYER:IsCombine()
	return self:GetFaction() == FACTION_COMBINE || self:GetFaction() == FACTION_DPF || self:GetFaction() == FACTION_OTA || self:GetFaction() == FACTION_HELIX || self:Team() == TEAM_KAEF || self:GetFaction() == FACTION_DAP || self:GetFaction() == FACTION_LEGION 
end

function PLAYER:IsCWU()
	return self:GetFaction() == FACTION_CWU
end

function PLAYER:IsOTA()
	return self:GetFaction() == FACTION_OTA
end

function PLAYER:IsRebel()
	return self:GetFaction() == FACTION_REBEL || self:GetFaction() == FACTION_HECU
end

function PLAYER:IsCombinePilot()
	return self:Team() == TEAM_APCCAP || self:Team() == TEAM_APCPILOT 
end

function PLAYER:IsCombineOrDisguised()
	if self:IsDisguised() then
		local faction = rp.teams && rp.teams[self:DisguiseTeam() or 1].faction
		return self:IsCombine(faction)
	else
		return self:IsCombine()
	end
end

rp.cfg.CaptureIncomePerPoint = 10
rp.cfg.CaptureCooldown = 300
rp.cfg.DefaultPointPrice = 0

rp.cfg.CaptureVehicleRespawnDuration = 10

rp.cfg.ConjunctionTimeout = 10

rp.cfg.CaptureFlagSpeed = 50

rp.cfg.CaptureDurationMin = 100
rp.cfg.CaptureDurationMax = 300
rp.cfg.CaptureDurationIncrease = 30



if not rp.cfg.CantCapture then
	rp.cfg.CantCapture = {}
	local teams = {}
	
	if isWhiteForest then
		teams = rp.GetFactionTeamsMap({FACTION_CITIZEN, FACTION_ANGELDARK, FACTION_BANDITS2, FACTION_PMC, FACTION_OTA, FACTION_MERCARI, FACTION_PRIME, FACTION_BSYNDIC, FACTION_MERCARI, FACTION_BANDITS, FACTION_OUTLAWS, FACTION_CWU, FACTION_REFUGEES, FACTION_ECLIPSE, FACTION_ANTIHUMAN, FACTION_PULP, FACTION_SUNRISE, FACTION_VIPERS, FACTION_CELL, FACTION_LU, FACTION_LASTA, FACTION_FIRE, FACTION_MIROTVOR, FACTION_TAG})
	else
		teams = rp.GetFactionTeamsMap({FACTION_CITIZEN, FACTION_BANDITS, FACTION_OUTLAWS, FACTION_REFUGEES, FACTION_ANTIHUMAN, FACTION_PULP, FACTION_SUNRISE, FACTION_VIPERS, FACTION_LU, FACTION_LASTA, FACTION_ANGELDARK, FACTION_ECLIPSE, FACTION_FIRE, FACTION_BANDITS2, FACTION_PMC, FACTION_BSYNDIC, FACTION_CELL})
	end
	
	for k,v in pairs(rp.teams) do
		if not teams[k] then
			rp.cfg.CantCapture[k] = true
		end
	end
end



if !isIndsutrial then
local ALLIANCE_ALLIANCE = rp.Capture.AddAlliance {
	name = 'Aliance',
	printName = 'Альянс',
	factions = {
		[FACTION_COMBINE] = true,
		[FACTION_OTA] = true,
		[FACTION_HELIX] = true,
		[FACTION_DPF] = true,
	},
	flagMaterial = 'https://i.imgur.com/YirsRvm.png'
}
end

if isIndsutrial then
local ALLIANCE_REBELS = rp.Capture.AddAlliance {
	name = 'Rebels',
	printName = 'Повстанцы',
	factions = {
		[FACTION_REBEL] = true,
		[FACTION_HECU] = true,
	},
	flagMaterial = 'https://styles.redditmedia.com/t5_2rgym/styles/communityIcon_mnkjitrq97431.png'
}
end

local ALLIANCE_BANDITS = rp.Capture.AddAlliance {
	name = 'Bandits',
	printName = 'Отверженные',
	factions = {
		[FACTION_BANDITS] = true,
	},
	flagMaterial = 'https://i.imgur.com/mgQQpqn.png'
}

local ALLIANCE_ZOMBIE = rp.Capture.AddAlliance {
	name = 'Zombie',
	printName = 'Зомби',
	factions = {
		[FACTION_ZOMBIE] = true,
	},
	flagMaterial = 'https://i.imgur.com/mgQQpqn.png'
}

if !isIndsutrial and !isSerious then 
local ALLIANCE_SWAT = rp.Capture.AddAlliance {
	name = 'Swat',
	printName = 'SWAT',
	factions = {
		[FACTION_PULP] = true,
	}
}
end

if !isIndsutrial and !isSerious then 
local ALLIANCE_SUNRISE = rp.Capture.AddAlliance {
	name = 'Sunrise',
	printName = 'Сыны Рассвета',
	factions = {
		[FACTION_SUNRISE] = true,
	}
}
end

if !isIndsutrial and !isSerious then 
local ALLIANCE_LEGION = rp.Capture.AddAlliance {
	name = 'Legion',
	printName = 'The Last Legion',
	factions = {
		[FACTION_LEGION] = true,
	}
}
end

--Combine
rp.ConjSetInvalid(ALLIANCE_ALLIANCE, CONJ_UNION, {ALLIANCE_REBELS, ALLIANCE_BANDITS,  ALLIANCE_ZOMBIE, ALLIANCE_SUNRISE, ALLIANCE_SWAT, ALLIANCE_LEGION, ALLIANCE_PRIME, ALLIANCE_APPATYRE})
rp.ConjSetInvalid(ALLIANCE_ALLIANCE, CONJ_NEUTRAL, {ALLIANCE_REBELS, ALLIANCE_BANDITS,  ALLIANCE_ZOMBIE, ALLIANCE_SUNRISE, ALLIANCE_SWAT, ALLIANCE_LEGION, ALLIANCE_PRIME, ALLIANCE_APPATYRE})

--Rebels
rp.ConjSetInvalid(ALLIANCE_REBELS, CONJ_UNION, {ALLIANCE_ALLIANCE,  ALLIANCE_ZOMBIE})
rp.ConjSetInvalid(ALLIANCE_REBELS, CONJ_NEUTRAL, {ALLIANCE_ALLIANCE,  ALLIANCE_ZOMBIE})

--Bandits
rp.ConjSetInvalid(ALLIANCE_BANDITS, CONJ_UNION, {ALLIANCE_ALLIANCE,  ALLIANCE_ZOMBIE})
rp.ConjSetInvalid(ALLIANCE_BANDITS, CONJ_NEUTRAL, {ALLIANCE_ALLIANCE,  ALLIANCE_ZOMBIE})

--Zombie
rp.ConjSetInvalid(ALLIANCE_ZOMBIE, CONJ_UNION, {ALLIANCE_REBELS, ALLIANCE_BANDITS, ALLIANCE_ALLIANCE,  ALLIANCE_SUNRISE, ALLIANCE_SWAT, ALLIANCE_LEGION, ALLIANCE_APPATYRE})
rp.ConjSetInvalid(ALLIANCE_ZOMBIE, CONJ_NEUTRAL, {ALLIANCE_REBELS, ALLIANCE_BANDITS, ALLIANCE_ALLIANCE,  ALLIANCE_SUNRISE, ALLIANCE_SWAT, ALLIANCE_LEGION, ALLIANCE_APPATYRE})


--С17
local POINT_D4 =rp.AddCapturePoint('rp_city17_urfim', 'd4k')
	:SetPrintName('Сектор D4')
	:SetPos({Vector(-1809, 3710, 76), Vector(2381, 6093, 1655)})
	:SetWipe(true)
	:SetOwnDoors(true)
	:SetFlagPos(Vector(161, 4013, 76)) 

	POINT_D4:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(365.498230, 5237.100586, 129.395294), Angle(0, -180, 0))
		:SetAddMoney(30)
		:SetGiveAmmo("smg1", 120) 
		:SetGiveAmmo("ar2", 60) 
		:SetGiveAmmo("Buckshot", 25)
		:SetGiveArmor(15)

	POINT_D4:AddBonusBox('models/props_combine/breenconsole.mdl')
		:SetPrintName('Токены')
		:SetPos(Vector(127.131821, 5040.364746, 80), Angle(-0.000, 180.000, 0.000))
		:SetAddMoney(150)

	POINT_D4:AddBonusBox('models/Items/ammoCrate_Rockets.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(365.499023, 5113.899902, 129.395294), Angle(0, -180, 0))
		:SetWeaponDefault('fas2_cweaponry_pshotgun','fas2_cweaponry_pp2')

local POINT_D6 = rp.AddCapturePoint('rp_city17_urfim', 'd6')
	:SetPrintName('Сектор D6')
	:SetPos({Vector(-3787, -4401, 76), Vector(-853, -3322, 838)})
	:SetWipe(true)
	:SetOwnDoors(true)
	:SetFlagPos(Vector(-2356, -3703, 76)) 

	POINT_D6:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(-2290.542480, -4384.113281, 96), Angle(0, 90, 0))
		:SetAddMoney(50)
		:SetGiveAmmo("smg1", 120) 
		:SetGiveAmmo("ar2", 60) 
		:SetGiveAmmo("Buckshot", 25)
		:SetGiveArmor(50)

	POINT_D6:AddBonusBox('models/props_combine/combine_interface002.mdl')
		:SetPrintName('Токены')
		:SetPos(Vector(-2465.282715, -4184.211426, 80), Angle(0.410, -89.991, -0.000))
		:SetAddMoney(350)

	POINT_D6:AddBonusBox('models/Items/ammoCrate_Rockets.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(-2418.833496, -4384.113281, 96), Angle(0, 90, 0))
		:SetWeaponDefault('fas2_cweaponry_ar3_scoped','fas2_cweaponry_pp')


--С17org
local POINT_STREET = rp.AddCapturePoint('rp_city17_urfim', 'streetcapt')
	:SetPrintName('Жилой Район')
	:SetPos({Vector(-3663, -2489, 80), Vector(-1690, -1670, 316)})
	:SetIsOrg(true)
	:SetWipe(true)
	:SetFlagPos(Vector(-2795, -2042, 80)) 

	POINT_STREET:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(-3274.869385, -1881.831055, 160), Angle(0, 90, 0))
		:SetGiveAmmo("smg1", 120) 
		:SetGiveAmmo("ar2", 60) 
		:SetGiveAmmo("Buckshot", 25)
		:SetGiveArmor(25)

	POINT_STREET:AddBonusBox('models/items/ammocrate_rockets.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(-3412.380371, -1881.831055, 160), Angle(0, 90, 0))
		:SetWeaponDefault('fas2_cweaponry_ar3_scoped','fas2_cweaponry_pp')

	POINT_STREET:AddBonusBox('models/props_combine/breenconsole.mdl')
		:SetPrintName('Токены')
		:SetPos(Vector(-3346.185791, -1890.238159, 143), Angle(0.0, 180.000, 0.000))
		:SetAddMoney(220)

local POINT_BASEMENT = rp.AddCapturePoint('rp_city17_urfim', 'basement')
	:SetPrintName('Заброшенный Завод')
	:SetPos({Vector(-4005, -6461, 92), Vector(-3382, -5698, 511)})
	:SetIsOrg(true)
	:SetWipe(true)
	:SetOwnDoors(true)
	:SetFlagPos(Vector(-3622, -6078, 92)) 
	:SetSpawnPoint(SPAWN_BASEMENT)

	POINT_BASEMENT:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(-3581.165039, -6265.668945, 107), Angle(0, 90, 0))
		:SetGiveAmmo("smg1", 120) 
		:SetGiveAmmo("ar2", 60) 
		:SetGiveAmmo("Buckshot", 25)

	POINT_BASEMENT:AddBonusBox('models/items/ammocrate_rockets.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(-3559.033691, -6016.527832, 141.628830), Angle(0, -90, 0))
		:SetWeaponDefault('fas2_cweaponry_ar1_m2','fas2_cweaponry_pph')

	POINT_BASEMENT:AddBonusBox('models/props_combine/breenconsole.mdl')
		:SetPrintName('Токены')
		:SetPos(Vector(-3819.220459, -6071.107910, 92), Angle(0.000, 90.000, 0.000))
		:SetAddMoney(125)


-- WF
local POINT_SAWMILL = rp.AddCapturePoint('rp_whiteforest_urfim', 'sawmill')
	:SetPrintName('Лесопилка')
	:SetPos({Vector(-2569, -4379, -54), Vector(-534, -2398, 1143)})
	:SetFlagPos(Vector(-1773, -3347, 188)) 
	:SetOwnDoors()

	 POINT_SAWMILL:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(-1535.163330, -3416.231689, 192.298447), Angle(0, -90, 0))
		:SetGiveAmmo("smg1", 120) 
		:SetGiveAmmo("ar2", 60) 
		:SetGiveAmmo("Buckshot", 25)

	POINT_SAWMILL:AddBonusBox('models/items/ammocrate_rockets.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(-1430.645752, -3416.275879, 192.522400), Angle(0, -90, 0))
		:SetWeaponDefault('fas2_cweaponry_ar1_m2','fas2_cweaponry_pph')

local POINT_MOUNTAIN = rp.AddCapturePoint('rp_whiteforest_urfim', 'mountain')
	:SetPrintName('Дозорный Пункт')
	:SetPos({Vector(-2938, -1820, -38), Vector(-697, 1046, 2042)})
	:SetSpawnPoint(SPAWN_MOUNT) 
	:SetOwnDoors(true)
	:SetWipe(true)
	:SetFlagPos(Vector(-1622.249512, -74.707787, 1512.055176)) 

	POINT_MOUNTAIN:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(-1505.230591, -420.341888, 826.391418), Angle(0, -90, 0))
		:SetGiveAmmo("smg1", 120) 
		:SetGiveAmmo("ar2", 60) 
		:SetGiveAmmo("Buckshot", 25)
		:SetGiveArmor(15)

	POINT_MOUNTAIN:AddBonusBox('models/Items/ammoCrate_Rockets.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(-1633.644043, -420.271118, 826.395325), Angle(0, -90, 0))
		:SetWeaponDefault('fas2_cweaponry_psr','fas2_cweaponry_pp')

	POINT_MOUNTAIN:AddBonusBox('models/items/item_item_crate.mdl')
		:SetPrintName('Продовольствие')
		:SetPos(Vector(-1567.408813, -419.468292, 810.335327), Angle(0.000, -90, 0.000))
		:SetWeaponDefault('urf_foodsystem_food_beans','urf_foodsystem_drink_punchcan')

--Стратегические точки
local POINT_CITY = rp.AddCapturePoint('rp_whiteforest_urfim', 'city')
	:SetPrintName('Поселение')
	:SetPos({Vector(-10842, -9153, -471), Vector(-6780, -4288, 1200)})
	:SetWipe(true)
	:SetFlagPos(Vector(-9236, -5581, -303)) 

	POINT_CITY:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(-9799.461914, -5692.822754, -258.272217), Angle(0, 0, 0))
		:SetGiveAmmo("smg1", 120) 
		:SetGiveAmmo("ar2", 60) 
		:SetGiveAmmo("Buckshot", 25)

	POINT_CITY:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(-9801.636719, -5586.349609, -292.673004), Angle(0, 0, 0))
		:SetWeaponDefault('fas2_cweaponry_ar3_scoped','fas2_cweaponry_pp')

	POINT_CITY:AddBonusBox('models/items/item_item_crate.mdl')
		:SetPrintName('Продовольствие')
		:SetPos(Vector(-9802.360352, -5638.499023, -275.053894), Angle(0, 0, 0))
		:SetWeaponDefault('urf_foodsystem_food_beans','urf_foodsystem_drink_punchcan')

	
local POINT_MINE = rp.AddCapturePoint('rp_whiteforest_urfim', 'Mine') 
	:SetPrintName('Шахта Победа')
	:SetPos({Vector(-640, -251, -302), Vector(-2009, -1595, -1342)})
	:SetWipe(true)
	:SetFlagPos(Vector(-1478, -1201, -1088)) 

	POINT_MINE:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(-1431.482910, -728.605957, -1135.728882), Angle(0, 135, 0))
		:SetGiveAmmo("smg1", 120) 
		:SetGiveAmmo("ar2", 60) 
		:SetGiveAmmo("Buckshot", 25)

	POINT_MINE:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(-1429.333252, -981.742065, -1135.772583), Angle(0, -135, 0))
		:SetWeaponDefault('fas2_cweaponry_pp2','fas2_cweaponry_pph')

	POINT_MINE:AddBonusBox('models/items/item_item_crate.mdl')
		:SetPrintName('Продовольствие')
		:SetPos(Vector(-1522.087646, -1156.561523, -1103.417603), Angle(0, 90, 0))
		:SetWeaponDefault('urf_foodsystem_food_beans','urf_foodsystem_drink_punchcan')

--Для организаций
local POINT_TRAIN = rp.AddCapturePoint('rp_whiteforest_urfim', 'train')
	:SetPrintName('Разграбленный поезд')
	:SetPos({Vector(-728, -1906, -86), Vector(286, -1298, 845)})
	:SetIsOrg(true)
	:SetWipe(true)
	:SetFlagPos(Vector(21, -1342, 135)) 

	POINT_TRAIN:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(116.051521, -1398.297485, 151.900223), Angle(0.477, 151.503, 0.879))
		:SetGiveAmmo("smg1", 120) 
		:SetGiveAmmo("ar2", 60) 
		:SetGiveAmmo("Buckshot", 25)
		:SetGiveArmor(10)

	POINT_TRAIN:AddBonusBox('models/items/ammocrate_rockets.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(22.876099, -1225.242676, 96.422829), Angle(-0.000, 61.716, -0.000))
		:SetWeaponDefault('fas2_cweaponry_ar3_scoped','fas2_cweaponry_pp')
	
local POINT_HOUSE = rp.AddCapturePoint('rp_whiteforest_urfim', 'house')
	:SetPrintName('Заброшенный Дом')
	:SetPos({Vector(2695, 765, 76), Vector(3352, 1506, 693)})
	:SetIsOrg(true)
	:SetOwnDoors(true)
	:SetWipe(true)
	:SetFlagPos(Vector(3216, 858, 183)) 

	POINT_HOUSE:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(2914.002441, 1422.277832, 196.650101), Angle(0, -90, 0))
		:SetWeaponDefault('fas2_cweaponry_ar1_m2','fas2_cweaponry_pph')

	POINT_HOUSE:AddBonusBox('models/items/item_item_crate.mdl')
		:SetPrintName('Продовольствие')
		:SetPos(Vector(2989.164307, 1288.401611, 180.418854), Angle(0, 180, 0))
		:SetWeaponDefault('urf_foodsystem_food_beans','urf_foodsystem_drink_punchcan')

--С17 mk
local POINT_D6MK = rp.AddCapturePoint('rp_mk_city17_urfim', 'd6mk')
	:SetPrintName('Сектор D6')
	:SetPos({Vector(-5460, 12131, 3414), Vector(-1834, 15391, 4743)})
	:SetWipe(true)
	:SetOwnDoors(true)
	:SetFlagPos(Vector(-2998, 13411, 3796)) 

	POINT_D6MK:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(-2772.930908, 13453.029297, 3853.687012), Angle(0, 180, 0))
		--:SetAddMoney(30)
		--:SetGiveAmmo("smg1", 120) 
		--:SetGiveAmmo("ar2", 60) 
		--:SetGiveAmmo("Buckshot", 25)
		--:SetGiveArmor(15)

	POINT_D6MK:AddBonusBox('models/props_combine/breenconsole.mdl')
		:SetPrintName('Токены')
		:SetPos(Vector(-2776.487793, 13350.080078, 3804.413330), Angle(-0.000, -90.000, 0.000))
		--:SetAddMoney(25)

	POINT_D6MK:AddBonusBox('models/Items/ammoCrate_Rockets.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(-2772.763672, 13590.349609, 3853.687256), Angle(0, 180, 0))
		--:SetWeaponDefault('fas2_cweaponry_pshotgun','fas2_cweaponry_pp2')

local POINT_D4MK = rp.AddCapturePoint('rp_mk_city17_urfim', 'd4mk')
	:SetPrintName('Сектор D4')
	:SetPos({Vector(-9135, 4017, 3376), Vector(-7584, 5942, 4572)})
	:SetWipe(true)
	:SetOwnDoors(true)
	:SetFlagPos(Vector(-7719, 5217, 3796)) 

	POINT_D4MK:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(-7527.605469, 4573.837402, 3816.568604), Angle(-0.000, -180.000, 0.000))
		--:SetAddMoney(50)
		--:SetGiveAmmo("smg1", 120) 
		--:SetGiveAmmo("ar2", 60) 
		--:SetGiveAmmo("Buckshot", 25)
		--:SetGiveArmor(25)

	POINT_D4MK:AddBonusBox('models/props_combine/breenconsole.mdl')
		:SetPrintName('Токены')
		:SetPos(Vector(-7567.475586, 4755.149902, 3800.525146), Angle(0.010, -0.002, -0.563))
		--:SetAddMoney(50)

	POINT_D4MK:AddBonusBox('models/Items/ammoCrate_Rockets.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(-7527.605469, 4663.038086, 3816.568604), Angle(-0.000, -180.000, 0.000))
		--:SetWeaponDefault('fas2_cweaponry_ar3_scoped','fas2_cweaponry_pp')

local POINT_MOST = rp.AddCapturePoint('rp_mk_city17_urfim', 'most')
	:SetPrintName('Разрушенный мост')
	:SetPos({Vector(-446, 6766, 4454), Vector(-2077, 4707, 3310)})
	:SetWipe(true)
	:SetOwnDoors(true)
	:SetFlagPos(Vector(-1560, 5851, 3581))

	POINT_MOST:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(-1874.952881, 5487.173340, 3820.288086), Angle(-0.000, -180.000, 0.000))
		--:SetAddMoney(100)
		--:SetGiveAmmo("smg1", 120) 
		--:SetGiveAmmo("ar2", 60) 
		--:SetGiveAmmo("Buckshot", 25)
		--:SetGiveArmor(25)

	POINT_MOST:AddBonusBox('models/Items/ammoCrate_Rockets.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(-1874.846191, 5409.583008, 3820.333984), Angle(-0.000, -180.000, 0.000))
		--:SetWeaponDefault('fas2_cweaponry_ar3_scoped','fas2_cweaponry_pp')

	POINT_MOST:AddBonusBox('models/props_combine/breenconsole.mdl')
		:SetPrintName('Токены')
		:SetPos(Vector(-1871.364502, 5325.796875, 3820), Angle(-0.000, -90.000, 0.000))
		--:SetAddMoney(50)

--С17org mk
local POINT_STREETMK = rp.AddCapturePoint('rp_mk_city17_urfim', 'streetcaptmk')
	:SetPrintName('Жилой Район')
	:SetPos({Vector(-6844, 6779, 3751), Vector(-4852, 7714, 4515)})
	:SetIsOrg(true)
	:SetWipe(true)
	:SetFlagPos(Vector(-6413, 7249, 3804)) 

	POINT_STREETMK:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(-6442.070312, 7391.233887, 3883.815918), Angle(0.000, 90.000, -0.000))
		--:SetGiveAmmo("smg1", 120) 
		--:SetGiveAmmo("ar2", 60) 
		--:SetGiveAmmo("Buckshot", 25)
		--:SetGiveArmor(25)

	POINT_STREETMK:AddBonusBox('models/items/ammocrate_rockets.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(-6607.044434, 7391.218262, 3883.892090), Angle(0, 90, 0))
		--:SetWeaponDefault('fas2_cweaponry_ar3_scoped','fas2_cweaponry_pp')

	POINT_STREETMK:AddBonusBox('models/props_combine/breenconsole.mdl')
		:SetPrintName('Токены')
		:SetPos(Vector(-6524.495117, 7387.647461, 3868.500977), Angle(0.000, 180.000, -0.000))
		--:SetAddMoney(80)

--Industrial
rp.AddCapturePoint('rp_industrial17_urfim', 'beach')
	:SetPrintName('Пляж')
	:SetPos({Vector(-3572, 6584, -416), Vector(10463, 12100, 1474)})
	--:SetGiveArmor(15)
	--:SetPayBonus(25)
	--:SetGiveAmmo("smg1", 180) 
	--:SetGiveAmmo("ar2", 90) 
	--:SetGiveAmmo("Buckshot", 50)

rp.AddCapturePoint('rp_industrial17_urfim', 'inddfour')
	:SetPrintName('КПП D4')
	:SetPos({Vector(3075, 1158, 99), Vector(3913, 3318, 1595)})
	--:SetAddHealth(10)
	--:SetGiveArmor(15)
	--:SetPayBonus(25)
	--:SetGiveAmmo("smg1", 90) 
	--:SetGiveAmmo("ar2", 45) 
	--:SetGiveAmmo("Buckshot", 20)

rp.AddCapturePoint('rp_industrial17_urfim', 'inddfour')
	:SetPrintName('Жилой Дом D4')
	:SetPos({Vector(3968, 4736, 294), Vector(4632, 5677, 887)})
	--:SetAddHealth(10)
	--:SetPayBonus(30)
	--:SetGiveAmmo("smg1", 90) 
	--:SetGiveAmmo("ar2", 45) 
	--:SetGiveAmmo("Buckshot", 20)

--New С17
local POINT_D4 = rp.AddCapturePoint('rp_city17_urfim_v2', 'd4new')
	:SetPrintName('Сектор D4')
	:SetPos({Vector(3183.203125, 7174.395508, 24), Vector(5081.591309, 7865.951172, 664.200012)})
	:SetWipe(true)
	:SetOwnDoors(true)
	:SetFlagPos(Vector(4168, 7408, 24)) 

	POINT_D4:AddBonusBox('models/props_marines/ammocrate01_static.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(4187.881836, 7668.089844, 46.618774), Angle(-0.011, 101.535, -0.009))
		:SetAddMoney(30)
		:SetGiveAmmo("smg1", 120) 
		:SetGiveAmmo("ar2", 60) 
		:SetGiveAmmo("Buckshot", 25)
		:SetGiveArmor(15)

	POINT_D4:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(4192.170410, 7750.402832, 46.618774), Angle(-0.017, -16.507, 0.009))
		:SetWeaponDefault('fas2_cweaponry_pph','fas2_cweaponry_pp2')

local POINT_D6 = rp.AddCapturePoint('rp_city17_urfim_v2', 'd6new')
	:SetPrintName('Сектор D6')
	:SetPos({Vector(326.289703, -1561.712891, 24), Vector(1030.361938, -175.531219, 465.749969)})
	:SetWipe(true)
	:SetOwnDoors(true)
	:SetFlagPos(Vector(659, -795, 24)) 

	POINT_D6:AddBonusBox('models/props_marines/ammocrate01_static.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(855.054138, -501.054718, 46.596577), Angle(-0.000, 89.996, 0.000))
		:SetAddMoney(50)
		:SetGiveAmmo("smg1", 120) 
		:SetGiveAmmo("ar2", 60) 
		:SetGiveAmmo("Buckshot", 25)
		:SetGiveArmor(25)

	POINT_D6:AddBonusBox('models/items/ammocrate_smg1.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(856.224731, -574.627930, 48.397217), Angle(0.000, -0.000, 0.000))
		:SetWeaponDefault('fas2_cweaponry_ar3_scoped','fas2_cweaponry_pp')


--С17org
local POINT_STREET = rp.AddCapturePoint('rp_city17_urfim_v2', 'streetcaptnew')
	:SetPrintName('Жилой Район')
	:SetPos({Vector(303.533051, 1759.230469, 128), Vector(1401.735229, 2361.593750, 628.103699)})
	:SetIsOrg(true)
	:SetWipe(true)
	:SetFlagPos(Vector(585, 2196, 176)) 

	POINT_STREET:AddBonusBox('models/props_marines/ammocrate01_static.mdl')
		:SetPrintName('Амуниция')
		:SetPos(Vector(679.052551, 2025.175171, 190.701736), Angle(0.058, 141.657, 0.016))
		:SetGiveAmmo("smg1", 120) 
		:SetGiveAmmo("ar2", 60) 
		:SetGiveAmmo("Buckshot", 25)
		:SetGiveArmor(25)
		:SetAddMoney(60)

	POINT_STREET:AddBonusBox('models/items/ammocrate_rockets.mdl')
		:SetPrintName('Набор Оружия')
		:SetPos(Vector(786.725647, 2033.859863, 192.330627), Angle(-0.001, -44.976, 0.004))
		:SetWeaponDefault('fas2_cweaponry_ar3_scoped','fas2_cweaponry_pp')


hook.Call("CapturePointsLoaded")