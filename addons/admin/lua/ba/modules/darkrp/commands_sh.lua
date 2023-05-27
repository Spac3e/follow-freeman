ba.AddTerm('EntityNoOwner', 'У данного предмета нет владельца.')
ba.AddTerm('CannotUnown', 'You cannot unown this door.')
ba.AddTerm('EntityOwnedBy', '# владелец данного предмета.')
ba.AddTerm('AdminUnownedYourDoor', '# force unowned your door.')
ba.AddTerm('AdminUnownedPlayerDoor', '# force unowned #\'s door.')
ba.AddTerm('AdminChangedYourJob', '# has force changed your job to #.')
ba.AddTerm('AdminChangedPlayerJob', '# has force changed #\'s job to #.')
ba.AddTerm('JobNotFound', 'Профессия # не найдена!')
ba.AddTerm('AdminUnwantedYou', '# has force unwanted you.')
ba.AddTerm('AdminUnwantedPlayer', '# has force unwanted #.')
ba.AddTerm('PlayerNotWanted', '# не в розыске!')
ba.AddTerm('AdminUnarrestedYou', '# has force unarrested you.')
ba.AddTerm('AdminUnarrestedPlayer', '# has force unarrested #.')
ba.AddTerm('PlayerNotArrested', '# is not arrested!')
ba.AddTerm('AdminUnwarrantedYou', '# has force unwarranted you.')
ba.AddTerm('AdminUnwarrantedPlayer', '# has force unwarranted #.')
ba.AddTerm('PlayerNotWarranted', '# is not warranted!')
ba.AddTerm('EventInvalid', '# is not a valid event!')
ba.AddTerm('AdminStartedEvent', '# запустил ивент # на #.')
ba.AddTerm('AdminFrozePlayersProps', '# has frozen #\'s props.')
ba.AddTerm('AdminFrozeAllProps', '# has frozen all props.')
ba.AddTerm('PlayerVoteInvalid', 'No vote for # exists!')
ba.AddTerm('AdminDeniedVote', '# отменил голосование #.')
ba.AddTerm('AdminDeniedTeamVote', '# отменил голосование #.')
ba.AddTerm('AdminAddedYourMoney', '# has added $# to your wallet.')
ba.AddTerm('AdminAddedMoney', 'You have added $# to #\'s wallet.')
ba.AddTerm('AdminAddedYourCredits', '# has added # credits to your account.')
ba.AddTerm('AdminAddedCredits', '# выдал # кредитов на твой аккаунт.')
ba.AddTerm('AdminMovedPlayers', 'Moved # players to the other server.')
ba.AddTerm('PlayerNotFound', 'Couldn\'t find player #.')
ba.AddTerm('TargetCantJob', 'Target do not have this job unlocked.')

ba.cmd.Create('Go', function(pl, args)
	local ent = pl:GetEyeTrace().Entity
	if IsValid(ent) and (ent:CPPIGetOwner() or ent.ItemOwner) then
		ba.notify(pl, ba.Term('EntityOwnedBy'), (ent:CPPIGetOwner() or ent.ItemOwner))
	else
		ba.notify_err(pl, ba.Term('EntityNoOwner'))
	end
end)
:SetFlag('U')
:SetHelp('Shows the owner of a prop')

ba.cmd.Create('Unown', function(pl, args)
	local ent = pl:GetEyeTrace().Entity
	if IsValid(ent) and ent:IsDoor() and ent:DoorGetOwner() then
		ba.notify(ent:DoorGetOwner(), ba.Term('AdminUnownedYourDoor'), pl)
		ba.notify_staff(ba.Term('AdminUnownedPlayerDoor'), pl, ent:DoorGetOwner())
		ent:DoorUnOwn()
	else
		ba.notify_err(pl, ba.Term('CannotUnown'))
	end
end)
:SetFlag('M')
:SetHelp('Force unowns a door')

ba.cmd.Create('Setjob', function(pl, args)
	for k, v in ipairs(rp.teams) do
		if string.find(v.name:lower(), args.name:lower()) then
			if !args.target:CanTeam(v) then
				ba.notify_err(pl, ba.Term('TargetCantJob'), args.name)
				return
			end
			ba.notify(args.target, ba.Term('AdminChangedYourJob'), pl, v.name)
			ba.notify_staff(ba.Term('AdminChangedPlayerJob'), pl, args.target, v.name)
			if not args.target:Alive() then
				args.target:Spawn()
			end
			args.target:ChangeTeam(k, true)
			args.target:Spawn()
			return
		end
	end
	ba.notify_err(pl, ba.Term('JobNotFound'), args.name)
end)
:AddParam('player_entity', 'target')
:AddParam('string', 'name')
:SetFlag('A')
:SetHelp('Forces a players job')

ba.cmd.Create('Force Unwant', function(pl, args)
	if args.target:IsWanted() then
		ba.notify(args.target, ba.Term('AdminUnwantedYou'), pl)
		ba.notify_staff(ba.Term('AdminUnwantedPlayer'), pl, args.target)
		args.target:UnWanted(pl, false)
	else
		ba.notify_err(pl, ba.Term('PlayerNotWanted'), args.target)
	end
end)
:AddParam('player_entity', 'target')
:SetFlag('A')
:SetHelp('Force unwants a player')
:AddAlias('funwant')

ba.cmd.Create('Force Unarrest', function(pl, args)
	if args.target:IsArrested() then
		ba.notify(args.target, ba.Term('AdminUnarrestedYou'), pl)
		ba.notify_staff(ba.Term('AdminUnarrestedPlayer'), pl, args.target)
		args.target:UnArrest(pl, false)
	else
		ba.notify_err(pl, ba.Term('PlayerNotArrested'), args.target)
	end
end)
:AddParam('player_entity', 'target')
:SetFlag('A')
:SetHelp('Force unarrests a player')
:AddAlias('funarrest')

ba.cmd.Create('Force UnWarrant', function(pl, args)
	if args.target:IsWarranted() then
		ba.notify(args.target, ba.Term('AdminUnwarrantedYou'), pl)
		ba.notify_staff(ba.Term('AdminUnwarrantedPlayer'), pl, args.target)
		args.target:UnWarrant(pl)
	else
		ba.notify_err(pl, ba.Term('PlayerNotWarranted'), args.target)
	end
end)
:AddParam('player_entity', 'target')
:SetFlag('A')
:SetHelp('Force unwants a player')
:AddAlias('funwarrant')

ba.cmd.Create('Start Event', function(pl, args)
	local event = string.lower(args.event)
	if (rp.Events[event] == nil) then
		ba.notify_err(pl, ba.Term('EventInvalid'), event)
	else
		rp.StartEvent(event, args.time)
		ba.notify_all(ba.Term('AdminStartedEvent'), pl, event, args.raw.time)
	end
end)
:AddParam('string', 'event')
:AddParam('time', 'time')
:SetFlag('G')
:SetHelp('Starts and event')

ba.cmd.Create('Freeze Props', function(pl, args)
	if IsValid(args.target) then
		ba.notify_staff(ba.Term('AdminFrozePlayersProps'), pl, args.target)
		for k, v in ipairs(ents.GetAll()) do
	        if IsValid(v) and v:IsProp() and (v:CPPIGetOwner() == args.target) then
	            local phys = v:GetPhysicsObject()
	            if IsValid(phys) then
	                phys:EnableMotion(false)
	            end
	            constraint.RemoveAll(v)
	        end
	    end
	else
		ba.notify_staff(ba.Term('AdminFrozeAllProps'), pl)
		for k, v in ipairs(ents.GetAll()) do
	        if IsValid(v) and v:IsProp() then
	            local phys = v:GetPhysicsObject()
	            if IsValid(phys) then
	                phys:EnableMotion(false)
	            end
	            constraint.RemoveAll(v)
	        end
	    end
	end
end)
:AddParam('player_entity', 'target', 'optional')
:SetFlag('A')
:SetHelp('Freezes all props')

ba.cmd.Create('Deny Vote', function(pl, args)
	if (not rp.VoteExists(args.target)) then
		ba.notify_err(pl, ba.Term('PlayerVoteInvalid'), args.target)
	else
		GAMEMODE.vote.DestroyVotesWithEnt(args.target)
		ba.notify_staff(ba.Term('AdminDeniedVote'), pl, args.target)
	end
end)
:AddParam('player_entity', 'target')
:SetFlag('M')
:SetHelp('Denies a vote for the target')

ba.cmd.Create('Deny Team Vote', function(pl, args)
	if (!rp.teamVote.Votes[args.target]) then
		ba.notify_err(pl, ba.Term('PlayerVoteInvalid'), args.target)
	else
		rp.teamVote.Votes[args.target] = nil
		for k, v in ipairs(rp.teams) do
			if (v.name == args.target) then
				v.CurVote = nil
			end
		end
		ba.notify_staff(ba.Term('AdminDeniedTeamVote'), pl, args.target)
	end
end)
:AddParam('string', 'target')
:SetFlag('M')
:SetHelp('Denies a team vote')

ba.cmd.Create('Donate')
:RunOnClient(function()
	gui.OpenURL(rp.cfg.CreditsURL .. "?sid=" .. LocalPlayer():SteamID())
end)
:SetFlag('U')
:SetHelp('Opens our credit shop')
:AddAlias('shop')


ba.cmd.Create('Add Money', function(pl, args)
	args.target:AddMoney(tonumber(args.amount))
	ba.notify(args.target, ba.Term('AdminAddedYourMoney'), pl, args.amount)
	ba.notify(pl, ba.Term('AdminAddedMoney'), args.amount, args.target)
end)
:AddParam('player_entity', 'target')
:AddParam('string', 'amount')
:SetFlag('*')
:SetHelp('Gives a player money')

ba.cmd.Create('Add Credits', function(pl, args)
	if ba.IsPlayer(args.target) then
		args.target:AddCredits(args.amount, 'Given by ' .. pl:NameID(), function()
			ba.notify(args.target, ba.Term('AdminAddedYourCredits'), pl, args.amount)
		end)
	else
		rp.data.AddCredits(ba.InfoTo32(args.target), tonumber(args.amount), 'Given by ' .. pl:NameID())
	end
	if pl:IsPlayer() then
		ba.data.GetDB():query_ex('INSERT INTO ba_logs VALUES(NOW(), ?, "?", ?, ?, "?", "?")', {pl:SteamID64(), pl:Nick(), ba.InfoTo64(args.target), '(SELECT Name FROM player_data WHERE SteamID='..ba.InfoTo64(args.target)..')', 'addcredits', args.amount})
	end
	ba.notify(pl, ba.Term('AdminAddedCredits'), args.target, args.amount)
end)
:AddParam('player_steamid', 'target')
:AddParam('string', 'amount')
:SetFlag('x')
:SetHelp('Gives a player credits')

if (SERVER) then util.AddNetworkString('Pocket.Inspect') end
ba.cmd.Create('View Pocket', function(pl, args)
	net.Start('Pocket.Inspect')
		net.WriteEntity(args.target)
		net.WriteTable(rp.inv.Data[args.target:SteamID64()] or {})
	net.Send(pl)
end)
:AddParam('player_entity', 'target')
:SetFlag('A')
:SetHelp('Displays the target\'s pocket contents on your screen')


local moveCmdCategories = {
	['afk'] = function(pl) return (pl:IsAFK()) end,
	['banned'] = function(pl) return pl:IsBanned() end,
	['dead'] = function(pl) return !pl:Alive() end,
	['all'] = function() return true end
}
ba.cmd.Create('Move', function(ply, args)
	local str = args["Category/Player/Evaluator"]
	local cat = str:lower()
	local eval
	
	if (moveCmdCategories[cat]) then
		eval = moveCmdCategories[cat]
		
		local count = 0
		for k, v in ipairs(player.GetAll()) do
			if (eval(v)) then
				count = count + 1
				
				v:SendLua([[LocalPlayer():ConCommand('connect ]] .. info.AltServerIP .. [[')]])
			end
		end
		
		ba.notify(ply, ba.Term('AdminMovedPlayers'), tostring(count))
	else
		local targ = ba.FindPlayer(str)
		
		if (targ) then
			targ:SendLua([[LocalPlayer():ConCommand('connect ]] .. info.AltServerIP .. [[')]])
			return
		else
			ba.notify(ply, ba.Term('PlayerNotFound'), str)
		end
	end
end)
:AddParam('string', 'Category/Player/Evaluator')
:SetFlag('*')
:SetHelp('Moves the given set of players to the other server. Categories: ' .. table.ConcatKeys(moveCmdCategories, ', ') .. '.')