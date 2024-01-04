local zombie_spawns = {
	rp_city17_urfim = {Vector(1977.123901,4740.608887,-465.968750), Vector(1802.043457,2433.118652,-465.968750), Vector(1839.369873,-337.055573,-465.197449), Vector(-223.353119,-5070.139160,-465.968750)},
}



if SERVER then

    hook.Add("PlayerHasHunger", function(ply)

         if ply:GetJobTable().noHunger == true then return false end

    end)

end



TEAM_WEAK_ZOMBIE = rp.addTeam("Зомби", {

	color = Color(218, 0, 0),

	model = "models/player/zombie_classic.mdl",

	description = [[Бедняга, заражённый зомби инфекцией. 



Медленно дивигается, слабо бьёт.



Разрешено действовать в пределах D6-D4 в одиночку.

Разрешено действовать в любых секторах вместе с Манипулятором.

]],

	--unlockPrice = 50000,

	--unlockTime = 60 * 3600,

	salary = 3,

	spawn_points = empty,

	punchMin = 40,

	punchMax = 60,

	critMin = 45,

	critMax = 100,

	command = "zombie",

	weapons = {"weapon_zombie_fists", "weapon_throw"},

	PlayerSpawn = function(ply) ply:SetWalkSpeed(80) ply:GiveArmor(75) end,

	spawns = zombie_spawns,

	faction = FACTION_ZOMBIE,

	rationCount = 0,

	noHunger = true,

	unlockTime = 1*3600,

	build = false,

	loyalty = 1,

})



TEAM_FAST_ZOMBIE = rp.addTeam("Быстрый Зомби", {

	color = Color(218, 0, 0),

	model = "models/player/zombie_fast.mdl",

	description = [[Бедняга, заражённый зомби инфекцией.



Очень быстро дивигается, сильно бьёт.



Разрешено действовать в пределах D6-D4 в одиночку.

Разрешено действовать в любых секторах вместе с Манипулятором.

]],

	--unlockPrice = 50000,

	--unlockTime = 60 * 3600,

	salary = 5,

	spawn_points = empty,

	punchMin = 55,

	punchMax = 75,

	critMin = 80,

	critMax = 130,

	command = "fast_zombie",

	weapons = {"weapon_zombie_fists", "climb_swep", "weapon_throw_fast"},

	PlayerSpawn = function(ply) ply:SetWalkSpeed(80) ply:SetRunSpeed(400) ply:GiveArmor(75) end,

	spawns = zombie_spawns,

	faction = FACTION_ZOMBIE,

	rationCount = 0,

	noHunger = true,

	unlockTime = 25*3600,

	build = false,

	loyalty = 1,

})



TEAM_COMBINE_ZOMBIE = rp.addTeam("Зомбайн", {

	color = Color(218, 0, 0),

	model = "models/player/zombie_soldier.mdl",

	description = [[Бедняга, заражённый зомби инфекцией.



Быстро дивигается, очень сильно бьёт, бронирован.



Разрешено действовать в пределах D6-D4 в одиночку.

Разрешено действовать в любых секторах вместе с Манипулятором.

]],

	--unlockPrice = 50000,

	--unlockTime = 60 * 3600,

	salary = 7,

	spawn_points = empty,

    punchMin = 100,

	punchMax = 120,

	critMin = 140,

	critMax = 200,

	command = "zombine",

	weapons = {"weapon_zombie_fists", "weapon_frag", "climb_swep", "weapon_throw_toxic"},

	PlayerSpawn = function(ply) ply:SetWalkSpeed(80) ply:GiveArmor(200) ply:SetRunSpeed(310) end,

	spawns = zombie_spawns,

	faction = FACTION_ZOMBIE,

	rationCount = 0,

	noHunger = true,

	unlockTime = 60*3600,

	build = false,

	hpRegen = 1,

	canCapture = true,

	loyalty = 1

})



TEAM_ZOMBI_COMB = rp.addTeam("Зомби RCT", {

	color = Color(218, 0, 0),

	model = "models/dpfilms/metropolice/playermodels/pm_zombie_police_fix.mdl",

	description = [[Бедняга, заражённый зомби инфекцией.



Быстро дивигается, безумно сильно бьет, слабо бронирован.



Разрешено действовать в пределах D6-D4 в одиночку.

Разрешено действовать в любых секторах вместе с Манипулятором.

]],

	salary = 14,

	spawn_points = empty,

	punchMin = 65,

	punchMax = 95,

	critMin = 100,

	critMax = 180,

	command = "zombirct",

	weapons = {"weapon_zombie_fists", "climb_swep", "weapon_throw_toxic", "climb_swep"},

	PlayerSpawn = function(ply) ply:SetWalkSpeed(80) ply:GiveArmor(50) ply:SetRunSpeed(310) end,

	spawns = zombie_spawns,

	faction = FACTION_ZOMBIE,

	hpRegen = 2,

	rationCount = 0,

	noHunger = true,

	unlockTime = 100*3600,

	build = false,

	max = 2,

	loyalty = 1,

	canCapture = true,

	vip = true,

})



TEAM_ZOMBIEBOSS = rp.addTeam("Безликий Манипулятор", {

		color = Color(218, 0, 0),

		model = "models/player/charple.mdl",

		description = [[Координирует действиями зомби.



	Быстро дивигается, неплохо бьёт, бронирован.



	Может превращать игроков в зомби, для этого киньте в них заразой.



	Разрешено действовать в пределах D6-D4 в одиночку.

	Разрешено организовывать рейд в паре или группе.

	]],

		salary = 20,

		spawn_points = empty,

	    punchMin = 55,

		punchMax = 75,

		critMin = 80,

		critMax = 130,

		command = "zombie_leader",

		weapons = {"weapon_zombie_fists", "weapon_frag", "climb_swep", "weapon_throw_toxic", "weapon_biohazardball"},

		max = 1,

		PlayerSpawn = function(ply) ply:SetWalkSpeed(80) ply:GiveArmor(300) ply:SetRunSpeed(310) end,

		spawns = zombie_spawns,

		faction = FACTION_ZOMBIE,

		rationCount = 0,

		noHunger = true,

		unlockTime = 300*3600,

		hpRegen = 3,

		build = false,

		canCapture = true,

		loyalty = 1,

	})



if !isSerious then

	TEAM_ZOMBI_COMB = rp.addTeam("Зомби Прародитель", {

		color = Color(218, 0, 0),

		model = "models/player/zombies/zombie_guard.mdl",

		description = [[Личная профа Денис Разлетаева]],

		salary = 30,

		spawn_points = empty,

		punchMin = 40,

		punchMax = 50,

		critMin = 50,

		critMax = 100,

		command = "zombieksaikok",

		weapons = {"weapon_zombie_fists", "climb_swep", "weapon_throw_toxic", "weapon_biohazardball"},

		PlayerSpawn = function(ply) ply:GiveArmor(255) ply:SetRunSpeed(350) ply:SetMaxHealth(150) ply:SetHealth(150) end,

		spawns = zombie_spawns,

		faction = FACTION_ZOMBIE,

		rationCount = 0,

		build = false,

		customCheck = function(ply) return ply:SteamID() == "STEAM_0:0:84401067" or ply:IsRoot() end,

		max = 1,

		canCapture = true,

		loyalty = 1

	})

end



TEAM_BANNED = rp.addTeam('Зомби', {

	color = Color(255, 0, 0),

	model = 'models/Zombie/Classic_torso.mdl',

	description = [[

	Вас забанили!

	]],

	weapons = {"weapon_torso"},

	PlayerSpawn = function(ply) ply:SetMaxHealth(30) ply:SetWalkSpeed(80) ply:SetRunSpeed(80) end,

	command = 'banned124',

	punchMin = 3,

	punchMax = 5,

	critMin = 10,

	critMax = 15,

	max = 0,

	salary = 0,

	admin = 0,

	hasLicense = false,

	candemote = false,

	build = false,

	spawns = zombie_spawns,

	customCheck = function(pl) return pl:IsBanned() end,

	CustomCheckFailMsg = 'JobNeedsBanned'

})



rp.SetFactionVoices({FACTION_ZOMBIE}, {

            {

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle1.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle2.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle3.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle4.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle5.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle6.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle7.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle8.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle9.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle10.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle11.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle12.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle13.wav',

				text = '*стонит*'

			},

			{

				label = 'Стонать', 

				sound = 'npc/zombie/zombie_voice_idle14.wav',

				text = '*стонит*'

			},

			{

				label = 'Рычать', 

				sound = 'npc/zombie/zombie_alert1.wav',

				text = '*рычит*'

			},

			{

				label = 'Рычать', 

				sound = 'npc/zombie/zombie_alert2.wav',

				text = '*рычит*'

			},

			{

				label = 'Рычать', 

				sound = 'npc/zombie/zombie_alert3.wav',

				text = '*рычит*'

			},

})



rp.addGroupChat(unpack(rp.GetFactionTeams({FACTION_ZOMBIE})))