--[[
Server Name: λ HL2RP | Classic | Cuтu-17
Server IP:   185.221.196.56:27016
File Path:   gamemodes/urf_imrp/gamemode/config/jobs/d_aperture.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local outlaws_spawns = {
	rp_city17_build210 = {Vector(1818, -2634, 80),Vector(1738, -2632, 80),Vector(1823, -2715, 80), Vector(1680, -2725, 80)},
	rp_city17_urfim = {Vector(1249, 601, -466)},
	rp_industrial17_urfim = {Vector(5346, 4682, 328),Vector(5456, 4675, 328),Vector(5536, 4583, 328)},
	rp_whiteforest_urfim = {Vector(1862, 3148, 75),Vector(1561, 3517, 75),Vector(2442, 3626, 91)},
	rp_city17_urfim_v2 = {Vector(4505, 1328, -340)},
	rp_mk_city17_urfim = {Vector(-4211, 13936, 3676),Vector(-4012, 14132, 3676),Vector(-4650, 14185, 3676)}
}



if !isSerious and !isIndsutrial then
rp.addTeam("Оперативник Лаборатории", {
	color = Color(0, 255, 255),
	model = "models/player/portal/male_02_aperture.mdl",
	description = [[]],
	weapons = {"swb_smg", "urf_foodsystem_ration_mpf", "fas2_mp5a5", "swb_p90"},
	spawns = outlaws_spawns,
	salary = 12,
	command = 'apat',
	faction = FACTION_APETIR,
	armor = 100,
	customCheck = function(ply) return (ply:GetOrg() == "Aperture Laboratory") or ply:SteamID() == "STEAM_0:0:87050152" or ply:SteamID() == "STEAM_0:1:197309592" or ply:SteamID() == "STEAM_0:1:17121679" or ply:SteamID() == "STEAM_0:0:195085261" or ply:SteamID() == "STEAM_0:1:105458183" or ply:SteamID() == "STEAM_0:0:440736288" or ply:SteamID() == "STEAM_0:0:72447515" or ply:IsRoot() end, 
	rationCount = 1,
	loyalty = 8
})
end


if !isSerious and !isIndsutrial then
TEAM_MLSOT = rp.addTeam("Младший сотрудник Лаборатории", {
	color = Color(0, 255, 255),
	model = "models/player/aphaztechs.mdl",
	description = [[]],
	weapons = {"lockpick","keypad_cracker","weapon_physcannon", "urf_foodsystem_ration_mpf", "swb_mp5", "weapon_medkit", "swb_shotgun"},
	spawns = outlaws_spawns,
	salary = 12,
	canDiplomacy = true,
	command = 'apat12',
	faction = FACTION_APETIR,
	armor = 200,
	customCheck = function(ply) return (ply:GetOrg() == "Aperture Laboratory") or ply:SteamID() == "STEAM_0:0:72447515" or ply:SteamID() == "STEAM_0:1:197309592" or ply:IsRoot() end, 
	rationCount = 1,
	loyalty = 8
})
end  

if !isSerious and !isIndsutrial then
rp.addTeam("Офицер-Оперативник Лаборатории", {
	color = Color(50, 200, 200),
	model = "models/player/portal/male_08_aperture.mdl",
	description = [[]],
	weapons = {"swb_xm1014", "weapon_bp_rtboicw"},
	spawns = outlaws_spawns,
	salary = 12,
	command = 'a23pat12',
	canDiplomacy = true,
	faction = FACTION_APETIR,
	armor = 100,
	customCheck = function(ply) return (ply:GetOrg() == "Aperture Laboratory") or ply:SteamID() == "STEAM_0:1:221127196" or ply:SteamID() == "STEAM_0:0:440736288" or ply:IsRoot() end, 
	rationCount = 1,
	loyalty = 8
})
end

if !isSerious and !isIndsutrial then
rp.addTeam("Искусственный-Интеллект Лаборатории", {
	color = Color(80, 200, 120),
	model = {"models/replic/t_replica.mdl"},
	description = [[  
	]],
	weapons = {"swb_m4a1"},
	salary = 20,
	spawn_points = rebel_points,
	armor = 500,
	command = "za23",
	unlockTime = 350 * 3600,
	vip = true,
	notDisguised = true,
	canDiplomacy = true,
	disableDisguise = true,
	spawns = outlaws_spawns,
	faction = FACTION_APETIR,
	rationCount = 1,
	loyalty = 5,
	customCheck = function(ply) return (ply:GetOrg() == 'Aperture Laboratory') or ply:SteamID() == "STEAM_0:0:139915283" or ply:SteamID() == "STEAM_0:0:182370394" or ply:SteamID() == "STEAM_0:1:197309592" or ply:SteamID() == "STEAM_0:0:18846468" or ply:SteamID() == "STEAM_0:1:89192639" or ply:SteamID() == "STEAM_0:1:171127452" or ply:IsRoot() end,
})
end  


rp.AddToRadioChannel(rp.GetFactionTeams({FACTION_APETIR}))
rp.AddDoorGroup('Laboratory', rp.GetFactionTeams({FACTION_APETIR, FACTION_HECE}))
