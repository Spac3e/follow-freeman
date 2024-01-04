function PLAYER:IsMayor()
	return rp.teams[self:Team()].mayor or false
end

function PLAYER:IsCP()
	return self:GetFaction() == FACTION_WEHRMACHT
end

if (SERVER) then
	function PLAYER:IsArrested()
		return (rp.ArrestedPlayers[self:SteamID64()] == true)
	end
else
	function PLAYER:IsArrested()
		return (self:GetNetVar('ArrestedInfo') ~= nil)
	end
end

function PLAYER:IsWanted()
	return (self:GetNetVar('IsWanted') == true)
end

function PLAYER:GetWantedReason()
	return self:GetNetVar('WantedReason')
end

function PLAYER:GetArrestInfo()
	return self:GetNetVar('ArrestedInfo')
end

nw.Register'IsWanted':Write(net.WriteBool):Read(net.ReadBool):SetPlayer()

nw.Register'WantedReason':Read(net.ReadString):Write(net.WriteString):SetPlayer()

nw.Register('ArrestedInfo', {
	Read = function()
		return {
			Reason = net.ReadString(),
			Release = net.ReadUInt(32)
		}
	end,
	Write = function(v)
		net.WriteString(v.Reason)
		net.WriteUInt(v.Release, 32)
	end,
	LocalVar = true
})