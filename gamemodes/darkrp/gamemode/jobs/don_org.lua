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
--

--9-th Legion

--

local legion_spawns = {
	rp_city17_urfim = {Vector(5614.711426,-1268.037109,12.031250), Vector(5610.963379,-1180.394287,12.031250), Vector(5541.260742,-1183.052612,12.031250), Vector(5543.654785,-1249.694092,12.031250)},
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

local pulp_spawns = {
	rp_city17_urfim = {Vector(-5372.442383,-5640.438477,80.031250)},
}
if !isSerious and !isIndsutrial then
TEAM_SWAT = rp.addTeam("Информатор", {
    color = Color(128, 0, 128),
	model = {"models/player/swat.mdl","models/player/riot.mdl", "models/gascit3/gascit3.mdl"},
	description = [[
]],
	weapons = {"swb_usp", "swb_smg", "swb_shotgun", "swb_m4a1"},
	salary = 10,
	command = "sw2a23t",
	CustomCheckFailMsg = 'New Order',
	unlockTime = 190 * 3600,
	spawns = pulp_spawns,
	candisguise = true,
	disguise_faction = FACTION_CITIZEN,		
	vip = true,
	armor = 150,
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:GiveArmor(150) end,
	customCheck = function(ply) return (ply:GetOrg() == "The New Order") or ply:SteamID() == "STEAM_0:0:172256227" or ply:SteamID() == "STEAM_0:0:445131573" or ply:SteamID() == "STEAM_0:0:231675719" or ply:SteamID() == "STEAM_0:0:206926999" or ply:SteamID() == "STEAM_0:1:167352045" or ply:SteamID() == "STEAM_0:0:179274506" or ply:SteamID() == "STEAM_0:0:162936594" or ply:SteamID() == "STEAM_0:1:27605715" or ply:SteamID() == "STEAM_0:0:465993930" or ply:IsRoot() end,
	faction = FACTION_PULP,
	rationCount = 1,
	loyalty = 5
})


TEAM_S1234 = rp.addTeam("Довоенный спецназ", {
    color = Color(128, 0, 128),
	model = {"models/player/swat.mdl","models/player/riot.mdl"},
	description = [[
]],
	weapons = {"swb_ar3", "weapon_frag", "swb_p90","swb_m3super90"},
	salary = 14,
	vip = true,
	command = "s1wa3t",
	CustomCheckFailMsg = 'New Order',
	spawns = pulp_spawns,
	armor = 350,
	PlayerSpawn = function(ply) ply:SetMaxHealth(100) ply:SetRunSpeed(300) end,
	customCheck = function(ply) return CLIENT or (ply:GetOrg() == "The New Order" && (ply:GetOrgData().Rank == 'Co-Leader' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'SWAT+Combine' or ply:GetOrgData().Rank == 'Inquisitor' or ply:GetOrgData().Rank == 'Veteran' or ply:GetOrgData().Rank == 'Liberator' or ply:GetOrgData().Rank == 'Pre-War SWAT' or ply:GetOrgData().Rank == 'Leader')) or ply:SteamID() == "STEAM_0:0:206926999"  or ply:SteamID() == "STEAM_0:0:445131573" or ply:SteamID() == "STEAM_0:0:172256227" or ply:SteamID() == "STEAM_0:0:99555324" or ply:SteamID() == "STEAM_0:1:197871680" or ply:SteamID() == "STEAM_0:0:179274506"  or ply:SteamID() == "STEAM_0:1:167352045" or ply:SteamID() == "STEAM_0:1:27605715" or ply:SteamID() == "STEAM_0:0:181738416" or ply:IsRoot() end,
	faction = FACTION_PULP,
	unlockTime = 245 * 3600,
	rationCount = 1,
	loyalty = 9
})

TEAM_SWAT_VET = rp.addTeam("Боец Поддержки", {
    color = Color(128, 0, 128),
	model = {"models/player/gasmask.mdl"},
	description = [[
]],
	weapons = {"swb_mac10", "weapon_frag", "weapon_medkit"},
	salary = 13,
	max = 6,
	vip = true,
	command = "swatmed",
	spawns = pulp_spawns,
	armor = 350,
	candisguise = true,
	disguise_faction = FACTION_COMBINE,		
	CustomCheckFailMsg = 'New Order',
	PlayerSpawn = function(ply) ply:SetMaxHealth(100) end,
	customCheck = function(ply) return CLIENT or (ply:GetOrg() == "The New Order" && (ply:GetOrgData().Rank == 'Co-Leader' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'SWAT+Combine' or ply:GetOrgData().Rank == 'Inquisitor' or ply:GetOrgData().Rank == 'Veteran' or ply:GetOrgData().Rank == 'Liberator' or ply:GetOrgData().Rank == 'Leader'))  or ply:SteamID() == "STEAM_0:1:167352045" or ply:SteamID() == "STEAM_0:0:206926999"  or ply:SteamID() == "STEAM_0:0:445131573" or ply:SteamID() == "STEAM_0:0:172256227"  or ply:SteamID() == "STEAM_0:0:179274506"
	or ply:SteamID() == "STEAM_0:1:17121679" 
    or ply:SteamID() == "STEAM_0:1:27605715"	
	or ply:SteamID() == "STEAM_0:1:212887019" 
	or ply:IsRoot() end,
	faction = FACTION_PULP,
	canCapture = true,
	unlockTime = 320 * 3600,
	rationCount = 1,
	loyalty = 7
})

TEAM_SWAT_SM = rp.addTeam("S.M.I.T.", {
    color = Color(128, 0, 128),
	model = {"models/players/outlaw/bmsfemassasin.mdl"},
	description = [[ "Леди"
- бойцы отряда, в основном охраняющие Консула/АГ от повстанцев и ампутации со стороны ГО. Более спокойны и сдержаны, способны долгое время сидеть на одном месте и ждать.

"Гроза"
- Бойцы S.M.I.T., посвятившие жизнь устранению определённых целей. В основном сидят на крышах или на стенах, часто меняя положения и докладывая об обстановке, но могут ликвидировать нарушителей

"Таура"
- вечно движущиеся бойцы, занимающиеся как разведкой, так и нападениями. В основном ведут свои дела в помещениях, хорошо ориентируясь в пространстве и запоминая дороги.
]],
	weapons = {"weapon_bp_sniper","swb_tmp", "swb_knife","climb_swep","swb_usp", "weapon_m82", "cloaking-10seconds", "vss_custom"},
	salary = 14,
	stamina = 4,
	max = 1,
	vip = true,
	command = "swatsm",
	notDisguised = true,
	spawns = pulp_spawns,
	CustomCheckFailMsg = 'New Order',
	armor = 350,
	PlayerSpawn = function(ply) ply:SetRunSpeed(350) ply:SetMaxHealth(150) ply:SetHealth(150) end,
	customCheck = function(ply) return (ply:GetOrg() == "The New Order" && (ply:GetOrgData().Rank == 'Co-Leader' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Leader' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Leader')) or ply:SteamID() == "STEAM_0:0:172256227"  or ply:SteamID() == "STEAM_0:1:167352045" or ply:SteamID() == "STEAM_0:0:179274506" or ply:SteamID() == "STEAM_0:0:206926999"  or ply:SteamID() == "STEAM_0:0:445131573"
	or ply:SteamID() == "STEAM_0:1:219739348" 
	or ply:SteamID() == "STEAM_0:0:120669385"
	or ply:SteamID() == "STEAM_0:1:109039575"
	or ply:SteamID() == "STEAM_0:0:441756207"
	or ply:SteamID() == "STEAM_0:1:552090938"
	or ply:SteamID() == "STEAM_0:0:205323204"
	 or ply:SteamID() == "STEAM_0:1:27605715"
	or ply:SteamID() == "STEAM_0:0:94737103"  
	or ply:SteamID() == "STEAM_0:1:433186291"
	or ply:SteamID() == "STEAM_0:1 228135678"
	or ply:SteamID() == "STEAM_0:1:209544128"
	or ply:IsRoot() end,
	faction = FACTION_PULP,
	unlockTime = 350 * 3600,
	rationCount = 1,
	loyalty = 4
})

TEAM_SWAT_INK = rp.addTeam("Инквизитор", {
    color = Color(128, 0, 128),
	model = "models/player/bobert/mhwsmc.mdl",
	description = [[Наёмный убийца, некогда элитный снайпер Альянса, давший волю чувствам.]],
	weapons = {"weapon_pistol", "swb_ar3", "swb_knife", "climb_swep", "weapon_bp_flaregun", "fas2_cweaponry_pdshotgun"},
	salary = 14,
	max = 1,
	command = "i3n1q",
	vip = true,
	spawns = pulp_spawns,
	candisguise = true,
	disguise_faction = FACTION_CWU,
	canDiplomacy = true,
	armor = 450,
	CustomCheckFailMsg = 'New Order',
	PlayerSpawn = function(ply) ply:SetMaxHealth(150)  ply:SetHealth(150) ply:SetRunSpeed(310)
	ply:SetBodygroup(0, 2)
	ply:SetBodygroup(1, 2)
		end,
	customCheck = function(ply) return CLIENT or (ply:GetOrg() == "The New Order" && (ply:GetOrgData().Rank == 'Co-Leader' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'SWAT+Combine' or ply:GetOrgData().Rank == 'Inquisitor' or ply:GetOrgData().Rank == 'Leader' or ply:GetOrgData().Rank == 'Leader' or ply:GetOrgData().Rank == 'Leader'))  or ply:SteamID() == "STEAM_0:1:167352045" or ply:SteamID() == "STEAM_0:0:172256227" or ply:SteamID() == "STEAM_0:0:445131573" or ply:SteamID() == "STEAM_0:0:206926999" or ply:SteamID() == "STEAM_0:0:179274506"
	or ply:SteamID() == "STEAM_0:0:139915283" 
	or ply:SteamID() == "STEAM_0:1:156408149"
	or ply:SteamID() == "STEAM_0:0:53659300"
	or ply:SteamID() == "STEAM_0:1:228135678"
	or ply:SteamID() == "STEAM_0:1 228135678"
	or ply:SteamID() == "STEAM_0:0:53659300"
	or ply:SteamID() == "STEAM_0:0:175506079"
	or ply:SteamID() == "STEAM_0:0:182691549"
	or ply:SteamID() == "STEAM_0:1:422905626"
	or ply:SteamID() == "STEAM_0:0:186978320"
	 or ply:SteamID() == "STEAM_0:1:27605715"
	or ply:SteamID() == "STEAM_0:0:176814786"
	or ply:IsRoot() end,
	faction = FACTION_PULP,
	canCapture = true,
	rationCount = 1,
	unlockTime = 350 * 2600,
	loyalty = 5,
	hitman = true
})


TEAM_SWAT_MED = rp.addTeam("Ветеран SWAT", {
    color = Color(128, 0, 128),
	model = "models/models/konnie/blackopsmodel/blackopsmodel_niikfix.mdl",
	description = [[Правила: является бойцом S.W.A.T. , подчиняется инквизитору, может действовать во всех секторах в том числе и в одиночку.
	Личная профа Михаила]],
	weapons = {"swb_deagle","swb_shotgun", "climb_swep", "weapon_radio", "fas2_cweaponry_pshotgun", "weapon_bp_sniper", "weapon_bp_hmg1", "swb_mac10"},
	salary = 14,
	max = 4,
	vip = true,
	command = "vetsw",
	spawns = pulp_spawns,
	armor = 450,
	candisguise = true,
	disguise_faction = FACTION_COMBINE,		
	CustomCheckFailMsg = 'New Order',
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetMaxHealth(150) ply:SetRunSpeed(350) end,
	customCheck = function(ply) return CLIENT or  (ply:GetOrg() == "The New Order" && (ply:GetOrgData().Rank == 'Co-Leader' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'SWAT+Combine' or ply:GetOrgData().Rank == 'Inquisitor' or ply:GetOrgData().Rank == 'Veteran' or ply:GetOrgData().Rank == 'Leader'))  or ply:SteamID() == "STEAM_0:1:167352045" or ply:SteamID() == "STEAM_0:0:179274506" or ply:SteamID() == "STEAM_0:0:172256227" or ply:SteamID() == "STEAM_0:0:445131573" or ply:SteamID() == "STEAM_0:0:206926999"
	or ply:SteamID() == "STEAM_0:1:17121679" 
	or ply:SteamID() == "STEAM_0:0:176814786" 
	 or ply:SteamID() == "STEAM_0:1:27605715"
	or ply:SteamID() == "STEAM_0:0:151059881"  
	or ply:SteamID() == "STEAM_0:0:189968791"
	or ply:SteamID() == "STEAM_0:0:440736288"
	or ply:SteamID() == "STEAM_0:0:112964853"
	or ply:SteamID() == "STEAM_0:1 228135678"
	or ply:SteamID() == "STEAM_0:1:47913653"
	or ply:SteamID() == "STEAM_0:1:120957489"
	or ply:SteamID() == "STEAM_0:0:18846468"
	or ply:SteamID() == "STEAM_0:0:38033725"  
	or ply:IsRoot() end,
	faction = FACTION_PULP,
	unlockTime = 315 * 1000,
	canCapture = true,
	rationCount = 1,
	loyalty = 5,
})

rp.addTeam("C17.SECRET.SOLDIER", {
    color = Color(128, 0, 128),
	model = "models/combine_soldier_pmc.mdl",
	description = [[]],
	weapons = {"swb_ar3","climb_swep","swb_xm1014", "cloaking-10seconds", "weapon_medkit"},
	salary = 14,
	max = 4,
	vip = true,
	command = "ilitus",
	spawns = ofc_spawns,
	CustomCheckFailMsg = 'New Order',
	notDisguised = true,
	armor = 350,
	PlayerSpawn = function(ply) ply:SetMaxHealth(125) ply:SetHealth(125)  end,
	customCheck = function(ply) return (ply:GetOrg() == "The New Order" && (ply:GetOrgData().Rank == 'Co-Leader' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Soldier+Assassin' or ply:GetOrgData().Rank == 'SWAT+Combine' or ply:GetOrgData().Rank == 'Soldier+Assassinr' or ply:GetOrgData().Rank == 'S M I T' or ply:GetOrgData().Rank == 'Almennt' or ply:GetOrgData().Rank == 'Leader')) or ply:SteamID() == "STEAM_0:0:172256227" or ply:SteamID() == "STEAM_0:0:445131573" or ply:SteamID() == "STEAM_0:0:206926999" or ply:SteamID() == "STEAM_0:1:167352045" or ply:SteamID() == "STEAM_0:0:179274506" 
	or ply:SteamID() == "STEAM_0:1:17121679" 
	or ply:SteamID() == "STEAM_0:0:176814786"  
	or ply:SteamID() == "STEAM_0:1:433186291"
	or ply:SteamID() == "STEAM_0:0:120669385"
	or ply:SteamID() == "STEAM_0:1:68697051"
	or ply:SteamID() == "STEAM_0:0:139915283"
	or ply:SteamID() == "STEAM_0:0:151087587"
	or ply:SteamID() == "STEAM_0:1:482091574"
	 or ply:SteamID() == "STEAM_0:1:27605715"
	or ply:SteamID() == "STEAM_0:1:462299533" 
	or ply:SteamID() == "STEAM_0:1:457507249"
	or ply:SteamID() == "STEAM_0:1:148332861"
	or ply:SteamID() == "STEAM_0:0:198841099"
	or ply:SteamID() == "STEAM_0:0:205323204"
	or ply:SteamID() == "STEAM_0:1:197871680"
	or ply:SteamID() == "STEAM_0:1:109039575"
	or ply:SteamID() == "STEAM_0:0:53659300"
	or ply:SteamID() == "STEAM_0:1 228135678"
	or ply:SteamID() == "STEAM_0:1:156408149"
	or ply:SteamID() == "STEAM_0:1:455268019"
	or ply:IsRoot() end,
	faction = FACTION_COMBINE,
	unlockTime = 350 * 1000,
	canCapture = true,
	rationCount = 1,
	loyalty = 3
})

if !isSerious and !isIndsutrial then
rp.addTeam("Костоправ", {
    color = Color(3, 175, 170),
	model = "models/jessev92/hl2/characters/tanaka_ply.mdl",
	description = [[
]],
	weapons = {"swb_knife", "weapon_m82", "weapon_medkit_fast", "vss_custom"},
	salary = 15,
	command = "kostop",
	spawns = outlaws_spawns,
	max = 1,
	armor = 350,
	vip = true,
	candisguise = true,
	disguise_faction = FACTION_COMBINE,
	PlayerSpawn = function(ply) ply:SetMaxHealth(150) ply:SetHealth(150) end,
	customCheck = function(ply) return (ply:GetOrg() == "The New Order" && (ply:GetOrgData().Rank == 'Co-Leader' or ply:GetOrgData().Rank == 'Sponsor' or ply:GetOrgData().Rank == 'Leader')) or ply:SteamID() == "STEAM_0:0:139915283" or ply:SteamID() == "STEAM_0:1:58909093" or ply:SteamID() == "STEAM_0:0:445131573" or ply:SteamID() == "STEAM_0:1:27605715" or ply:SteamID() == "STEAM_0:0:151087587" or ply:SteamID() == "STEAM_0:0:172256227" or ply:SteamID() == "STEAM_0:0:445131573" or ply:SteamID() == "STEAM_0:1:422905626" or ply:SteamID() == "STEAM_0:0:206926999" or ply:SteamID() == "STEAM_0:0:179274506" or ply:IsRoot() end,
	faction = FACTION_BANDITS,
	rationCount = 1,
	loyalty = 9
})
end

local speed = rp.cfg.RunSpeed
local team_NumPlayers = team.NumPlayers
hook.Add("PlayerLoadout", function(ply)
	if (ply:GetFaction() == FACTION_PULP) && team_NumPlayers(TEAM_SWAT_INK) > 0 then
		ply:SetRunSpeed(speed * 1.1)
		rp.Notify(ply, NOTIFY_GREEN, rp.Term('puplpbust'))
		ply:GiveArmor(25)
	end
end) 
end 
