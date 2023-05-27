
-----------------------------------------------------
rp.orgs = rp.orgs or {}

function PLAYER:GetOrg()
	return self:GetNetVar('Org')
end

function PLAYER:GetOrgData()
	return self:GetNetVar('OrgData')
end

function PLAYER:GetOrgColor()
	local c = self:GetNetVar('OrgColor')

	return (c and Color(c.r, c.g, c.b) or Color(255, 255, 255))
end

rp.orgs.BaseData = {
	['Owner'] = {
		Rank = 'Owner',
		Perms = {
			Weight = 100,
			Owner = true,
			Invite = true,
			Kick = true,
			Rank = true,
			MoTD = true
		}
	}
}

function rp.orgs.GetOnlineMembers(org)
	return table.Filter(player.GetAll(), function(pl) return (pl:GetOrg() == org) end)
end

-- Networking
nw.Register'Org':Write(net.WriteString):Read(net.ReadString):SetPlayer()

nw.Register'OrgColor':Write(function(v)
	net.WriteUInt(v.r, 8)
	net.WriteUInt(v.g, 8)
	net.WriteUInt(v.b, 8)
end):Read(function() return Color(net.ReadUInt(8), net.ReadUInt(8), net.ReadUInt(8)) end):SetPlayer()

nw.Register'OrgData':Write(function(v)
	net.WriteString(v.Rank)
	net.WriteString(v.MoTD)
	net.WriteUInt(v.Perms.Weight, 7)
	net.WriteBool(v.Perms.Owner)
	net.WriteBool(v.Perms.Invite)
	net.WriteBool(v.Perms.Kick)
	net.WriteBool(v.Perms.Rank)
	net.WriteBool(v.Perms.MoTD)
end):Read(function()
	return {
		Rank = net.ReadString(),
		MoTD = net.ReadString(),
		Perms = {
			Weight = net.ReadUInt(7),
			Owner = net.ReadBool(),
			Invite = net.ReadBool(),
			Kick = net.ReadBool(),
			Rank = net.ReadBool(),
			MoTD = net.ReadBool()
		}
	}
end):SetLocalPlayer()