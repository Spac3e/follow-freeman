ba.AddTerm('AdminKickedPlayer', '# кикнул #. Причина: #.')
ba.AddTerm('AdminBannedPlayer', '# забанил # на #. Причина: #.')
ba.AddTerm('AdminUpdatedBan', '# продлил бан # на #. Причина: #.')
ba.AddTerm('PlayerAlreadyBanned', 'Этот игрок уже имеет бан. Чтобы его продлить вам нужен флаг доступа "D".')
ba.AddTerm('BanNeedsPermission', 'Для бесконечного бана вам нужно разрешение, укажите ник кто вам его дал. Добавьте в причина(в скобках ник админа).')
ba.AddTerm('AdminPermadPlayer', '# забанил навсегда #. Причина: #.')
ba.AddTerm('AdminUpdatedBanPerma', '# продлил бан навсегда #. Причина: #.')
ba.AddTerm('PlayerAlreadyPermad', 'Этот игрок уже имеет бан! Чтобы его продлить навсегда, вам нужен флаг доступа "G".')
ba.AddTerm('AdminUnbannedPlayer', '# разбанил #. Причина: #.')
ba.AddTerm('MaxBanTime', 'Максимальное время бана 20 минут!')

-------------------------------------------------
-- Kick
-------------------------------------------------
ba.cmd.Create('Kick', function(pl, args)
	ba.notify_all(ba.Term('AdminKickedPlayer'), pl, args.target, args.reason)
	args.target:Kick(args.reason)
end)
:AddParam('player_entity', 'target')
:AddParam('string', 'reason')
:SetFlag('S')
:SetHelp('Kicks your target from the server')
:SetIcon('icon16/door_open.png')

-------------------------------------------------
-- Ban
-------------------------------------------------
ba.cmd.Create('Ban', function(pl, args)
	local banned, _ = ba.IsBanned(ba.InfoTo64(args.target))

	if args.time > 1200 then
		ba.notify_err(pl, ba.Term('MaxBanTime'))
		return
	end

	if not banned then
		ba.Ban(args.target, args.reason, args.time, pl, function()
			ba.notify_all(ba.Term('AdminBannedPlayer'), pl, args.target, args.raw.time, args.reason)
		end)
	elseif banned and (not ba.IsPlayer(pl) or pl:HasAccess('S')) then
		ba.UpdateBan(ba.InfoTo64(args.target), args.reason, args.time, pl, function()
			ba.notify_all(ba.Term('AdminUpdatedBan'), pl, args.target, args.raw.time, args.reason)
		end)
	else
		ba.notify_err(pl, ba.Term('PlayerAlreadyBanned'))
	end
end)
:AddParam('player_steamid', 'target')
:AddParam('time', 'time')
:AddParam('string', 'reason')
:SetFlag('M')
:SetHelp('Bans your target from the server')
:SetIcon('icon16/door_open.png')

-------------------------------------------------
-- Perma
-------------------------------------------------
ba.cmd.Create('Perma', function(pl, args)
	local banned, _ = ba.IsBanned(ba.InfoTo64(args.target))

	if not banned then
		if (!pl:HasAccess("S")) then
			if (!string.find(args.reason:lower(), 'perm:')) then
				ba.notify(pl, ba.Term('BanNeedsPermission'))
				return
			end
		end

		ba.Ban(args.target, args.reason, 0, pl, function()
			ba.notify_all(ba.Term('AdminPermadPlayer'), pl, args.target, args.reason)
		end)
	elseif banned and (not ba.IsPlayer(pl) or pl:HasAccess('S')) then
		ba.UpdateBan(ba.InfoTo64(args.target), args.reason, 0, pl, function()
			ba.notify_all(ba.Term('AdminUpdatedBanPerma'), pl, args.target, args.reason)
		end)
	else
		ba.notify_err(pl, ba.Term('PlayerAlreadyPermad'))
	end
end)
:AddParam('player_steamid', 'target')
:AddParam('string', 'reason')
:SetFlag('g')
:SetHelp('Bans your target from the server forever')
:SetIcon('icon16/door_open.png')

-------------------------------------------------
-- Unban
-------------------------------------------------
ba.cmd.Create('Unban', function(pl, args)
	ba.Unban(ba.InfoTo64(args.steamid), args.reason, function()
		ba.notify_all(ba.Term('AdminUnbannedPlayer'), pl, args.steamid, args.reason)
	end)
end)
:AddParam('player_steamid', 'steamid')
:AddParam('string', 'reason')
:SetFlag('S')
:SetHelp('Unbans your target from the server forever')
:SetIcon('icon16/door_open.png')
