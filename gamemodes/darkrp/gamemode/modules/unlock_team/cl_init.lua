function rp.UnlockTeam(iTeam)
	net.Start('rp.UnlockTeam')
		net.WriteInt(iTeam, 8)
	net.SendToServer()
end