local ipairs 	= ipairs 
local IsValid 	= IsValid
local string 	= string
local table 	= table

function GM:CanChangeRPName(ply, RPname)
	if string.find(RPname, "\160") or string.find(RPname, " ") == 1 then -- disallow system spaces
		return false
	end

	if table.HasValue({"ooc", "shared", "world", "n/a", "world prop", "STEAM", 'mrkubu', 'artyom'}, RPname) and (not pl:IsRoot()) then
		return false
	end
end

util.AddNetworkString( "net.foodsystem.InterpolateArm" );

rp.FoodSystem = rp.FoodSystem or {};

rp.FoodSystem.SpawnFood = function( class, pos, ang )
    local me = weapons.GetStored(class);
    if not istable(me) then return end

    local ent = ents.Create( "spawned_weapon" );
    ent:SetPos( pos );
    ent:SetAngles( ang );
    ent:SetModel( me.WorldModel );
    ent.weaponclass = class;
    ent:Spawn();
end

function GM:CanDemote(pl, target, reason)end
function GM:CanVote(pl, vote)end
function GM:OnPlayerChangedTeam(pl, oldTeam, newTeam)end

function GM:CanDropWeapon(pl, weapon)
	if not IsValid(weapon) then return false end
	local class = string.lower(weapon:GetClass())
	if rp.cfg.DisallowDrop[class] then return false end

	if table.HasValue(pl.Weapons, weapon) then
        return false
    end

	for k,v in pairs(rp.shipments) do
		if v.entity ~= class then continue end

		return true
	end

	return false
end

function PLAYER:CanDropWeapon(weapon)
	return GAMEMODE:CanDropWeapon(self, weapon)
end

function GM:UpdatePlayerSpeed(pl)
	self:SetPlayerSpeed(pl, rp.cfg.WalkSpeed, rp.cfg.RunSpeed)
end

/*---------------------------------------------------------
 Stuff we don't use
 ---------------------------------------------------------*/
timer.Simple(0.5, function() 
	local GM = GAMEMODE
	GM.CalcMainActivity 		= nil
	GM.SetupMove 				= nil
	GM.FinishMove 				= nil
	GM.Move 					= nil
	GM.UpdateAnimation 			= nil
	GM.Think 					= nil
	GM.Tick 					= nil
	GM.PlayerTick 				= nil
	GM.PlayerPostThink 			= nil
	GM.KeyPress 				= nil
	GM.EntityRemoved 			= nil
	GM.EntityKeyValue 			= nil
	GM.HandlePlayerJumping 		= nil
	GM.HandlePlayerDucking 		= nil
	GM.HandlePlayerNoClipping 	= nil
	GM.HandlePlayerVaulting 	= nil
	GM.HandlePlayerSwimming 	= nil
	GM.HandlePlayerLanding 		= nil
	GM.HandlePlayerDriving 		= nil
end)

/*---------------------------------------------------------
 Gamemode functions
 ---------------------------------------------------------*/
function GM:PlayerUse(pl, ent)
	return (not pl:IsBanned())
end
function GM:PlayerSpawnSENT(pl, model) return pl:IsSuperAdmin() end
function GM:PlayerSpawnSWEP(pl, class, model) return pl:IsSuperAdmin() end
function GM:PlayerGiveSWEP(pl, class, model) return pl:IsSuperAdmin() end
function GM:PlayerSpawnVehicle(pl, model) return pl:IsSuperAdmin() end
function GM:PlayerSpawnNPC(pl, model) return pl:HasAccess('*') end
function GM:PlayerSpawnRagdoll(pl, model) return pl:HasAccess('*') end
function GM:PlayerSpawnEffect(pl, model) return pl:HasAccess('*') end
function GM:PlayerSpray(pl) return true end
function GM:CanDrive(pl, ent) return false end
function GM:CanProperty(pl, property, ent) return false end

function GM:OnPhysgunFreeze(weapon, phys, ent, pl)
	if ent.PhysgunFreeze and (ent:PhysgunFreeze(pl) == false) then
		return false
	end
	
	if ( ent:GetPersistent() ) then return false end
	
	-- Object is already frozen (!?)
	if ( !phys:IsMoveable() ) then return false end
	if ( ent:GetUnFreezable() ) then return false end
	
	phys:EnableMotion( false )
	
	-- With the jeep we need to pause all of its physics objects
	-- to stop it spazzing out and killing the server.
	if ( ent:GetClass() == "prop_vehicle_jeep" ) then
	
		local objects = ent:GetPhysicsObjectCount()
		
		for i = 0, objects - 1 do
		
			local physobject = ent:GetPhysicsObjectNum( i )
			physobject:EnableMotion( false )
		
		end
	
	end

	-- Add it to the player's frozen props
	pl:AddFrozenPhysicsObject( ent, phys )
	
	return true
end

function GM:PlayerShouldTaunt(pl, actid) return true end
function GM:CanTool(pl, trace, mode) return (not pl:IsBanned()) and (not pl:IsJailed()) and (not pl:IsArrested()) end

function GM:CanPlayerSuicide(pl)
	if pl:IsArrested() then
		pl:Notify(NOTIFY_ERROR, rp.Term('CantSuicideJail'))
	elseif pl:IsWanted() then
		pl:Notify(NOTIFY_ERROR, rp.Term('CantSuicideWanted'))
	elseif pl:IsFrozen() then
		pl:Notify(NOTIFY_ERROR, rp.Term('CantSuicideFrozen'))
	elseif (pl:GetKarma() > 0) or ((pl.LastSuicide ~= nil) and pl.LastSuicide >= CurTime()) then
		pl:Notify(NOTIFY_ERROR, rp.Term('CantSuicideLiveFor'))
	elseif (not pl:IsBanned()) and (not pl:IsJailed()) then
		pl:Notify(NOTIFY_ERROR, rp.Term('YouSuicided'))
		pl:EmitSound('ambient/creatures/town_child_scream1.wav')-- звук смерти
		pl.LastSuicide = CurTime() + 2
		return true
	end

	return false 
end

function GM:PlayerSpawnProp(ply, model)
	if ply:IsBanned() or ply:IsJailed() or ply:IsArrested() or ply:IsFrozen() then return false end

	model = string.gsub(tostring(model), "\\", "/")
	model = string.gsub(tostring(model), "//", "/")
	
	return ply:CheckLimit('props')
end


function GM:ShowSpare1(ply)
	if rp.teams[ply:Team()] and rp.teams[ply:Team()].ShowSpare1 then
		return rp.teams[ply:Team()].ShowSpare1(ply)
	end
end

function GM:ShowSpare2(ply)
	if rp.teams[ply:Team()] and rp.teams[ply:Team()].ShowSpare2 then
		return rp.teams[ply:Team()].ShowSpare2(ply)
	end
end

function GM:OnNPCKilled(victim, ent, weapon)
	-- If something killed the npc
	if ent then
		if ent:IsVehicle() and ent:GetDriver():IsPlayer() then ent = ent:GetDriver() end

		-- If we know by now who killed the NPC, pay them.
		if IsValid(ent) and ent:IsPlayer() then
			local xp = rp.Karma(ent, 5, 75)
			local money = rp.Karma(ent, 5, 100)
			ent:AddMoney(money)
			rp.Notify(ent, NOTIFY_GREEN, rp.Term('+Money'), money)
		end
	end
end

local player_GetAll 	= player.GetAll
local GetShootPos 		= PLAYER.GetShootPos
local DistToSqr 		= VECTOR.DistToSqr
timer.Create('PlayerHearVoice', 0.5, 0, function()
	local pls = player_GetAll()
	for a = 1, #pls do
		for b = 1, #pls do
			if (not pls[a].CanHear) then
				pls[a].CanHear = {}
			end
			if (DistToSqr(GetShootPos(pls[a]), GetShootPos(pls[b])) <= 302500) and (pls[a] ~= pls[b]) and (not pls[b]:IsBanned()) then
				pls[a].CanHear[pls[b]] = true
			else
				pls[a].CanHear[pls[b]] = false
			end
		end
	end
end)

function string.StripPort(ip)
	local p =string.find(ip, ':')
	if (not p) then return ip end
	return string.sub(ip, 1, p - 1)
end

function GM:PlayerCanHearPlayersVoice(listener, talker)
	return (listener.CanHear and listener.CanHear[talker] or false), true
end

function GM:DoPlayerDeath(pl, attacker, dmginfo)
	pl:CreateRagdoll()

	pl.LastRagdoll = (CurTime() + rp.cfg.RagdollDelete)
end

timer.Create('RemoveRagdolls', 30, 0, function()
	local pls = player.GetAll()
	for i = 1, #pls do
		if pls[i].LastRagdoll and (pls[i].LastRagdoll <= CurTime()) then
			local rag = pls[i]:GetRagdollEntity()
			if IsValid(rag) then
				rag:Remove()
			end
		end
	end
end)
 
function GM:PlayerDeathThink(pl)
	if (not pl.NextReSpawn or pl.NextReSpawn < CurTime()) and (pl:KeyPressed(IN_ATTACK) or pl:KeyPressed(IN_ATTACK2) or pl:KeyPressed(IN_JUMP) or pl:KeyPressed(IN_FORWARD) or pl:KeyPressed(IN_BACK) or pl:KeyPressed(IN_MOVELEFT) or pl:KeyPressed(IN_MOVERIGHT) or pl:KeyPressed(IN_JUMP)) then
		pl:Spawn()
	end
end

function GM:PlayerDeath(ply, weapon, killer)
	if rp.teams[ply:Team()] and rp.teams[ply:Team()].PlayerDeath then
		rp.teams[ply:Team()].PlayerDeath(ply, weapon, killer)
	end

	ply:Extinguish()

	if ply:GetNetVar('HasGunlicense') then ply:SetNetVar('HasGunlicense', nil) end

	if ply:InVehicle() then ply:ExitVehicle() end

	ply.NextReSpawn = CurTime() + 1
end

function GM:PlayerCanPickupWeapon(ply, weapon)
	if ply:IsArrested() or ply:IsBanned() or ply:IsJailed() then return false end
	if weapon and weapon.PlayerUse == false then return false end

	if rp.teams[ply:Team()] and rp.teams[ply:Team()].PlayerCanPickupWeapon then
		rp.teams[ply:Team()].PlayerCanPickupWeapon(ply, weapon)
	end
	return true
end

local function HasValue(t, val)
	for k, v in ipairs(t) do
		if (string.lower(v) == string.lower(val)) then
			return true
		end
	end
end

function GM:PlayerSetModel(pl)
	if rp.teams[pl:Team()] and rp.teams[pl:Team()].PlayerSetModel then
		return rp.teams[pl:Team()].PlayerSetModel(pl)
	end

	if (pl:GetVar('Model') ~= nil) and istable(rp.teams[pl:Team()].model) and HasValue(rp.teams[pl:Team()].model, pl:GetVar('Model')) then
		pl:SetModel(pl:GetVar('Model'))
	else
		pl:SetModel(team.GetModel(pl:GetJob() or 1))
	end

	pl:SetupHands()
end

function GM:PlayerInitialSpawn(ply)
	ply:SetTeam(1)

	for k, v in ipairs(ents.GetAll()) do
		if IsValid(v) and (v.deleteSteamID == ply:SteamID()) then
			ply:_AddCount(v:GetClass(), v)
			v.ItemOwner = ply
			if v.Setowning_ent then
				v:Setowning_ent(ply)
			end
			v.deleteSteamID = nil
			timer.Destroy("Remove"..v:EntIndex())
		end
	end
end

local map = game.GetMap()
local lastpos
local TeamSpawns 	= rp.cfg.TeamSpawns[map]
local JailSpawns 	= rp.cfg.JailPos[map]
local NormalSpawns 	= rp.cfg.SpawnPos[map]

function GM:PlayerSelectSpawn(pl)
	local pos
	if pl:IsArrested() then
		pos = JailSpawns[math.random(1, #JailSpawns)]
	elseif (TeamSpawns[pl:Team()] ~= nil) then -- тима
		pos = TeamSpawns[pl:Team()][math.random(1, #TeamSpawns[pl:Team()])]
	else
		pos = NormalSpawns[math.random(1, #NormalSpawns)]
		if (pos == lastpos) then
			pos = NormalSpawns[math.random(1, #NormalSpawns)]
		end
		lastpos = pos
		return self.SpawnPoint, util.FindEmptyPos(pos)
	end
	return self.SpawnPoint, util.FindEmptyPos(pos)
end

function GM:PlayerSpawn(ply)
	player_manager.SetPlayerClass(ply, 'rp_player')

	ply:SetNoCollideWithTeammates(false)
	ply:UnSpectate()
	ply:SetHealth(100)
	ply:SetJumpPower(200)
	
	GAMEMODE:SetPlayerSpeed(ply, rp.cfg.WalkSpeed, rp.cfg.RunSpeed)

	ply:Extinguish()
	if IsValid(ply:GetActiveWeapon()) then
		ply:GetActiveWeapon():Extinguish()
	end

	if ply.demotedWhileDead then
		ply.demotedWhileDead = nil
		ply:ChangeTeam(rp.DefaultTeam)
	end

	ply:GetTable().StartHealth = ply:Health()
	gamemode.Call("PlayerSetModel", ply)
	gamemode.Call("PlayerLoadout", ply)

	local _, pos = self:PlayerSelectSpawn(ply) -- позиция
	ply:SetPos(pos) --

	local view1, view2 = ply:GetViewModel(1), ply:GetViewModel(2)
	if IsValid(view1) then
		view1:Remove()
	end
	if IsValid(view2) then
		view2:Remove()
	end

	if rp.teams[ply:Team()] and rp.teams[ply:Team()].PlayerSpawn then
		rp.teams[ply:Team()].PlayerSpawn(ply)
	end

	ply:AllowFlashlight(true)
end

function GM:PlayerLoadout(ply)
	if ply:IsArrested() or ply:IsBanned() then return end

	player_manager.RunClass(ply, "Spawn")

	local Team = ply:Team() or 1

	if not rp.teams[Team] then return end
	
	if rp.teams[ply:Team()].PlayerLoadout then
		rp.teams[ply:Team()].PlayerLoadout(ply)
	end

	for k, v in ipairs(rp.teams[Team].weapons or {}) do
		ply:Give(v)
	end

	for k, v in ipairs(rp.cfg.DefaultWeapons) do
		ply:Give(v)
	end

	if ply:IsAdmin() then
		ply:Give("weapon_keypadchecker")
	end

	ply:SelectWeapon('weapon_physgun')

	ply.Weapons = ply:GetWeapons()
end

local function removeDelayed(ent, ply)
	ent.deleteSteamID = ply:SteamID()
	timer.Create("Remove" .. ent:EntIndex(), (ent.RemoveDelay or math.random(180, 900)), 1, function()
		SafeRemoveEntity(ent)
	end)
end

-- Remove shit on disconnect
function GM:PlayerDisconnected(ply)
	if ply:IsAgendaManager() then
		nw.SetGlobal('Agenda;' .. ply:Team(), nil)
	end

	if ply:IsMayor() then
		nw.SetGlobal('mayorGrace', nil)
		rp.resetLaws()
	end
	
	for k, v in ipairs(ents.GetAll()) do
		-- Remove right away or delayed
		if (v.ItemOwner == ply) and not v.RemoveDelay or v.Getrecipient and (v:Getrecipient() == ply) then 
			v:Remove()
		elseif (v.RemoveDelayed or v.RemoveDelay) and (v.ItemOwner == ply) then
			removeDelayed(v, ply)
		end

		-- Unown all doors
		if IsValid(v) and v:IsDoor() then
			if v:DoorOwnedBy(ply) then
				v:DoorUnOwn()
			elseif v:DoorCoOwnedBy(ply) then
				v:DoorUnCoOwn(ply)
			end
		end

		-- Remove all props
		if IsValid(v) and ((v:CPPIGetOwner() ~= nil) and not IsValid(v:CPPIGetOwner())) or (v:CPPIGetOwner() == ply) then
			v:Remove()
		end
	end

	rp.inv.Data[ply:SteamID64()] = nil

	GAMEMODE.vote.DestroyVotesWithEnt(ply)

	if rp.teams[ply:Team()].mayor and nw.GetGlobal('lockdown') then -- Stop the lockdown
		GAMEMODE:UnLockdown(ply)
	end

	if rp.teams[ply:Team()] and rp.teams[ply:Team()].PlayerDisconnected then
		rp.teams[ply:Team()].PlayerDisconnected(ply)
	end
end

function GM:GetFallDamage(pl, speed) 
	local dmg = (speed / 15)
	local ground = pl:GetGroundEntity() 
	if ground:IsPlayer() and (not pl:IsBanned()) then
		ground:TakeDamage(dmg * 1.3, pl, pl)
	end
	return dmg
end

local remove = {
	rp_c18_divrp = {
		['func_brush'] = true,
		['func_door_rotating'] = true,
		['prop_dynamic'] = true,
		['prop_physics'] = true,
		['prop_physics_multiplayer'] = true,
		['prop_ragdoll'] = true,
		['ambient_generic'] = true,
		['func_reflective_glass'] = true,
		['info_player_terrorist'] = true,
		['info_player_counterterrorist'] = true,
		['env_soundscape'] = true,
		['point_spotlight'] = true,
		['ai_network'] = true,
		['lua_run'] = true,
		['logic_timer'] = true,
		['trigger_multiple'] = true
	},
	rp_city17_build210 = {
		['prop_ragdoll'] = true,
		['prop_physics'] = true,
		['prop_physics_multiplayer'] = true,
		['lua_run'] = true,
	},
	rp_city17_urfim = {
		['env_fog_controller'] = true,
	},
	rp_industrial17_v1 = {
		['prop_physics'] = true,
	--	['prop_dynamic'] = true,
	},
	rp_city8_urfim = {
		['prop_ragdoll'] = true,
		['prop_physics'] = true,
		['prop_physics_multiplayer'] = true,
	},
}

local exclude_models = {
	rp_city17_build210 = {
		['models/props_c17/playgroundtick-tack-toe_block01a.mdl'] = true,
		['models/props_c17/playground_swingset_seat01a.mdl'] = true,
		['models/props_c17/playground_teetertoter_seat.mdl'] = true,
		['models/props_c17/tv_monitor01.mdl'] = true
	},
	rp_industrial17_v1 = {
		['models/props_combine/combinebutton.mdl'] = true,
	}
}

local freeze = {}

function GM:InitPostEntity()
	local physData = physenv.GetPerformanceSettings()
	physData.MaxVelocity = 1700
	physData.MaxCollisionChecksPerTimestep = 10000
	physData.MaxCollisionsPerObjectPerTimestep = 2
	physData.MaxAngularVelocity = 3636
	physenv.SetPerformanceSettings(physData)
	game.ConsoleCommand("sv_allowcslua 0\n")
	game.ConsoleCommand("physgun_DampingFactor 0.9\n")
	game.ConsoleCommand("sv_sticktoground 0\n")
	game.ConsoleCommand("sv_airaccelerate 100\n")

	remove = remove[game.GetMap()] or {}
	freeze = freeze[game.GetMap()] or {}
	exclude_models = exclude_models[game.GetMap()] or {}

	for _, ent in ipairs(ents.GetAll()) do
		if ent:CreatedByMap() then
			if remove[ent:GetClass()] && !exclude_models[ent:GetModel()] then
				ent:Remove()
			elseif freeze[ent:GetClass()] then

			end
		end
	end

	for k, v in ipairs(ents.FindByClass('info_player_start')) do
		if util.IsInWorld(v:GetPos()) and (not self.SpawnPoint) then
			self.SpawnPoint = v
		else
			v:Remove()
		end
	end


	for k, v in pairs(rp.cfg.Static[game.GetMap()] or {}) do
		local ent = ents.Create('prop_physics')
		ent:SetPos(v.pos)
		ent:SetModel(v.mdl)
		ent:SetAngles(v.ang)
		ent:SetMaterial(v.mat)
		ent:Spawn()
		local p = ent:GetPhysicsObject()
		if IsValid(p) then
			p:EnableMotion(false)
		end
	end
end
--------------NEEWW-----------------

local blockTypes = {"Physgun1", "Spawning1", "Toolgun1"}

local checkModel = function(model) return model ~= nil and (CLIENT or util.IsValidModel(model)) end
local requiredTeamItems = {"color", "model", "description", "weapons", "command", "max"}
local validShipment = {model = checkModel, "entity", "price", "amount", "seperate", "allowed"}
local validVehicle = {"name", model = checkModel, "price"}
local validEntity = {"ent", model = checkModel, "price", "max", "cmd", "name"}
local function checkValid(tbl, requiredItems)
	for k,v in pairs(requiredItems) do
		local isFunction = type(v) == "function"

		if (isFunction and not v(tbl[k])) or (not isFunction and tbl[v] == nil) then
			return isFunction and k or v
		end
	end
end

rp.teams = {}
function rp.addTeam(Name, CustomTeam)
	CustomTeam.name = Name
	CustomTeam.Outfits = {}
	
	local corrupt = checkValid(CustomTeam, requiredTeamItems)
	if corrupt then ErrorNoHalt("Corrupt team \"" ..(CustomTeam.name or "") .. "\": element " .. corrupt .. " is incorrect.\n") end
	
	table.insert(rp.teams, CustomTeam)
	team.SetUp(#rp.teams, Name, CustomTeam.color)
	local t = #rp.teams
	CustomTeam.team = t


	timer.Simple(0, function() GAMEMODE:AddTeamCommands(CustomTeam, CustomTeam.max) end)

	for k, v in pairs(CustomTeam.spawns or {}) do
		rp.cfg.TeamSpawns[k] = rp.cfg.TeamSpawns[k] or {}
		rp.cfg.TeamSpawns[k][t] = v
	end

	// Precache model here. Not right before the job change is done
	if type(CustomTeam.model) == "table" then
		for k,v in pairs(CustomTeam.model) do util.PrecacheModel(v) end
	else
		util.PrecacheModel(CustomTeam.model)
	end
	return t
end

rp.teamDoors = {}
function rp.AddDoorGroup(name, col, ...)
	local varargs = {...}

	if (isnumber(col)) then
		table.insert(varargs, 1, col)
		col = team.GetColor(col)
	end

	rp.teamDoors[name] = rp.teamDoors[name] or {Color = col, Teams = {}}
	for k, v in ipairs(varargs) do
		rp.teamDoors[name].Teams[v] = true
	end
end

rp.shipments = {}
rp.ShipmentMap = {}
function rp.AddShipment(name, model, entity, price, Amount_of_guns_in_one_shipment, Sold_seperately, price_seperately, noshipment, classes, shipmodel, CustomCheck)
	local tableSyntaxUsed = type(model) == "table"

	local AllowedClasses = classes or {}
	if not classes then
		for k,v in ipairs(team.GetAllTeams()) do
			table.insert(AllowedClasses, k)
		end
	end

	local price = tonumber(price)
	local shipmentmodel = shipmodel or "models/Items/item_item_crate.mdl"

	local customShipment = tableSyntaxUsed and model or
		{model = model, entity = entity, price = price, amount = Amount_of_guns_in_one_shipment,
		seperate = Sold_seperately, pricesep = price_seperately, noship = noshipment, allowed = AllowedClasses,
		shipmodel = shipmentmodel, customCheck = CustomCheck, weight = 5}

	customShipment.seperate = customShipment.separate or customShipment.seperate
	customShipment.name = name
	customShipment.allowed = customShipment.allowed or {}

	local allowed = {}
	for k, v in ipairs(customShipment.allowed) do
		allowed[v] = true
	end
	customShipment.allowed = allowed

	local corrupt = checkValid(customShipment, validShipment)
	if corrupt then ErrorNoHalt("Corrupt shipment \"" .. (name or "") .. "\": element " .. corrupt .. " is corrupt.\n") end

	if SERVER then
		rp.nodamage[entity] = true
	end

	rp.inv.Wl[entity] = name
	rp.ShipmentMap[entity] = #rp.shipments + 1

	table.insert(rp.shipments, customShipment)
	util.PrecacheModel(customShipment.model)
end


rp.entities = {}
rp.EntityMap = {}
function rp.AddEntity(name, entity, model, price, max, command, classes, pocket)
	local tableSyntaxUsed = type(entity) == "table"

	local tblEnt = tableSyntaxUsed and entity or
		{ent = entity, model = model, price = price, max = max,
		cmd = command, allowed = classes, pocket = pocket}
	tblEnt.name = name
	tblEnt.allowed = tblEnt.allowed or {}
	tblEnt.catagory = tblEnt.catagory or 'Misc'

	if type(tblEnt.allowed) == "number" then
		tblEnt.allowed = {tblEnt.allowed}
	end

	if #tblEnt.allowed == 0 then
		for k,v in ipairs(team.GetAllTeams()) do
			table.insert(tblEnt.allowed, k)
		end
	end

	local corrupt = checkValid(tblEnt, validEntity)
	if corrupt then ErrorNoHalt("Corrupt Entity \"" .. (name or "") .. "\": element " .. corrupt .. " is corrupt.\n") end

	if SERVER then
		rp.nodamage[entity] = true
	end

	local allowed = {}
	for k, v in ipairs(tblEnt.allowed) do
		allowed[v] = true
	end
	tblEnt.allowed = allowed

	table.insert(rp.entities, tblEnt)
	rp.EntityMap[tblEnt.ent] = tblEnt
	timer.Simple(0, function() GAMEMODE:AddEntityCommands(tblEnt) end)

	if (tblEnt.pocket ~= false) then
		rp.inv.Wl[tblEnt.ent] = name
	end
end

rp.Foods = {}
function rp.AddFoodItem(name, mdl, amount)
	rp.Foods[name] = { model = mdl, amount = amount } -- to laz
	rp.Foods[#rp.Foods + 1] = {name = name, model = mdl, amount = amount}
end

rp.CopItems = {}
function rp.AddCopItem(name, price, model, weapon, callback)
	if istable(price) then
		rp.CopItems[name] = {
			Name = name, 
			Price = price.Price,
			Model = price.Model,
			Weapon = price.Weapon,
			Callback = price.Callback
		}
	else
		rp.CopItems[name] = {
			Name = name, 
			Price = price,
			Model = model,
			Weapon = weapon,
			Callback = callback
		}
	end
end

rp.Drugs = {}
rp.DrugsMap = {}
function rp.AddDrug(inf)
	local class = 'drug_' .. inf.Name:gsub(' ', ''):lower()

	inf.Class = class
	inf.BuyPrice = math.ceil(inf.Price * .50)

	local index = #rp.Drugs + 1

	local endhigh = inf.EndHigh
	inf.EndHigh = function(pl, ...)
		if inf.ClientHooks then
			net.Start 'rp.EndHigh'
				net.WriteUInt(index, 4)
			net.Send(pl)
		end
		if endhigh then
			endhigh(pl, ...)
		end
	end

	rp.Drugs[index] = inf
	rp.DrugsMap[class] = inf
	rp.AddShipment(inf.Name, inf.Model, class, math.ceil(inf.Price * 10), 10, false, math.ceil(inf.Price * 1.3), false, inf.Team)

	scripted_ents.Register({
		Name 		= inf.Name,
		Type 		= 'anim',
		Base		= 'drug_base',
		Category 	= 'RP Drugs',
		PressE 		= true,
		Spawnable	= true,
		Model 		= inf.Model,
		Index 		= index,
	},  class)
end

rp.Weapons = {}
function rp.AddWeapon(name, model, entity, price, classes)
	local price_seperately = price/10*1.25
	rp.Weapons[#rp.Weapons + 1] = {
		Class = entity,
		Model = model,
	}
	rp.AddShipment(name, model, entity, price, 10, true, price_seperately, false, classes)
	rp.AddCopItem(name, price_seperately, model, entity)
end

rp.agendas = {}
function rp.AddAgenda(title, manager, listeners)
	for k, v in ipairs(listeners) do
		rp.agendas[v] = {title = title, manager = manager}
	end
	rp.agendas[manager] = {title = title, manager = manager}

	nw.Register('Agenda;' .. manager)
		:Read(net.ReadString)
		:Write(net.WriteString)
		:SetGlobal()
end

rp.groupChats = {}
function rp.addGroupChat(...)
	local classes = {...}
	table.foreach(classes, function(k, class)
		rp.groupChats[class] = {}
		table.foreach(classes, function(k, class2)
			rp.groupChats[class][class2] = true
		end)
	end)
end

rp.ammoTypes = {}
function rp.AddAmmoType(ammoType, name, model, price, amountGiven, customCheck)
	table.insert(rp.ammoTypes, {
		ammoType = ammoType,
		name = name,
		model = model,
		price = price,
		amountGiven = amountGiven,
		customCheck = customCheck
	})
end