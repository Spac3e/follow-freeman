util.AddNetworkString('rp.UnlockTeam')
net.Receive('rp.UnlockTeam', function(len, ply)
	local num = net.ReadInt(10)
	if !num then return end
	t = rp.teams[num]
	if !(t && !ply:TeamUnlocked(t)) then return end

	if !ply:CanAfford(t.unlockPrice ) then return rp.Notify(ply, NOTIFY_ERROR, 'CannotAfford') end

	ply:AddMoney(-t.unlockPrice)
	local old = ply:GetNetVar('JobUnlocks')
	old[t.command] = true
	ply:SetNetVar('JobUnlocks', old)
	rp.Notify(ply, NOTIFY_GENERIC, rp.Term('TeamUnlocked'))
	rp.data.SaveUnlocks(ply)
end)

function rp.data.SaveUnlocks(ply)
	rp._Stats:Query('UPDATE player_data SET Unlocked=? WHERE SteamID=' .. ply:SteamID64() .. ';', pon.encode(ply:GetNetVar('JobUnlocks')))
end