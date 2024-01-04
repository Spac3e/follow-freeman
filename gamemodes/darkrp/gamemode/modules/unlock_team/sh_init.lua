function PLAYER:TeamUnlocked(t)
	return self:IsVIP() || !t.unlockPrice || self:GetNetVar('JobUnlocks')[t.command]
end