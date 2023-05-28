--[[
Server Name: λ HL2RP | Classic | Cuтu-17
Server IP:   185.221.196.56:27016
File Path:   gamemodes/urf_imrp/gamemode/config/jobs/d_lu.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local lu_spawns = {
	rp_city17_build210 = {Vector(4552, -1164, 76), },
	rp_city17_urfim = {Vector(-2959, -8003, 40)},
	rp_city17_urfim_v2 = {Vector(4869, 1216, -336)},
	rp_industrial17_v1 = {Vector(6217, 5328, 288)},
	rp_whiteforest_urfim = {Vector(-2088, 11629, -320)}
}

local union_spawns = {
	rp_c18_divrp = {Vector(1425, 1079, 512), Vector(3328, 268, 368), Vector(3197, 763, 512),},
	rp_city17_urfim = {Vector(4426, 325, 76), Vector(4225, 355, 76), Vector(4190, 239, 76), Vector(4048, 243, 76), Vector(4080, 352, 76), Vector(4811, 81, 76), Vector(4800, 309, 76), Vector(4707, 181, 76), Vector(4634, 79, 76)},
	rp_industrial17_urfim = {Vector(2418, 3205, -544), Vector(2315, 3203, -544), Vector(2212, 3204, -544), Vector(2109, 3204, -544)},
	rp_city8_urfim = {Vector(-64, 6570, 128), Vector(-63, 6687, 128), Vector(-67, 6775, 128), Vector(49, 6762, 128)},
	rp_whiteforest_urfim = {Vector(3786, -13985, 197), Vector(3719, -13835, 197), Vector(4011, -13872, 197), Vector(4039, -14032, 197)},
	rp_mk_city17_urfim = {Vector(157, 10180, 3796), Vector(273, 10050, 3796), Vector(198, 9922, 3796), Vector(492, 9749, 3796), Vector(819, 9751, 3796), Vector(109, 9708, 3796)},
	rp_city17_urfim_v2 = {Vector(7079, 193, -64), Vector(7285, 201, -64), Vector(7473, 208, -64), Vector(7254, 55, -64)},
}

local rebel_spawns = {
	rp_c18_divrp = {Vector(-1990, 3538, 872),Vector(-1993, 3348, 872),Vector(-1364, 3348, 900),Vector(-1358, 3597, 900),Vector(-1620, 3480, 872),Vector(-1671, 3625, 872),},
	rp_city8_urfim = {Vector(3064, 809, -4),Vector(2941, 809, -4),Vector(2940, 706, -4),Vector(3083, 706, -4)},
	rp_city17_build210 = rp.GetSpawnPoint(SPAWN_D6),
	rp_city17_urfim = rp.GetSpawnPoint(SPAWN_D6),
	rp_industrial17_urfim = rp.GetSpawnPoint(SPAWN_D6),
	rp_whiteforest_urfim = {Vector(-2640, 12155, -320), Vector(-2445, 12336, -320), Vector(-2332, 12127, -320), Vector(-1145, 9745, -320),Vector(-1349, 9396, -320), Vector(-1615, 10572, -320)},
	rp_mk_city17_urfim = {Vector(-11316, 6378, 3865),Vector(-11180, 6372, 3865),Vector(-11037, 6366, 3865), Vector(-11031, 6490, 3865), Vector(-11154, 6496, 3865)},
	rp_city17_urfim_v2 = {
		Vector(-5306, -629, 80),
		Vector(-5223, -630, 80),
		Vector(-5107, -632, 80),
		Vector(-5109, -770, 80),
		Vector(-5225, -769, 80),
		Vector(-5270, -768, 80),
		Vector(-5273, -944, 80),
		Vector(-5157, -946, 80),},
}

if !isSerious and !isIndsutrial then
TEAM_REBEL_DON123 = rp.addTeam("Послушник Альянса", {
	color = Color(26, 26, 112),
	model = {'models/player/tnb/citizens/female_10_fix.mdl'},
	description = [[]],
	weapons = {"weapon_medkit", "climb_swep", "swb_m4a1","swb_usp"},
	salary = 9,
	unlockTime = 140 * 3600,
		candisguise = true,
	disguise_faction = FACTION_CITIZEN,	
	notDisguised = true,
	command = "rebel2364",
	spawns = union_spawns,
	disableDisguise = true,
	disableDisguise = true,
	faction = FACTION_COMBINE,
	canCapture = true,
	armor = 200,
	PlayerSpawn = function(ply) ply:SetMaxHealth(100) end,
		appearance = 
	{
		{
			mdl = {'models/player/tnb/citizens/female_10_fix.mdl',},
			bodygroups = {
				[1] = {0},
				[2] = {0},
				[3] = {0},
				[4] = {0},
			}
		},
	},	
	CustomCheckFailMsg = 'Lambda Soldiers',
	customCheck = function(ply) return ply:IsRoot() or (ply:GetOrg() == 'Separatist' && (ply:GetOrgData().Rank == 'Insider of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'Commander of LU' or ply:GetOrgData().Rank == 'Support of LU' or ply:GetOrgData().Rank == 'Separatist' or ply:GetOrgData().Rank == 'Scientist of LU' or ply:GetOrgData().Rank == 'Uber Sponsor' or ply:GetOrgData().Rank == 'Co Leader of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'All LU Professions' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'UberSponsor of LU' or ply:GetOrgData().Rank == 'Co Leader of LU' or ply:GetOrgData().Rank == 'Sponsor of LU' or ply:GetOrgData().Rank == 'Magnusson of LU' or ply:GetOrgData().Rank == 'All Professions')) or ply:SteamID() == "STEAM_0:1:162841101" or ply:SteamID() == "STEAM_0:1:455268019" or ply:SteamID() == "STEAM_0:0:241590515" or ply:SteamID() == "STEAM_0:0:150558901" or ply:SteamID() == "STEAM_0:0:437925060" or ply:SteamID() == "STEAM_0:0:120669385"
	 end,
	loyalty = 2
})
end

TEAM_REBEL_DONAT2 = rp.addTeam("Солдат LU", {
	color = Color(154, 205, 50),
	model = {'models/player/gdirifleman.mdl'},
	description = [[]],
	weapons = {"swb_ak47", "swb_m3super90", "swb_knife","lockpick","keypad_cracker", "swb_deagle"},
	salary = 9,
	unlockTime = 190 * 3600,
	command = "rebel236",
	vip = true,
	canCapture = true,
	spawns = lu_spawns,
	spawn_points = rebel_points,
	faction = FACTION_LU,
	armor = 290,
	PlayerSpawn = function(ply) ply:SetMaxHealth(100) end,
	candisguise = true,
	disguise_faction = FACTION_CITIZEN,			
	rationCount = 1,
	CustomCheckFailMsg = 'Lambda Soldiers',
	customCheck = function(ply) return CLIENT or (ply:GetOrg() == 'Separatist' && (ply:GetOrgData().Rank == 'Soldier of LU' or ply:GetOrgData().Rank == 'Commander of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'Support of LU' or ply:GetOrgData().Rank == 'Separatist' or ply:GetOrgData().Rank == 'Scientist of LU' or ply:GetOrgData().Rank == 'Uber Sponsor' or ply:GetOrgData().Rank == 'Co Leader of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'All LU Professions' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'UberSponsor of LU' or ply:GetOrgData().Rank == 'Co Leader of LU' or ply:GetOrgData().Rank == 'Sponsor of LU' or ply:GetOrgData().Rank == 'Magnusson of LU' or ply:GetOrgData().Rank == 'All Professions'))
	or ply:SteamID() == "STEAM_0:0:231675719" 
	or ply:SteamID() == "STEAM_0:0:230025444" 
	or ply:SteamID() == "STEAM_0:1:178020319"
	or ply:SteamID() == "STEAM_0:1:17121679" 
	or ply:SteamID() == "STEAM_0:0:423165678"
	or ply:SteamID() == "STEAM_0:1:43984697"
	or ply:SteamID() == "STEAM_0:1:194331209"
	or ply:SteamID() == "STEAM_0:0:448761482"
	 or ply:SteamID() == "STEAM_0:0:241590515"
	or ply:SteamID() == "STEAM_0:1:43984697"
	or ply:SteamID() == "STEAM_0:1:178020319"
	or ply:SteamID() == "STEAM_0:1:437487812" 
	or ply:SteamID() == "STEAM_0:1:185894550" 
	or ply:IsRoot() end,
	loyalty = 5
})


TEAM_REBEL_DON5AT = rp.addTeam("Командир LU", {
	color = Color(154, 205, 50),
	model = {'models/artel/forcesolder/force_solder.mdl'},
	description = [[]],
	weapons = {"swb_p228","swb_knife","weapon_frag", "swb_mac10", "fas2_cweaponry_pshotgun","swb_ar3","lockpick","keypad_cracker"},
	salary = 10,
	command = "rebe23",
	hpRegen = 1,
	spawns = lu_spawns,
	spawn_points = rebel_points,
	faction = FACTION_LU,
	armor = 300,
	PlayerSpawn = function(ply) ply:SetMaxHealth(100) ply:SetRunSpeed(350) end,
	max = 3,
	vip = true,
			appearance =
	{
        {mdl = {'models/artel/forcesolder/force_solder.mdl'},
           bodygroups = {
                [1] = {0,1,2,3,4,5},
                [2] = {0,1,2,3,4,5},
                [3] = {0,1,2,3,4,5},
                [4] = {0,1,2,3,4,5},
            			}
        },
    },
	canCapture = true,
	unlockTime = 350 * 3600,
	CustomCheckFailMsg = 'Lambda Soldiers',
	candisguise = true,
	disguise_faction = FACTION_CITIZEN,			
	rationCount = 1,
	customCheck = function(ply) return CLIENT or (ply:GetOrg() == 'Separatist' && (ply:GetOrgData().Rank == 'Separatist' or ply:GetOrgData().Rank == 'Commander of LU' or ply:GetOrgData().Rank == 'Support of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'Uber Sponsor' or ply:GetOrgData().Rank == 'Scientist of LU' or ply:GetOrgData().Rank == 'Co Leader of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'All LU Professions' or ply:GetOrgData().Rank == 'Magnusson of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'UberSponsor of LU' or ply:GetOrgData().Rank == 'Co Leader of LU' or ply:GetOrgData().Rank == 'Sponsor of LU' or ply:GetOrgData().Rank == 'All Professions')) or ply:SteamID() == "STEAM_0:0:241590515" or ply:SteamID() == "STEAM_0:0:423165678" or ply:SteamID() == "STEAM_0:0:178329018" or ply:SteamID() == "STEAM_0:0:175506079" or ply:SteamID() == "STEAM_0:0:198752687" or ply:IsRoot() end,
	loyalty = 9
})


TEAM_REBEL_MAGGG = rp.addTeam("Учёный LU", {
	color = Color(154, 205, 50),
	model = {'models/player/hev_helmet.mdl'},
	description = [[]],
	weapons = {"weapon_ota_reprogrammer", "swb_357", "swb_shotgun"},
	salary = 10,
	max = 0,
	command = "rebe24",
	spawns = lu_spawns,
	spawn_points = rebel_points,
	faction = FACTION_LU,
	unlockTime = 315 * 3600,
	armor = 250,
	PlayerSpawn = function(ply) ply:SetHealth(120) ply:SetMaxHealth(120) end,
	max = 2,
	vip = true,
	CustomCheckFailMsg = 'Lambda Soldiers',
	candisguise = true,
	disguise_faction = FACTION_CITIZEN,
	canCapture = true,
	rationCount = 1,
	customCheck = function(ply) return CLIENT or (ply:GetOrg() == 'Separatist' && (ply:GetOrgData().Rank == 'Uber Sponsor' or ply:GetOrgData().Rank == 'Co Leader of LU'  or ply:GetOrgData().Rank == 'Commander of LU' or ply:GetOrgData().Rank == 'Support of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'Scientist of LU' or ply:GetOrgData().Rank == 'All LU Professions' or ply:GetOrgData().Rank == 'Magnusson of LU' or ply:GetOrgData().Rank == 'All Professions' or ply:GetOrgData().Rank == 'Sponsor of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'UberSponsor of LU' or ply:GetOrgData().Rank == 'Co Leader of LU')) or ply:SteamID() == "STEAM_0:0:423165678" or ply:SteamID() == "STEAM_0:0:241590515" or ply:SteamID() == "STEAM_0:0:66918639" or ply:SteamID() == "STEAM_0:0:229585347" or ply:SteamID() == "STEAM_0:0:40966377" or ply:SteamID() == "STEAM_0:1:197990168" or ply:SteamID() == "STEAM_0:1:100072607" or ply:IsRoot() end,
	loyalty = 8
})

if !isSerious and !isIndsutrial then
TEAM_REBEL_SEPAR = rp.addTeam('Боец Поддержки LU', {
	color = Color(154, 205, 50),
	model = {"models/player/gdirockettrooper.mdl"},
	description = [[ 
]],
	command = 'lusupport',
	salary = 20,
	faction = FACTION_LU,
	weapons = { "weapon_medkit_fast", 'climb_swep', "weapon_bp_sniper","swb_xm1014","swb_ar2", "swb_mp5"},
	spawns = rebel_spawns,
	customCheck = function(ply) return CLIENT or (ply:GetOrg() == 'Separatist' && (ply:GetOrgData().Rank == 'Separatist' or ply:GetOrgData().Rank == 'Uber Sponsor'  or ply:GetOrgData().Rank == 'Commander of LU' or ply:GetOrgData().Rank == 'Support of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'Co Leader of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'All LU Professions' or ply:GetOrgData().Rank == 'Sponsor of LU' or ply:GetOrgData().Rank == 'Magnusson' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'UberSponsor of LU' or ply:GetOrgData().Rank == 'Co Leader of LU' or ply:GetOrgData().Rank == 'All Professions'))
	 or ply:SteamID() == "STEAM_0:1:162367427"
	 or ply:SteamID() == "STEAM_0:0:423165678" 
	 or ply:SteamID() == "STEAM_0:1:182523785"
	 or ply:SteamID() == "STEAM_0:1:157774316" 
	 or ply:SteamID() == "STEAM_0:1:96434864" 
	 or ply:SteamID() == "STEAM_0:0:241590515" 
	 or ply:SteamID() == "STEAM_0:1:420524826"
	 or ply:IsRoot() end,
	rationCount = 1,
	loyalty = 7,
	vip = true,
	unlockTime = 245 * 3600,
	canCapture = true,
	candisguise = true,
	armor = 250,
	PlayerSpawn = function(ply) ply:SetRunSpeed(250) end,
	disguise_faction = FACTION_COMBINE,
})
end

if !isSerious and !isIndsutrial then
rp.addTeam("Практикант LU", {
	color = Color(154, 205, 50),
	model = {'models/prototype/players/marine_pt1.mdl'},
	description = [[]],
	weapons = {"swb_357", "swb_mac10"},
	salary = 9,
	unlockTime = 50 * 3600,
	candisguise = true,
	disguise_faction = FACTION_CITIZEN,	
	command = "reb312",
	spawns = rebel_spawns,
	faction = FACTION_LU,
	canCapture = true,
	armor = 100,
	PlayerSpawn = function(ply) ply:SetMaxHealth(100) end,
	CustomCheckFailMsg = 'Lambda Soldiers',
	customCheck = function(ply) return ply:IsRoot() or (ply:GetOrg() == 'Separatist' && (ply:GetOrgData().Rank == 'Insider of LU' or ply:GetOrgData().Rank == 'Commander of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'Separatist' or ply:GetOrgData().Rank == 'Uber Sponsor' or ply:GetOrgData().Rank == 'Co Leader of LU' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'All LU Professions' or ply:GetOrgData().Rank == 'Leader of LU' or ply:GetOrgData().Rank == 'UberSponsor of LU' or ply:GetOrgData().Rank == 'Co Leader of LU' or ply:GetOrgData().Rank == 'Sponsor of LU' or ply:GetOrgData().Rank == 'Magnusson of LU' or ply:GetOrgData().Rank == 'All Professions')) or ply:SteamID() == "STEAM_0:0:241590515" or ply:SteamID() == "STEAM_0:0:150558901" or ply:SteamID() == "STEAM_0:0:437925060" or ply:SteamID() == "STEAM_0:0:120669385"
	 end,
	loyalty = 7
})
end

rp.AddToRadioChannel(rp.GetFactionTeams({FACTION_LU}))
rp.AddDoorGroup('Нексус', rp.GetFactionTeams({FACTION_COMBINE, FACTION_DPF, FACTION_OTA, FACTION_HELIX, FACTION_DAP, FACTION_VIPERS, FACTION_ANTIHUMAN}, {TEAM_CHLENGUD2, TEAM_KAEF, TEAM_MAYOR1, TEAM_CWU_LEADER, TEAM_REFERENT, TEAM_EMPLOYER, TEAM_VASIL, FACTION_ANTIHUMAN, TEAM_SKI, FACTION_FANTOM, TEAM_SWAT_INK, TEAM_REBEL_MAGGG}))
rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_REBEL, FACTION_HECU, FACTION_HECU, FACTION_LU})))

rp.SetTeamVoices(TEAM_REBEL_DON5AT, {
    {
        label = 'Вперед',
        sound = 'lu/1.mp3', 
        text = 'Вперед'
    },
    {
        label = 'Выкладывай',
        sound = 'lu/2.mp3', 
        text = 'Выкладывай!'
    },
    {
        label = 'Есть',
        sound = 'lu/3.mp3', 
        text = 'Есть!'
    },
    {
        label = 'Понятно',
        sound = 'lu/4.mp3', 
        text = 'Понятно'
    },
    {
        label = 'Сделаешь это еще раз...',
        sound = 'lu/5.mp3', 
        text = 'Сделаешь это еще раз...'
    },
})