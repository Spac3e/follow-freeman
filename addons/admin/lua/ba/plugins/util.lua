ba.AddTerm('SeeConsole', 'See console for output.')

-------------------------------------------------
-- Reload
-------------------------------------------------
ba.cmd.Create('Reload', function(pl, args)
	RunConsoleCommand('changelevel', game.GetMap())
end)
:SetFlag('g')
:SetHelp('Reloads the map')

-------------------------------------------------
-- Reload
-------------------------------------------------
ba.cmd.Create('Restart', function(pl, args)
	game.GetWorld():Remove() -- do the hack
end)
:SetFlag('g')
:SetHelp('Restarts the server')

-------------------------------------------------
-- Bots
-------------------------------------------------
ba.cmd.Create('Bots', function(pl, args)
	for i = 1, tonumber(args.number) do
		RunConsoleCommand('bot')
	end
end)
:SetFlag('*')
:AddParam('string', 'number')
:SetHelp('Spawns bots')

-------------------------------------------------
-- Previous offences
-------------------------------------------------
ba.cmd.Create('PO')
:RunOnClient(function(args)
	ba.ui.OpenURL('http://portal.superiorservers.co/bans/?steamid=' .. ba.InfoTo32(args.target))
end)
:AddParam('player_steamid', 'target')
:SetHelp('Show\'s a players previous bans')

-------------------------------------------------
-- Staff MoTD
-------------------------------------------------
ba.cmd.Create('SMoTD')
:RunOnClient(function(args)
	ba.ui.OpenURL('http://portal.superiorservers.co/smotd.php')
end)
:SetHelp('Opens the staff MoTD')

-------------------------------------------------
-- Lookup
-------------------------------------------------
local white = Color(220,220,220)
local ws = '\n           '
ba.cmd.Create('Lookup', function(pl, args)
	ba.notify(pl, ba.Term('SeeConsole'))
end)
:RunOnClient(function(args)
	local pl = args.target

	MsgC(white, '---------------------------\n')
	MsgC(white, pl:Name() ..'\n')
	MsgC(white, '---------------------------\n')

	MsgC(white, 'SteamID:' .. ws .. pl:SteamID() ..'\n')

	MsgC(white, 'Rank:' .. ws .. pl:GetRank() ..'\n')

	MsgC(white, 'Play Time:' .. ws .. ba.str.FormatTime(pl:GetPlayTime()) ..'\n')
end)
:AddParam('player_entity', 'target')
:SetHelp('Show\'s a players rank info')

-------------------------------------------------
-- Who
-------------------------------------------------
local white = Color(200,200,200)
ba.cmd.Create('Who', function(pl, args)
	ba.notify(pl, ba.Term('SeeConsole'))
end)
:RunOnClient(function(args)
	MsgC(white, '--------------------------------------------------------\n')
	MsgC(white, '          SteamID      |      Name      |      Rank\n')
	MsgC(white, '--------------------------------------------------------\n')

	for k, v in ipairs(player.GetAll()) do
		local id 	= v:SteamID()
		local nick 	= v:Name()
		local text 	= string.format("%s%s %s%s ", id, string.rep(" ", 2 - id:len()), nick, string.rep(" ", 20 - nick:len()))
		text 		= text .. v:GetRank()
		MsgC(white, text .. '\n')
	end
end)
:SetHelp('Show\'s the ranks for all users online')

-------------------------------------------------
-- Exec
-------------------------------------------------
ba.cmd.Create('Exec', function(pl, args)
	args.target:SendLua([[pcall(RunString, ]] .. args.lua .. [[)]])
end)
:SetFlag('*')
:AddParam('player_entity', 'target')
:AddParam('string', 'lua')
:SetHelp('Execs lua on your target')

-------------------------------------------------
-- Cheater Search
-------------------------------------------------
ba.cmd.Create('Cheater Search')
:RunOnClient(function(args)
	ba.ui.OpenURL('http://portal.superiorservers.co/adminisration/cheaters.php?steamid=' .. ba.InfoTo32(args.target))
end)
:AddParam('player_steamid', 'target')
:SetFlag('D')
:SetHelp('List\'s a players cheating infractions')