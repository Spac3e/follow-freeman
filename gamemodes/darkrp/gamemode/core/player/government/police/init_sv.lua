rp.ArrestedPlayers = rp.ArrestedPlayers or {}

function PLAYER:IsWarranted()
	return (self.HasWarrant == true)
end

function PLAYER:Warrant(actor, reason)
	self.HasWarrant = true
	timer.Simple(rp.cfg.WarrantTime, function()
		if IsValid(self) then
			self:UnWarrant()
		end
	end)
	rp.FlashNotifyAll('Warrant', rp.Term('Warranted'), self, reason, (IsValid(actor) and actor or 'Auto Warrant'))
	hook.Call('PlayerWarranted', GAMEMODE, self, actor, reason)
end

function PLAYER:UnWarrant(actor)
	rp.Notify(self, NOTIFY_GREEN, rp.Term('WarrantExpired'))
	self.HasWarrant = nil
	hook.Call('PlayerUnWarranted', GAMEMODE, self, actor)
end


function PLAYER:Wanted(actor, reason)
	self.CanEscape = nil
	self:SetNetVar('IsWanted', true)
	self:SetNetVar('WantedReason', reason)
	timer.Create('Wanted' .. self:SteamID64(), rp.cfg.WantedTime, 1, function()
		if IsValid(self) then
			self:UnWanted()
		end
	end)
	rp.FlashNotifyAll('Wanted', rp.Term('Wanted'), self, reason, (IsValid(actor) and actor or 'Auto Want'))
	hook.Call('PlayerWanted', GAMEMODE, self, actor, reason)
end

function PLAYER:UnWanted(actor)
	self:SetNetVar('IsWanted', nil)
	self:SetNetVar('WantedReason', nil)
	timer.Destroy('Wanted' .. self:SteamID64())
	hook.Call('PlayerUnWanted', GAMEMODE, self, actor)
end

local jails = rp.cfg.JailPos[game.GetMap()]
function PLAYER:Arrest(actor, reason)
	local time = rp.Karma(self, rp.cfg.ArrestTimeMax, rp.cfg.ArrestTimeMin)
	timer.Create('Arrested' .. self:SteamID64(), time, 1, function()
		if IsValid(self) then
			self:UnArrest()
		end
	end)

	self:SetNetVar('ArrestedInfo', {Reason = (reason or self:GetWantedReason()), Release = CurTime() + time})
	if self:IsWanted() then self:UnWanted() end
		
	rp.ArrestedPlayers[self:SteamID64()] = true
		
	self:StripWeapons()
	self:SetHunger(100)
	self:SetHealth(100)
	self:SetArmor(0)

	rp.FlashNotifyAll('Arrested', rp.Term('Arrested'), self)
	hook.Call('PlayerArrested', GAMEMODE, self, actor)

	self:SetPos(util.FindEmptyPos(jails[math.random(#jails)]))
	self.CanEscape = true
end

function PLAYER:UnArrest(actor)
	self:SetNetVar('ArrestedInfo', nil)
	timer.Destroy('Arrested' .. self:SteamID64())
	rp.ArrestedPlayers[self:SteamID64()] = nil
	timer.Simple(0.3, function() -- fucks up otherwise
		local _, pos = GAMEMODE:PlayerSelectSpawn(self)
		self:SetPos(pos)
		self:SetHealth(100)
		hook.Call('PlayerLoadout', GAMEMODE, self)
		rp.FlashNotifyAll('UnArrested', rp.Term('UnArrested'), self)
		hook.Call('PlayerUnArrested', GAMEMODE, self, actor)
	end)
end


-- Commands
rp.AddCommand('/911', function(pl, text)
	if (text == '') then return end
	for k, v in ipairs(player.GetAll()) do
		if v:IsCP() or (v == pl) then
			rp.Chat(CHAT_NONE, v, Color(255,255,51), '[911]', pl, text)
		end
	end
end)

rp.AddCommand('/want', function(pl, text, args)
	if not pl:IsCP() and not pl:IsMayor() or not args[1] or not args[2] then return end
	local targ = rp.FindPlayer(args[1])
	if not IsValid(targ) then 
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('WantedPlayerNotFound'), args[1])
	elseif targ:IsWanted() then
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('PlayerAlreadyWanted'), args[1])
	else
		local reason = table.concat(args, ' ', 2)
		targ:Wanted(pl, reason)
	end
end)

rp.AddCommand('/quickwant', function(pl, text, args)
	if not pl:IsCP() and not pl:IsMayor() then return end
	local targ = pl:GetEyeTrace(pl).Entity
	if not IsValid(targ) or not targ:IsPlayer() or targ:IsWanted() then return end
	targ:Wanted(pl, 'Quickwanted')
end)

rp.AddCommand('/unwant', function(pl, text, args)
	if not pl:IsCP() and not pl:IsMayor() then return end
	local targ = rp.FindPlayer(args[1])
	if not IsValid(targ) then 
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('WantedPlayerNotFound'), args[1])
	elseif not targ:IsWanted() then
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('PlayerNotWanted'), args[1])
	else
		targ:UnWanted(pl)
	end
end)

rp.AddCommand('/warrant', function(pl, text, args)
	if not pl:IsCP() and not pl:IsMayor() or not args[1] or not args[2] then return end
	local targ = rp.FindPlayer(args[1])
	if not IsValid(targ) then 
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('WantedPlayerNotFound'), args[1])
	elseif targ:IsWarranted() then
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('PlayerAlreadyWarranted'), args[1])
	else
		local reason = table.concat(args, ' ', 2)
		for k, v in pairs(rp.teams) do
			if v.mayor then
				mayors = team.GetPlayers(k)
			end
		end
		if (#mayors > 1) and not pl:IsMayor() then
			GAMEMODE.ques:Create(pl:Name() .. ' has requested a search warrant on ' .. targ:Name() .. ' for ' ..  reason, targ:EntIndex() .. 'warrant', mayors[1], 40, function(ret)
				if IsValid(targ) and tobool(ret) then
					rp.Notify(pl, NOTIFY_GREEN, rp.Term('WarrantRequestAcc'))
					targ:Warrant(pl, reason)
				else
					rp.Notify(pl, NOTIFY_ERROR, rp.Term('WarrantRequestDen'))
				end
			end, pl, targ, reason)
		else
			targ:Warrant(pl, reason)
			rp.Notify(pl, NOTIFY_GREEN, rp.Term('WarrantRequestAcc'))
		end
	end
end)

rp.AddCommand('/unwarrant', function(pl, text, args)
	if not pl:IsCP() and not pl:IsMayor() or not args[1] then return end
	local targ = rp.FindPlayer(args[1])
	if not IsValid(targ) then 
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('WantedPlayerNotFound'), args[1])
	elseif not targ:IsWarranted() then
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('PlayerNotWarranted'), args[1])
	else
		targ:UnWarrant(pl)
	end
end)


local bounds = rp.cfg.Jails[game.GetMap()]
if bounds then
	hook('PlayerThink', function(pl)
		if IsValid(pl) and pl:IsArrested() and pl.CanEscape and (not pl:InBox(bounds[1], bounds[2])) then
			rp.ArrestedPlayers[pl:SteamID64()] = nil
			pl:SetNetVar('ArrestedInfo', nil)
			timer.Destroy('Arrested' .. pl:SteamID64())
					
			pl:Wanted(nil, 'Jail Escapee')

			hook.Call('PlayerLoadout', GAMEMODE, pl)
		end
	end)
end

hook('PlayerEntityCreated', function(pl)
	if pl:IsArrested() then
		pl:Arrest(nil, 'Disconnecting to avoid arrest')
	end
end)

hook('PlayerDeath', function(pl, killer, dmginfo)
	if (!killer:IsPlayer()) then return end
	
	if pl:IsWanted() and killer:IsCP() and (pl ~= killer) and (killer ~= game.GetWorld()) then
		pl:UnWanted()
	end
end)