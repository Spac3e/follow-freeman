ba.AddTerm('MusicStopped', 'Вся музыка была остановлена.')
ba.AddTerm('AdminRefreshedSongs', '# обновил проигрователи.')
ba.AddTerm('AdminBroadcastSong', '# играл "#". Используй !stopmusic чтобы врубить музыку.')

-------------------------------------------------
-- Jukebox
-------------------------------------------------
local cmd = ba.cmd.Create('Jukebox', function(pl, args)
	ba.Jukebox.OpenMenu(pl)
end)
cmd:SetHelp('Opens the jukebox')

-------------------------------------------------
-- Stop Music
-------------------------------------------------
local cmd = ba.cmd.Create('StopMusic', function(pl, args)
	ba.notify(pl, ba.Term('MusicStopped'))
end)
cmd:RunOnClient(function(args)
	ba.Jukebox.StopMusic()
end)
cmd:SetHelp('Stops all playing music for yourself')

-------------------------------------------------
-- Refresh Songs
-------------------------------------------------
local cmd = ba.cmd.Create('RefreshSongs', function(pl, args)
	ba.notify_all(ba.Term('AdminRefreshedSongs'), pl)
	ba.Jukebox.RefreshSongs()
end)
cmd:SetFlag('G')
cmd:SetHelp('Reloads the jukebox songs')

-------------------------------------------------
-- Broadcast Song
-------------------------------------------------
local cmd = ba.cmd.Create('BroadcastSong', function(pl, args)
	ba.notify_all(ba.Term('AdminBroadcastSong'), pl, args.song)
	ba.Jukebox.PlayGlobalSong(args.song)
end)
cmd:AddParam('string', 'song')
cmd:SetFlag('G')
cmd:SetHelp('Reloads the jukebox songs')
