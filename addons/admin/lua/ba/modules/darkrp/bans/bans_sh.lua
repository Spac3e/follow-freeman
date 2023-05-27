nw.Register('IsBanned', {
    Read     = net.ReadBool,
    Write    = net.WriteBool,
    LocalVar = true
})

function PLAYER:IsBanned()
	return (self:GetNetVar('IsBanned') == true)
end