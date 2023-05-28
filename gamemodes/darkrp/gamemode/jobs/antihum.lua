local otaantihu_spawns = {
	rp_city17_urfim = {Vector(6039, -1986, 2180), Vector(6701, -1981, 2180)},
}
if !isSerious1 and !isIndsutrial1 then
TEAM_AH_OTA0 = rp.addTeam("C17.ANTI-HUMAN.Illustratum", {
    color = Color(70, 130, 180),
	model = {"models/bmscientistcits/p_female_02.mdl", "models/bmscientistcits/p_male_03.mdl"},
	description = [[ Вы помогаете юнитам ANTI-HUMAN поддерживаете их.
	Вас только набрали в ряды ANTI-HUMAN.
	Помогайте юнитам, что бы подняться в глазах Покровителей 

]],
	weapons = {"fas2_cweaponry_pp", "weapon_cuff_elastic", "weapon_radio", "swb_ar3"},
	salary = 10,
	command = "anthumota0",
	spawns = otaantihu_spawns,
	faction = FACTION_COMBINE,
	rationCount = 1,
	loyalty = 3,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	disableDisguise = true,
	armor = 100,
	stamina = 6,
	unlockTime = 50 * 3600,
	hpRegen = 2,
	randomName = true,
	reversed = true
})

rp.addTeam("OTA.ANTI-HUMAN.Rookie", {
    color = Color(70, 130, 180),
	model = {"models/dpfilms/metropolice/playermodels/pm_antihuman_police_female.mdl","models/dpfilms/metropolice/playermodels/pm_antihuman_police.mdl"},
	description = [[ Вы помогаете юнитам поддержки ANTI-HUMAN.
	Вас только набрали в ряды AH.
	Выполняйте все приказы и задания, для получения доверия среди юнитов! 

]],
	weapons = {"fas2_cweaponry_pph", "weapon_cuff_elastic", "weapon_radio", "weapon_medkit_fast", "weapon_medkit"},
	salary = 20,
	command = "anthu12",
	spawns = otaantihu_spawns,
	faction = FACTION_ANTIHUMAN,
	rationCount = 3,
	loyalty = 3,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	notDisguised = true,
	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname'  or ply:GetOrgData().Rank == 'Enlightenment'  or ply:GetOrgData().Rank == 'Elli' or ply:GetOrgData().Rank == 'All' or ply:GetOrgData().Rank == 'Mauris' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Adherent' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'Defesor' or ply:GetOrgData().Rank == 'Sancti' or ply:GetOrgData().Rank == 'Perveniens' or ply:GetOrgData().Rank == 'Deputy Assistant' or ply:GetOrgData().Rank == 'Sponsor'))
	 or rp.PlayerHasAccessToCustomJob({'OTA.ANTI-HUMAN.Rookie'}, ply:SteamID64()) or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') end, 
	armor = 150,
	stamina = 6,
	unlockTime = 50 * 3600,
	hpRegen = 3,
	randomName = true,
	reversed = true
})


TEAM_AH_OTA1 = rp.addTeam("OTA.ANTI-HUMAN.Novice", {
    color = Color(70, 130, 180),
	model = {"models/dpfilms/metropolice/playermodels/pm_police_fragger_fix.mdl", "models/dany/ah_new_novicible/ah_new_novicible.mdl"},
	description = [[ Вы новичок в своем деле, ваша задача слушать старших по званию и выполнять все приказы.
	 Вы юнит для подавления повстанцев и бунтуюших.
	Ваши действиям должны быть четкими и ясными.
		Также вы можете переодиваться в свою повседневную одежду

]],
	weapons = {"fas2_cweaponry_pp","fas2_cweaponry_pp2", "weapon_cuff_elastic", "weapon_radio"},
	salary = 25,
	command = "anthumota1",
	spawns = otaantihu_spawns,
	candisguise = true,
	disguise_faction = FACTION_CITIZEN,
	faction = FACTION_ANTIHUMAN,
	armor = 350,
	PlayerSpawn = function(ply) ply:SetRunSpeed(350) end,
	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname'  or ply:GetOrgData().Rank == 'Elli' or ply:GetOrgData().Rank == 'All' or ply:GetOrgData().Rank == 'Mauris' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Adherent' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'Defesor' or ply:GetOrgData().Rank == 'Sancti' or ply:GetOrgData().Rank == 'Perveniens' or ply:GetOrgData().Rank == 'Deputy Assistant' or ply:GetOrgData().Rank == 'Sponsor'))
		or ply:HasUpgrade('job_ota_one') or (not noDonate and rp.PlayerHasAccessToCustomJob({'Sponsop donat'}, ply:SteamID64())) or rp.PlayerHasAccessToCustomJob({'OTA.ANTI-HUMAN.Novice'}, ply:SteamID64()) or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') end, 
	rationCount = 1,
	stamina = 3,
	loyalty = 4,
	hpRegen = 2,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	randomName = true,
	reversed = true
})

TEAM_AH_OTA2 = rp.addTeam("OTA.ANTI-HUMAN.Soldier", {
    color = Color(70, 130, 180),
	model = {"models/bloocobalt/combine/combine_ows_fixed.mdl", "models/custom/ah_combine_soldier_rebel.mdl"},
	description = [[ После ожесточённого боя в одном из City с силами сопротивления, вас и еще несколько сотрудников нашли полуживым под обломками зданий.
	 Покровители увидели как усердно вы старались выжить, помочь своим соратникам и уничтожить каждого анти-коллаборациониста. 
	 Они вознаградили вас вторым шансом и дали показать свои возможности в отряде "Anti-Human". 
	 Теперь вы солдат и должны беспрекословно выполнять все приказы вышестоящих. 

]],
	weapons = {"fas2_cweaponry_psmg","fas2_cweaponry_pph","fas2_cweaponry_pdshotgun", "weapon_cuff_elastic", "weapon_radio"},
	salary = 20,
	max = 9,
	command = "anthumota2",
	spawns = otaantihu_spawns,
	armor = 450,
	PlayerSpawn = function(ply) ply:SetHealth(125) ply:SetMaxHealth(125) ply:SetRunSpeed(350)  end,
    customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname'  or ply:GetOrgData().Rank == 'Elli' or ply:GetOrgData().Rank == 'All' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Mauris' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'Adherent' or ply:GetOrgData().Rank == 'Defesor' or ply:GetOrgData().Rank == 'Sancti' or ply:GetOrgData().Rank == 'Deputy Assistant')) 
 or rp.PlayerHasAccessToCustomJob({'OTA.ANTI-HUMAN.Soldier'}, ply:SteamID64()) or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') end, 
	faction = FACTION_ANTIHUMAN,
	rationCount = 1,
	loyalty = 4,
	noHunger = true,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	stamina = 6,
	hpRegen = 3,
	randomName = true,
	reversed = true
})

TEAM_AH_OTA3 = rp.addTeam("OTA.ANTI-HUMAN.Elite", {
    color = Color(70, 130, 180),
	model = {"models/dany/anti_human_elite/anti_human_elite.mdl", "models/custom/ah_combine_super_soldier.mdl"},
	description = [[ Доказав своими действиями свою верность и честность Альянсу, вас переместили элитный бойцом в отряд "Anti-Human", чтобы вы и дальше искареняли все что может навредить Альянсу и руководили бойцами. 

]],
	weapons = {"fas2_cweaponry_pmg","fas2_cweaponry_pph","fas2_cweaponry_esr_v2", "ah_inviz_pro", "weapon_cuff_elastic", "weapon_radio", "climb_swep","door_ram"},
	salary = 30,
	command = "anthumota3",
	spawns = otaantihu_spawns,
	armor = 500,
	PlayerSpawn = function(ply) ply:SetHealth(135) end,
	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname'  or ply:GetOrgData().Rank == 'Elli' or ply:GetOrgData().Rank == 'All' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Mauris' or ply:GetOrgData().Rank == 'Defesor' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'Sancti' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Deputy Assistant')) 
	or ply:HasUpgrade('job_ota_three') or (not noDonate and rp.PlayerHasAccessToCustomJob({'Sponsop donat'}, ply:SteamID64())) or rp.PlayerHasAccessToCustomJob({'OTA.ANTI-HUMAN.Elite'}, ply:SteamID64()) or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') end, 
	faction = FACTION_ANTIHUMAN,
	rationCount = 1,
	max = 0,
	max = 5,
	noHunger = true,
	loyalty = 4,
	stamina = 6,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	hpRegen = 4,
	randomName = true,
	reversed = true
})

rp.addTeam("OTA.ANTI-HUMAN.Informer", {
    color = Color(70, 130, 180),
	model = {"models/bloocobalt/combine/combine_s_fixed.mdl", "models/bloocobalt/combine/combine_s_fixed.mdl"},
	description = [[ Ваши донесения всегда были очень полезны и помогали Альянсу в критических ситуациях, вас решили перенести в отряд Blade и сделали Spy, но после того как вы получили критическое ранение, Покровители решили чипировать вас и переместить в отряд "Anti-Human" и оборудовали лучшими оружиями и лучшей техникой.

]],
	weapons = {"fas2_cweaponry_pph","fas2_cweaponry_pshotgun", "weapon_cuff_elastic", "weapon_radio", "climb_swep","door_ram", "fas2_cweaponry_psr"},
	salary = 30,
	command = "anthumota4",
	hpRegen = 5,
	spawns = otaantihu_spawns,
	armor = 500,
	PlayerSpawn = function(ply) ply:SetHealth(145) end,
	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname'  or ply:GetOrgData().Rank == 'Elli' or ply:GetOrgData().Rank == 'All' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Mauris'  or ply:GetOrgData().Rank == 'Sponsor'  or ply:GetOrgData().Rank == 'Sancti' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Deputy Assistant')) 
 or rp.PlayerHasAccessToCustomJob({'OTA.ANTI-HUMAN.Informer'}, ply:SteamID64()) or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') end,
	faction = FACTION_ANTIHUMAN,
	canCapture = true,
	rationCount = 1,
	max = 0,
	max = 3,
	stamina = 6,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	noHunger = true,
	loyalty = 4,
	randomName = true,
	reversed = true
})

TEAM_AH_OTA5 = rp.addTeam("OTA.ANTI-HUMAN.Princeps", {
    color = Color(70, 130, 180),
	model = {"models/player/r6s_mute_fg01.mdl"},
	description = [[ Командный, тактический юнит. 
	Вы капитан отряда "Anti-Human", самый лучший боец отряда, закончивший более 100 миссий с успехом. 
	Вас признал весь Альянс и даже Central Commander относиться к вам с уважением.

]],
	weapons = {"fas2_cweaponry_dual_psmg","fas2_cweaponry_gl", "weapon_cuff_elastic", "weapon_radio","door_ram", "climb_swep"},
	salary = 30,
	max = 0,
	command = "anthumota5",
	hpRegen = 10,
	spawns = otaantihu_spawns,
	armor = 500,
	PlayerSpawn = function(ply) ply:SetHealth(160)  ply:SetRunSpeed(350) end,
	customCheck = function(ply) return CLIENT or ply:IsRoot() or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname'  or ply:GetOrgData().Rank == 'Elli'  or ply:GetOrgData().Rank == 'All' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'Mauris' or ply:GetOrgData().Rank == 'Deputy Assistant'))
	or ply:HasUpgrade('job_ota_five') or (not noDonate and rp.PlayerHasAccessToCustomJob({'Sponsop donat'}, ply:SteamID64())) or rp.PlayerHasAccessToCustomJob({'OTA.ANTI-HUMAN.Princeps'}, ply:SteamID64()) or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') end, 
	faction = FACTION_ANTIHUMAN,
	canCapture = true,
	rationCount = 1,
	max = 4,
	noHunger = true,
	stamina = 4,
	vip = true,
	loyalty = 4,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	randomName = true,
	reversed = true
}) 


TEAM_AH_OTA4 = rp.addTeam("C17.ANTI-HUMAN.Элли Олдерни", {
    color = Color(255, 69, 0),
	model = "models/heartbit_female_maintenance.mdl",
	description = [[ Элли - Прекрасная дева, которая была восстановлена из пепла. Пока ученые в Нова-Проспект, трудились над новыми солдатами, сам Олдерни, занялся созданием клона, своей возлюбленной, он вкладывал столько усилий, сколько требовалось от него. Каждый день он создавал свою любимую Элли, по маленькому кусочку и спустя долгие три месяца, спустя столько пролитой крови и пота, он смог создать идеальную копию Элли, которую сразу оживил. Но он не смог вернуть в неё все воспоминания и душу. Внешне идеальная дева, а внутри пустая болванка с кучей бесполезной информации. И даже будучи почти человеком, клон Элли, не был так-же мил, добр и нежен, что печалило Олдерни. Ему ничего не оставалось, как запереть её в "четырех стенах" Цитадели, что бы она помогала бойцам дивизиона, советами, заданиями и спец.возможностями.

	]],
	weapons = {"fas2_cweaponry_pp2", "weapon_radio", "weapon_cuff_elastic", "ah_inviz_pro"},
	salary = 50,
	command = "antycall",
	max = 1,
	stamina = 7,
	vip = true,
	hpRegen = 15,
	spawns = otaantihu_spawns,
	armor = 100,
	PlayerSpawn = function(ply) ply:SetRunSpeed(400) ply:SetMaxHealth(100) end,
	customCheck = function(ply) return CLIENT or ply:IsRoot() 
	or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname' or ply:GetOrgData().Rank == 'All' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'Elli' or ply:GetOrgData().Rank == 'Deputy Assistant'))
 or rp.PlayerHasAccessToCustomJob({'C17.ANTI-HUMAN.Элли Олдерни'}, ply:SteamID64()) or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') end,
	faction = FACTION_ANTIHUMAN,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	rationCount = 1,
	loyalty = 4
})

rp.addTeam("OTA.ANTI-HUMAN.Savior", {
    color = Color(100, 149, 237),
	model = {"models/dany/combine_comando/combine_comando_forses.mdl"},
	description = [[ Спец боец, самый сильный из юнитов ANTI-HUMAN, в него встроено специльныю модуль, который увеличивает скорость и броню при его появлении в городе!
	]],
	weapons = {"fas2_cweaponry_rl", "fas2_cweaponry_pdshotgun", "fas2_cweaponry_pmg", "weapon_cuff_elastic", "weapon_radio", "sh_blinkswep"},
	salary = 32,
	command = "antysavior",
	max = 2,
	stamina = 5,
	vip = true,
	hpRegen = 13,
	spawns = otaantihu_spawns,
	armor = 250,
	PlayerSpawn = function(ply) ply:SetHealth(170) ply:SetRunSpeed(350)  end,
	customCheck = function(ply) return CLIENT or ply:IsRoot() 
	or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'Deputy Assistant'))
 or rp.PlayerHasAccessToCustomJob({'OTA.ANTI-HUMAN.Savior'}, ply:SteamID64()) or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') end,
	faction = FACTION_ANTIHUMAN,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	rationCount = 1,
	loyalty = 4
})

TEAM_AH_OTA7 = rp.addTeam("С17.ANTI-HUMAN.Creator", {
    color = Color(127, 255, 212),
	model = "models/dany/combine_anti_human.mdl",
	description = [[ Создатель всех юнитов АХ, он помогает и защишает своих юнитов давая бафы.

	Его настоящее имя Олдерн
	Олдерни - Основатель Дивизиона и Проекта "ANTI-HUMAN", бывший ученый "Черной Мезы", выживший и принявший сомнительно выгодный контракт с Альянсом, чем обеспечил себе ресурсы, время и свободу, но при этом и условие - создать Элитный Дивизион Патруля Альянса, для подавления бунтов и повстанческого движения. По итогу, сам Олдерни стал мозгом и главой Дивизиона, закончив множество проектов, он решил занять пост Диспетчера Дивизиона, управляя напрямую всеми юнитами "ANTI-HUMAN"

	]],
	weapons = {"fas2_cweaponry_pph", "weapon_radio", "door_ram", "sh_blinkswep", "weapon_cuff_elastic"},
	salary = 50,
	command = "antycreator",
	max = 1,
	stamina = 7,
	vip = true,
	hpRegen = 15,
	spawns = otaantihu_spawns,
	armor = 100,
	PlayerSpawn = function(ply) ply:SetRunSpeed(350)  end,
	customCheck = function(ply) return CLIENT or ply:IsRoot() 
	or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'Deputy Assistant')) 
 or rp.PlayerHasAccessToCustomJob({'С17.ANTI-HUMAN.Creator'}, ply:SteamID64()) or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') end,
	faction = FACTION_ANTIHUMAN,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	rationCount = 1,
	loyalty = 4
})


local rebel_spawns = {
	rp_c18_divrp = {Vector(-1990, 3538, 872),Vector(-1993, 3348, 872),Vector(-1364, 3348, 900),Vector(-1358, 3597, 900),Vector(-1620, 3480, 872),Vector(-1671, 3625, 872),},
	rp_city8_urfim = {Vector(3064, 809, -4),Vector(2941, 809, -4),Vector(2940, 706, -4),Vector(3083, 706, -4)},
	rp_city17_build210 = rp.GetSpawnPoint(SPAWN_D6),
	rp_city17_urfim = rp.GetSpawnPoint(SPAWN_D6),
	rp_industrial17_urfim = rp.GetSpawnPoint(SPAWN_D6),
	rp_city17_urfim_v2 = {Vector(-4572, -801, 0)},
	rp_whiteforest_urfim = {Vector(-2640, 12155, -320), Vector(-2445, 12336, -320), Vector(-2332, 12127, -320), Vector(-1145, 9745, -320),Vector(-1349, 9396, -320), Vector(-1615, 10572, -320)},
	rp_mk_city17_urfim = {Vector(-3215, 12670, 2621),Vector(-3233, 12775, 2621),Vector(-3349, 12750, 2621), Vector(-3604, 12733, 2621), Vector(-3271, 13016, 2621), Vector(-3416, 13156, 2621), Vector(-3334, 13271, 2621)},
}

TEAM_AH_OTA11 = rp.addTeam("Rebel.ANTI-HUMAN.Cell", {
    color = Color(72, 61, 139),
	model = "models/dany/anti_human_cell/anti_human_cell.mdl",
	description = [[ Целл была мастером снайперского боя и ярая любительница автоматического оружия, а так-же очень общительная девушка, которая всегда до жути любила "потрещать" с другими членами Сопротивления, по поводу кулинарии и оружия.

	]],
	weapons = {"fas2_cweaponry_pdshotgun", "fas2_cweaponry_pph", "weapon_medkit_fast",  "sh_blinkswep", "fas2_cweaponry_esr_v2", "fas2_cweaponry_ar3", "salute"},
	salary = 20,
	command = "antyccell",
	max = 2,
	candisguise = true,
	disguise_faction = FACTION_ANTIHUMAN,
	stamina = 7,
	disableDisguise = true,
	vip = true,
	hpRegen = 4,
	spawns = rebel_spawns,
	armor = 350,
	PlayerSpawn = function(ply) ply:SetHealth(120) ply:SetRunSpeed(350)  end,
	customCheck = function(ply) return ply:IsRoot() 
	or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Deputy Assistant' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'Cell'  or ply:GetOrgData().Rank == 'All' or ply:GetOrgData().Rank == 'Cell+Zell')) 
 or rp.PlayerHasAccessToCustomJob({'Rebel.ANTI-HUMAN.Cell'}, ply:SteamID64()) or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') end,
	faction = FACTION_REBEL,
	notDisguised = true,
	hitman = true,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	rationCount = 1,
	loyalty = 7
})

rp.addTeam("Rebel.ANTI-HUMAN.Zell", {
    color = Color(72, 61, 139),
	model = "models/player/hl2ac_combine_sniper_male_s1.mdl",
	description = [[ Зелл был мастером боевых искусств, снайперских боев и загадок. Сам Зелл, очень молчалив и всегда сосредоточен на боевых задачах. Веселье и неадекватное поведение - для него просто невозможно.
	]],
	weapons = {"fas2_cweaponry_pshotgun", "fas2_cweaponry_pph", "weapon_medkit_fast", "climb_swep", "ah_inviz_pro", "fas2_cweaponry_esr_v2", "weapon_lordi_sledgehammer", "salute", "fas2_cweaponry_pmp"},
	salary = 20,
	command = "antyzell",
	max = 2,
	hitman = true,
	stamina = 7,
	hpRegen = 4,
	vip = true,	
	disableDisguise = true,
	candisguise = true,
	disguise_faction = FACTION_ANTIHUMAN,	
	spawns = rebel_spawns,
	armor = 350,
	PlayerSpawn = function(ply) ply:SetHealth(120) ply:SetRunSpeed(350)  end,
	customCheck = function(ply) return ply:IsRoot() 
	or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Deputy Assistant' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'Zell' or ply:GetOrgData().Rank == 'All' or ply:GetOrgData().Rank == 'Cell+Zell'))
 or rp.PlayerHasAccessToCustomJob({'Rebel.ANTI-HUMAN.Zell'}, ply:SteamID64()) or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') end,
	faction = FACTION_REBEL,
	notDisguised = true,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	rationCount = 1,
	loyalty = 7
})
end 

local speed = rp.cfg.RunSpeed
local team_NumPlayers = team.NumPlayers
hook.Add("PlayerLoadout", function(ply)
	if (ply:GetFaction() == FACTION_ANTIHUMAN) && team_NumPlayers(TEAM_AH_OTA7) > 0 then
		ply:SetRunSpeed(speed * 1.5)
		rp.Notify(ply, NOTIFY_GREEN, rp.Term('AntihumanSpeedBoost'))
		ply:GiveArmor(100)
	end
end) 
/*

if !isSerious and !noDonate then
TEAM_cSC2 = rp.addTeam("OSD.Security Officer", {
    color = Color(255, 0, 0),
	model = "models/ninja/rage_enforcer.mdl",
	description = [[
	]],
	weapons = {"swb_xm1014", "fas2_cweaponry_pmg", "weapon_radio"},
	salary = 32,
	command = "csc2",
	max = 1,
	hpRegen = 1,
	spawns = otaantihu_spawns,
	armor = 500,
	customCheck = function(ply) return rp.PlayerHasAccessToCustomJob({'OSD.Security Officer'}, ply:SteamID64())  or ply:IsRoot() end,
	faction = FACTION_ANTIHUMAN,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	rationCount = 1,
	notDisguised = true,
	loyalty = 4
})
end 


if !isSerious and !noDonate then
rp.addTeam("OTA. OGS. Squib", {
    color = Color(255, 0, 0),
	model = {"models/player/combine_elite_guard_armored_fix.mdl","models/player/combine_prisonguard_themanclaw.mdl"},
	description = [[
	]],
	weapons = {"fas2_cweaponry_pdshotgun", "cloaking-10seconds_new", "sh_blinkswep", "weapon_radio"},
	salary = 32,
	command = "c3123",
	max = 1,
	spawns = otaantihu_spawns,
	armor = 500,
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetMaxHealth(150)  end,
	customCheck = function(ply) return rp.PlayerHasAccessToCustomJob({'OTA. OGS. Squib'}, ply:SteamID64()) or ply:IsRoot() end,
	faction = FACTION_ANTIHUMAN,
	CustomCheckFailMsg = 'OTA.Anti-Human',
	rationCount = 1,
	loyalty = 4,
	notDisguised = true,
})
end 
*/

local zombie_spawns = {
	rp_c18_divrp = {Vector(-3864, 3699, 573), Vector(-3551, 3692, 573), Vector(-3253, 3696, 573),},
	rp_city17_build210 = {Vector(64, 8208, -466), Vector(64, 8086, -466), Vector(64, 7966, -466), Vector(279, 8220, -466)},
	rp_city17_urfim = {Vector(1792, 1875, -466), Vector(1989, 135, -466), Vector(-294, -1251, -466), Vector(-259, -3470, -466), Vector(-1974, -5097, -466), Vector(-2980, -6126, -466)},
	rp_industrial17_urfim = {Vector(5209, 4169, 0), Vector(3529, 2471, -136), Vector(6102, 3787, -384)},
	rp_city8_urfim = {Vector(-1371, 3, -599), Vector(-1482, 135, -600), Vector(-2588, -216, -626)},
	rp_city17_urfim_v2 = {Vector(3429, 7225, -415)},
	rp_whiteforest_urfim = {Vector(4834, -1631, 195), Vector(5796, -1596, 194), Vector(5502, -1051, 191),Vector(6184, -1117, 191),Vector(5822, -1584, 195)},
	rp_mk_city17_urfim = {Vector(-2391, 13953, 2621),Vector(-217, 13890, 2701),Vector(746, 13681, 2731), Vector(510, 11755, 2717)},
	
}

if !isSerious and !isIndsutrial then
TEAM_ZOMBW = rp.addTeam("ZOMBIE.ANTI-HUMAN.Walrider", {
	color = Color(107, 142, 35),
	model = "models/immigrant/outlast/walrider_pm.mdl",
	description = [[ Результат эксперимента профессора Олдерни по созданию сыворотки для нового поколения солдат который пошел совсем не по плану у подопытного выявились обширные мутации и деградация мозга до примитивных функций, хотя остатки мыслительной деятельности на новом хищном уровне остались, после заморозки проекта во время транспортировки объекту удалось сбежать, с тех пор этот монстр поселился в канализации и охотится
]],
	weapons = {"weapon_torso_guard", "ah_inviz_pro", "weapon_throw_toxic"},
	command = "ahwaldrider",
	spawns = zombie_spawns,
	salary = 37,
	faction = FACTION_ZOMBIE,
	max = 2,
	hpRegen = 10,
	punchMin = 125,
	punchMax = 200,
	critMin = 300,
	critMax = 350,	
	disableDisguise = true,
	build = false,
	unlockTime = 300 * 3600,
	armor = 500,
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetMaxHealth(150) ply:SetRunSpeed(500) end,
	customCheck = function(ply) return ply:IsRoot() 
	or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Deputy Assistant' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'ZombiAH' or ply:GetOrgData().Rank == 'All'))
 or rp.PlayerHasAccessToCustomJob({'ZOMBIE.ANTI-HUMAN.Walrider'}, ply:SteamID64()) or ply:HasUpgrade('job_ota_zombi') or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') or ply:SteamID() == "STEAM_0:0:445131573" end,
	vip = true,
	stamina = 4,
	rationCount = 1,
	loyalty = 6
})
end

if !isSerious and !noDonate then
TEAM_MOPS = rp.addTeam('Мопс', {
	color = Color(255, 250, 250),
	model = 'models/dog/pug.mdl',
	description = [[Милый мопс Cell и Zell.

]],
	weapons = {'weapon_dogswep'},
	command = 'dog2',
	spawn_points = rebel_points,
	max = 1,
	salary = 47,
	notDisguised = true,
	spawns = rebel_spawns,
	candemote = false,
	customCheck = function(ply) return ply:IsRoot() 
	or (ply:GetOrg() == 'OTA Anti-Human' && (ply:GetOrgData().Rank == 'Noname' or ply:GetOrgData().Rank == 'SuperSponsor' or ply:GetOrgData().Rank == 'Deputy Assistant' or ply:GetOrgData().Rank == 'Management team' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Composition' or ply:GetOrgData().Rank == 'All' or ply:GetOrgData().Rank == 'Cell+Zell')) 
 or rp.PlayerHasAccessToCustomJob({'Мопс'}, ply:SteamID64()) or ply:IsRank('globalcontributor') or ply:IsRank('platinumcontributor')  or ply:IsRank('goldencontributor') or ply:IsRank('vip+') end,
	spawns = rebel_spawns,
	PlayerSpawn = function(pl)
		pl:SetHealth(200)
		pl:SetMaxHealth(200)
		ply:SetRunSpeed(350)
	end,
	build = false,
	faction = FACTION_REBEL,
})

local speed = rp.cfg.RunSpeed
local team_NumPlayers = team.NumPlayers
hook.Add("PlayerLoadout", function(ply)
	if (ply:GetFaction() == FACTION_REBEL) && team_NumPlayers(TEAM_MOPS) > 0 then
		ply:SetRunSpeed(speed * 1.6)
		rp.Notify(ply, NOTIFY_GREEN, rp.Term('AntihumanSpeedBoost2'))
		ply:GiveArmor(100)
		ply:GiveHealth(35)
	end
end) 
end

if !isSerious and !noDonate then
rp.SetFactionVoices({FACTION_ANTIHUMAN}, {
            {
				label = 'Бунтарь', 
				sound = 'npc/combine_soldier/vo/boomer.wav',
				text = 'Бунтарь!'
			},
			{
				label = 'Чисто', 
				sound = 'npc/combine_soldier/vo/cleaned.wav',
				text = 'Чисто!'
			},
			{
				label = 'Заключение', 
				sound = 'npc/combine_soldier/vo/closing.wav',
				text = 'Заключить!'
			},
			{
				label = 'Контакт', 
				sound = 'npc/combine_soldier/vo/contact.wav',
				text = 'Есть контакт!'
			},
			{
				label = 'Задержать', 
				sound = 'npc/combine_soldier/vo/contained.wav',
				text = 'Задержать!'
			},
			{
				label = 'Повтори', 
				sound = 'npc/combine_soldier/vo/copythat.wav',
				text = 'Повтори!'
			},
			{
				label = 'В укрытие', 
				sound = 'npc/combine_soldier/vo/coverhurt.wav',
				text = 'Всем укрыться!'
			},
			
			{
				label = 'Врываемся', 
				sound = 'npc/combine_soldier/vo/dash.wav',
				text = 'Врываемся!'
			},
			{
				label = 'Подражатель', 
				sound = 'npc/combine_soldier/vo/echo.wav',
				text = 'Подражатель!'
			},
			{
				label = 'Очаровательно', 
				sound = 'npc/combine_soldier/vo/engaging.wav',
				text = 'Очаровательно!'
			},
			{
				label = 'Вспышка', 
				sound = 'npc/combine_soldier/vo/flash.wav',
				text = 'Вспышка!'
			},
			{
				label = 'Чисто', 
				sound = 'npc/combine_soldier/vo/flatline.wav',
				text = 'Можно идти!'
			},
			{
				label = 'Призрак', 
				sound = 'npc/combine_soldier/vo/ghost.wav',
				text = 'Призрак!'
			},
			{
				label = 'Сетка', 
				sound = 'npc/combine_soldier/vo/grid.wav',
				text = 'Тут сетка!'
			},
			{
				label = 'Медик', 
				sound = 'npc/combine_soldier/vo/helix.wav',
				text = 'МЕДИК!'
			},
			{
				label = 'Прибывший', 
				sound = 'npc/combine_soldier/vo/inbound.wav',
				text = 'Ей, прибывший!'
			},
			{
				label = 'Заражение', 
				sound = 'npc/combine_soldier/vo/infected.wav',
				text = 'Он заражен!'
			},
			{
				label = 'Юниты прибывают', 
				sound = 'npc/combine_soldier/vo/unitisinbound.wav',
				text = 'Юниты уже прибывают!'
			},
			{
				label = 'Юнит движется', 
				sound = 'npc/combine_soldier/vo/unitismovingin.wav',
				text = 'Юнит движется вперед!'
			},
			{
				label = 'Осуждение', 
				sound = 'npc/combine_soldier/vo/judge.wav',
				text = 'Осуждение!'
			},
			{
				label = 'Лидер', 
				sound = 'npc/combine_soldier/vo/leader.wav',
				text = 'Лидер!'
			},
			{
				label = 'Нет контакта', 
				sound = 'npc/combine_soldier/vo/lostcontact.wav',
				text = 'Контакт потерян!'
			},
			{
				label = 'Проходи', 
				sound = 'npc/combine_soldier/vo/movein.wav',
				text = 'Проходи!'
			},
			{
				label = 'Бродяга', 
				sound = 'npc/combine_soldier/vo/nomad.wav',
				text = 'Бродяга!'
			},
			{
				label = 'Взрыв', 
				sound = 'nnpc/combine_soldier/vo/outbreak.wav',
				text = 'Взрыв!'
			},
			{
				label = 'Возвращаемся', 
				sound = 'npc/combine_soldier/vo/payback.wav',
				text = 'Возвращаемся!'
			},
			{
				label = 'Фантом', 
				sound = 'npc/combine_soldier/vo/phantom.wav',
				text = 'Фантом!'
			},
			{
				label = 'Преследовать', 
				sound = 'npc/combine_soldier/vo/procecuting.wav',
				text = 'Преследуем его!'
			},
			{
				label = 'Ловушка', 
				sound = 'npc/combine_soldier/vo/quicksand.wav',
				text = 'Это ловушка!'
			},
			{
				label = 'Найти', 
				sound = 'npc/combine_soldier/vo/range.wav',
				text = 'Прочешите здесь все!'
			},
			{
				label = 'Приготовить взрывчатку', 
				sound = 'npc/combine_soldier/vo/readycharges.wav',
				text = 'Приготовить взрывчатку!'
			},
			{
				label = 'Приготовить оружие', 
				sound = 'npc/combine_soldier/vo/readyweapons.wav',
				text = 'Приготовить оружие!'
			},
			
			{
				label = 'Здесь чисто', 
				sound = 'npc/combine_soldier/vo/reportingclear.wav',
				text = 'Докладываю, здесь чисто!'
			},
			{
				label = 'Дикарь', 
				sound = 'npc/combine_soldier/vo/savage.wav',
				text = 'Дикарь!'
			},

			{
				label = 'Сектор не стерилен', 
				sound = 'npc/combine_soldier/vo/confirmsectornotsterile.wav',
				text = 'Сектор не стерилен!'
			},
			{
				label = 'Охрана Сектора', 
				sound = 'npc/combine_soldier/vo/sectorisnotsecure.wav',
				text = 'Сектор под охраной!'
			},
			{
				label = 'Охранять', 
				sound = 'npc/combine_soldier/vo/secure.wav',
				text = 'Охранять!'
			},
			{
				label = 'Опасная Зона', 
				sound = 'npc/combine_soldier/vo/sharpzone.wav',
				text = 'Здесь опасная зона!'
			},
			{
				label = 'Мина', 
				sound = 'npc/combine_soldier/vo/slam.wav',
				text = 'Здесь мина!'
			},
			{
				label = 'Стой', 
				sound = 'npc/combine_soldier/vo/standingby].wav',
				text = 'Стой на месте'
			},
			{
				label = 'Внимательнее', 
				sound = 'npc/combine_soldier/vo/stayalert.wav',
				text = 'Будь внимательнее!'
			},
			{
				label = 'Попал ', 
				sound = 'npc/combine_soldier/vo/striker.wav',
				text = 'Я попал!'
			},
			{
				label = 'Зачищаю', 
				sound = 'npc/combine_soldier/vo/sweepingin.wav',
				text = 'Зачищаю!'
			},
			{
				label = 'Быстрее', 
				sound = 'npc/combine_soldier/vo/swift.wav',
				text = 'Давай быстрее!'
			},
			
			{
				label = 'Займите Позиции', 
				sound = 'npc/combine_soldier/vo/stabilizationteamholding.wav',
				text = 'Группа захвата, займите позиции!'
			},
			{
				label = 'Маскировка', 
				sound = 'npc/combine_soldier/vo/uniform.wav',
				text = 'Это маскировка!'
			},
			{
				label = 'Наблюдаю', 
				sound = 'npc/combine_soldier/vo/visualonexogen.wav',
				text = 'Наблюдаю за обьектом!'
			},
			{
				label = 'Вот и все', 
				sound = 'npc/combine_soldier/vo/thatsitwrapitup.wav',
				text = 'Что ж, вот и все!'
			},
			{
				label = 'Код Меч', 
				sound = 'npc/combine_soldier/vo/sword.wav',
				text = 'Код : Меч!'
			},
			{
				label = 'Код Нова', 
				sound = 'npc/combine_soldier/vo/nova.wav',
				text = 'Код : Нова!'
			},
			{
				label = 'Код Нож', 
				sound = 'npc/combine_soldier/vo/stab.wav',
				text = 'Код : Нож'
			},
			{
				label = 'Код Зачистка', 
				sound = 'npc/combine_soldier/vo/sweeper.wav',
				text = 'Код : Зачистка!'
			},
			{
				label = 'Код Закат', 
				sound = 'npc/combine_soldier/vo/sundown.wav',
				text = 'Код : Закат!'
			},
			{
				label = 'Код Отсечь', 
				sound = 'npc/combine_soldier/vo/slash.wav',
				text = 'Код : Отсечь'
			},
			{
				label = 'Код Тень', 
				sound = 'npc/combine_soldier/vo/shadow.wav',
				text = 'Код : Тень!'
			},
			{
				label = 'Код Жнец', 
				sound = 'npc/combine_soldier/vo/reaper.wav',
				text = 'Код : Жнец!'
			},
			{
				label = 'Код Бритва', 
				sound = 'npc/combine_soldier/vo/razor.wav',
				text = 'Код : Бритва!'
			},
			{
				label = 'Код Булава', 
				sound = 'npc/combine_soldier/vo/mace.wav',
				text = 'Код : Булава!'
			},
			{
				label = 'Код Ураган', 
				sound = 'npc/combine_soldier/vo/hurricane.wav',
				text = 'Код : Ураган!'
			},
			{
				label = 'Код Молот', 
				sound = 'npc/combine_soldier/vo/hammer.wav',
				text = 'Код : Молот!'
			},
			{
				label = 'Код Кинжал', 
				sound = 'npc/combine_soldier/vo/dagger.wav',
				text = 'Код : Кинжал!'
			},
			{
				label = 'Код Антисептик',
				sound = 'npc/combine_soldier/vo/antiseptic.wav',
				text = 'Код : Антисептик!'
			},
			{
				label = 'Код Апекс', 
				sound = 'npc/combine_soldier/vo/apex.wav',
				text = 'Код : Апекс!'
			},
})

rp.AddDoorGroup('OTA.Anti-Human', rp.GetFactionTeams({FACTION_ANTIHUMAN}))

rp.AddToRadioChannel(rp.GetFactionTeams({FACTION_ANTIHUMAN}))

rp.AddRelationships(TEAM_AH_OTA7,  RANK_LEADER, {FACTION_COMBINE, FACTION_OTA, FACTION_DPF, FACTION_HELIX, FACTION_GUARD, FACTION_ANTIHUMAN})

rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_ANTIHUMAN})))
end