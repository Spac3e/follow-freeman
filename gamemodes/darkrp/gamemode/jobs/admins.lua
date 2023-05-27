
-----------------------------------------------------
if SERVER then

    hook.Add("PlayerHasHunger", function(ply)

         if ply:GetJobTable().noHunger == true then return false end

    end)

end



TEAM_MOD = rp.addTeam('Модератор', {

	color = Color(51, 128, 255),

	model = {'models/dpfilms/metropolice/playermodels/pm_badass_police_fix.mdl'},

	description = [[

	Это Нон-РП класс.

	Данный класс для Администрации сервера.

	Данный класс имеет отличительный скин.

	Если вы хотите быть АФК, смените на безработного.

	Запрещено ставить /job в этой профессии. 

	]],

	weapons = {'weapon_keypadchecker'},

	command = 'staff_moderator',

	max = 0,

	salary = 7,

	admin = 1,

	candemote = false,

	stamina = 9999,

	noHunger = true,

	mayorCanSetSary = false,

	customCheck = function(pl) return pl:IsRank('moderator') or pl:IsRoot() end,

	PlayerSpawn = function(pl) pl:GodEnable(true) end,

	CustomCheckFailMsg = 'JobNeedsAdmin',

	spawns = {
		rp_city17_urfim = {Vector(-57.903427,235.796127,2176.031250), Vector(-47.313114,-250.081406,2176.031250)}
	},

	faction = FACTION_ADMINS,

})



TEAM_ADMIN = rp.addTeam('Администратор', {

	color = Color(51, 128, 255),

	model = {'models/dpfilms/metropolice/playermodels/pm_badass_police_fix.mdl'},

	description = [[

	Это Нон-РП класс.

	Данный класс для Администрации сервера.

	Данный класс имеет отличительный скин.

	Если вы хотите быть АФК, смените на безработного.

	Запрещено ставить /job в этой профессии. 

	]],

	weapons = {'weapon_keypadchecker'},

	command = 'staff_admin',

	max = 0,

	salary = 10,

	admin = 1,

	candemote = false,

	stamina = 9999,

	noHunger = true,

	mayorCanSetSary = false,

	customCheck = function(pl) return pl:IsRank('admin') or pl:IsRoot()  end,

	PlayerSpawn = function(pl) pl:GodEnable(true) end,

	CustomCheckFailMsg = 'JobNeedsAdmin',

	spawns = {
		rp_city17_urfim = {Vector(-57.903427,235.796127,2176.031250), Vector(-47.313114,-250.081406,2176.031250)}
	},


	faction = FACTION_ADMINS,

})



TEAM_HEAD_ADMIN = rp.addTeam('Head Admin', {

	color = Color(51, 128, 255),

	model = {'models/dpfilms/metropolice/playermodels/pm_badass_police_fix.mdl'},

	description = [[

	Это Нон-РП класс.

	Данный класс для Администрации сервера.

	Данный класс имеет отличительный скин.

	Если вы хотите быть АФК, смените на безработного.

	Запрещено ставить /job в этой профессии. 

	]],

	weapons = {'weapon_keypadchecker'},

	command = 'staff_headadmin',

	max = 0,

	salary = 12,

	admin = 1,

	candemote = false,

	stamina = 9999,

	noHunger = true,

	mayorCanSetSary = false,

	customCheck = function(pl) return pl:IsRank('headadmin') or pl:IsRoot() end,

	PlayerSpawn = function(pl) pl:GodEnable(true) end,

	CustomCheckFailMsg = 'JobNeedsAdmin',

	spawns = {
		rp_city17_urfim = {Vector(-57.903427,235.796127,2176.031250), Vector(-47.313114,-250.081406,2176.031250)}
	},


	faction = FACTION_ADMINS,

})

TEAM_HEAD_ADMIN = rp.addTeam('Super Admin', { 

	color = Color(51, 128, 255), 

	model = {'models/dpfilms/metropolice/playermodels/pm_badass_police_fix.mdl'},

	description = [[ 

	Это Нон-РП класс. 

	Данный класс для Администрации сервера. 

	Данный класс имеет отличительный скин. 

	Если вы хотите быть АФК, смените на безработного.

	Запрещено ставить /job в этой профессии.  

	]], 

	weapons = {'weapon_keypadchecker'}, 

	command = 'staff_superadmin', 

	max = 0, 

	salary = 12, 

	admin = 1, 

	candemote = false, 

	stamina = 9999,

	noHunger = true,

	mayorCanSetSary = false, 

	customCheck = function(pl) return pl:IsRank('superadmin') or pl:IsRoot() end, 

	CustomCheckFailMsg = 'JobNeedsAdmin',

	PlayerSpawn = function(pl) pl:GodEnable(true) end, 

	spawns = {
		rp_city17_urfim = {Vector(-57.903427,235.796127,2176.031250), Vector(-47.313114,-250.081406,2176.031250)}
	},


	faction = FACTION_ADMINS, 

})



TEAM_MANAGER = rp.addTeam('Менеджер', {

	color = Color(51, 128, 255),

    model = {'models/dpfilms/metropolice/playermodels/pm_badass_police_fix.mdl'},

	description = [[

	Это Нон-РП класс.

	Данный класс для Администрации сервера.

	Данный класс имеет отличительный скин.

	Если вы хотите быть АФК, смените на безработного.

	]],

	weapons = {'weapon_keypadchecker'},

	command = 'staff_manager',

	max = 0,

	salary = 20,

	admin = 1,

	candemote = false,

	stamina = 9999,

	noHunger = true,

	mayorCanSetSary = false,

	customCheck = function(pl) return  pl:IsRank('manager')  or  pl:IsRoot() end,

	CustomCheckFailMsg = 'JobNeedsAdmin',

	PlayerSpawn = function(pl) pl:GodEnable(true) end,

	spawns = {
		rp_city17_urfim = {Vector(-57.903427,235.796127,2176.031250), Vector(-47.313114,-250.081406,2176.031250)}
	},

	faction = FACTION_ADMINS,

})



TEAM_GROOT = rp.addTeam('Межпространственный Бюрократ', {

	color = Color(51, 128, 255),

	model = {'models/player/gman_high.mdl'},

	description = [[Играет роль надсмотрщика и, в конечном счёте, работодателя, наблюдая за людьми.	]],

	weapons = {'weapon_keypadchecker'},

	command = 'staff_g',

	max = 0,

	salary = 20,

	admin = 1,

	candemote = false,

	stamina = 9999,

	noHunger = true,

	mayorCanSetSary = false,

	customCheck = function(pl) return  pl:IsRank('manager') or pl:IsRoot() end,

	CustomCheckFailMsg = 'JobNeedsAdmin',

	PlayerSpawn = function(pl) pl:GodEnable(true) end,

	spawns = {
		rp_city17_urfim = {Vector(-57.903427,235.796127,2176.031250), Vector(-47.313114,-250.081406,2176.031250)}
	},


	faction = FACTION_ADMINS,

})