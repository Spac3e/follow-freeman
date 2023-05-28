--[[
Server Name: λ HL2RP | Classic | Cuтu-17
Server IP:   185.221.196.56:27016
File Path:   gamemodes/urf_imrp/gamemode/config/jobs/d_anarh.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local outlaws_spawns = {
	rp_city17_build210 = {Vector(1818, -2634, 80),Vector(1738, -2632, 80),Vector(1823, -2715, 80), Vector(1680, -2725, 80)},
	rp_city17_urfim = {Vector(-5324, -7562, 80)},
	rp_industrial17_v1 = {Vector(5346, 4682, 328),Vector(5456, 4675, 328),Vector(5536, 4583, 328)},
	rp_whiteforest_urfim = {Vector(1862, 3148, 75),Vector(1561, 3517, 75),Vector(2442, 3626, 91)},
	rp_city17_urfim_v2 = {Vector(769, -2710, -128)},
	rp_mk_city17_urfim = {Vector(-4211, 13936, 3676),Vector(-4012, 14132, 3676),Vector(-4650, 14185, 3676)}
}

if !isSerious and !isIndsutrial then
TEAM_ANAF = rp.addTeam("Инсайдер Анархии", {
    color = Color(127, 255, 212),
	model = {
'models/niik/pm_soa/m9-hunter.mdl'
},
	description = [[
]],
	weapons = {"swb_mac10", "swb_deagle", "fas2_cweaponry_pp2"},
	salary = 15,
	command = "ou31",
	spawns = outlaws_spawns,
	armor = 350,
	faction = FACTION_BANDITS2,
	candisguise = true,
	disguise_faction = FACTION_CITIZEN,		
	unlockTime = 140 * 3600,
	rationCount = 1,	
	vip = true,
	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'Son Of Anarchy' && (ply:GetOrgData().Rank == 'Leader'  or ply:GetOrgData().Rank == 'Judge'  or ply:GetOrgData().Rank == "Council" or ply:GetOrgData().Rank == "Lord" or ply:GetOrgData().Rank == 'Reaper' or ply:GetOrgData().Rank == 'Shop' or ply:GetOrgData().Rank == 'Hammer' or ply:GetOrgData().Rank == 'Eye' or ply:GetOrgData().Rank == 'Eyes of Anarchy' or ply:GetOrgData().Rank == 'Leader Of Anarchy')) or rp.PlayerHasAccessToCustomJob({'Инсайдер Анархии'}, ply:SteamID64()) end,
	canCapture = true,
	loyalty = 7,
})	
end 

if !isSerious and !isIndsutrial then
rp.addTeam("Неофит Анархии", {
    color = Color(127, 255, 212),
	model = {
'models/player/bms_blackops.mdl'
},
	description = [[
]],
	weapons = {"swb_mp5", "swb_357"},
	salary = 15,
	command = "ou3231",
	spawns = outlaws_spawns,
	armor = 125,
	faction = FACTION_BANDITS2,
	candisguise = true,
	disguise_faction = FACTION_CITIZEN,		
	unlockTime = 50 * 3600,
	rationCount = 1,	
	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'Son Of Anarchy' && (ply:GetOrgData().Rank == 'Leader'  or ply:GetOrgData().Rank == 'Judge'  or ply:GetOrgData().Rank == "Council" or ply:GetOrgData().Rank == "Lord" or ply:GetOrgData().Rank == 'Reaper' or ply:GetOrgData().Rank == 'Shop' or ply:GetOrgData().Rank == 'Hammer' or ply:GetOrgData().Rank == 'Eye' or ply:GetOrgData().Rank == 'Adept')) or rp.PlayerHasAccessToCustomJob({'Неофит Анархии'}, ply:SteamID64())  end,
	canCapture = true,
	loyalty = 7,
})	
end 

if !isSerious and !isIndsutrial then
rp.addTeam("Молот Анархии", {
	color = Color(127, 255, 212),
	model = {
		"models/niik/pm_soa/uc_soldier.mdl"
	},
	description = [[]],
	weapons = {"swb_ar3", "weapon_bp_sniper", "climb_swep", "fas2_cweaponry_pshotgun", "weapon_medkit", "weapon_lordi_sledgehammer"},
	command = "ba32",
	salary = 10,
	vip = true,
	unlockTime = 280 * 3600,
	max = 2,
	candisguise = true,
	disguise_faction = FACTION_COMBINE,		
	spawns = outlaws_spawns,
	armor = 400,
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetMaxHealth(150)  end,
	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'Son Of Anarchy' && (ply:GetOrgData().Rank == 'Leader'  or ply:GetOrgData().Rank == 'Judge'  or ply:GetOrgData().Rank == "Council" or ply:GetOrgData().Rank == 'Lord' or ply:GetOrgData().Rank == 'Reaper' or ply:GetOrgData().Rank == 'Shop' or ply:GetOrgData().Rank == 'Hammer' or ply:GetOrgData().Rank == 'Hammers Of Anarchy' or ply:GetOrgData().Rank == 'Leader Of Anarchy')) or rp.PlayerHasAccessToCustomJob({'Молот Анархии'}, ply:SteamID64()) end,
	faction = FACTION_BANDITS2,
	rationCount = 1,
	loyalty = 7
})
end 

if !isSerious and !isIndsutrial then
TEAM_KONTR = rp.addTeam("Контрабандист Анархии", {
	color = Color(127, 255, 212),
	model = {
		"models/detective.mdl"
	},
	description = [[]],
	weapons = {"swb_shotgun", "cloaking-10seconds_new", "fas2_cweaponry_pshotgun", "weapon_ota_reprogrammer" },
	command = "ba123",
	salary = 10,
	vip = true,
	unlockTime = 130 * 3600,
	max = 2,	
	spawns = outlaws_spawns,
	armor = 250,
	PlayerSpawn = function(ply) ply:SetHealth(100) ply:SetMaxHealth(100)  end,
	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'Son Of Anarchy' && (ply:GetOrgData().Rank == 'Leader'  or ply:GetOrgData().Rank == 'Judge'  or ply:GetOrgData().Rank == "Council"  or ply:GetOrgData().Rank == "Lord" or ply:GetOrgData().Rank == 'Reaper' or ply:GetOrgData().Rank == 'Shop' or ply:GetOrgData().Rank == 'Council Of Anarchy' or ply:GetOrgData().Rank == 'Leader Of Anarchy'))  end,
	faction = FACTION_BANDITS2,
	rationCount = 1,
	loyalty = 7
})
end 

if !isSerious and !isIndsutrial then
rp.addTeam("Жнец Анархии", {
	color = Color(127, 255, 212),
	model = {
		"models/niik/pm_soa/female_rebel.mdl", "models/niik/pm_soa/rebel.mdl"
	},
	description = [[]],
	weapons = {"cloaking-10seconds_new", "sh_blinkswep", "swb_xm1014", "swb_m249", "fas2_cweaponry_pdshotgun"},
	command = "ba14",
	salary = 10,
	vip = true,
	unlockTime = 130 * 3600,
	max = 1,
	hpRegen = 5,	
	spawns = outlaws_spawns,
	armor = 250,
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetMaxHealth(150) ply:SetRunSpeed(350) end,
	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'Son Of Anarchy' && (ply:GetOrgData().Rank == 'Leader' or ply:GetOrgData().Rank == 'Judge'  or ply:GetOrgData().Rank == "Council" or ply:GetOrgData().Rank == 'Lord' or ply:GetOrgData().Rank == 'Reaper' or ply:GetOrgData().Rank == 'Reaper Of Anarchy')) or rp.PlayerHasAccessToCustomJob({'Жнец Анархии'}, ply:SteamID64()) end,
	faction = FACTION_BANDITS2,
	rationCount = 1,
	loyalty = 7
})
end 

if !isSerious and !isIndsutrial then
rp.AddDoorGroup('Анархисты', rp.GetFactionTeams({FACTION_BANDITS2}))
rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_BANDITS2})))
end 
