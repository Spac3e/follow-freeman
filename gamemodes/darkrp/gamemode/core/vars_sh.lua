-- Global vars
nw.Register'TheLaws':Write(net.WriteString):Read(net.ReadString):SetGlobal()
nw.Register'lockdown':Write(net.WriteBool):Read(net.ReadBool):SetGlobal()
nw.Register'mayorGrace':Write(net.WriteUInt, 32):Read(net.ReadUInt, 32):SetGlobal()
-- Player Vars
nw.Register'HasGunlicense':Write(net.WriteBool):Read(net.ReadBool):SetPlayer()
nw.Register'Name':Write(net.WriteString):Read(net.ReadString):SetPlayer()
nw.Register'Money':Write(net.WriteUInt, 32):Read(net.ReadUInt, 32):SetLocalPlayer()
nw.Register'Karma':Write(net.WriteUInt, 7):Read(net.ReadUInt, 7):SetLocalPlayer()
nw.Register'job':Write(net.WriteString):Read(net.ReadString):SetPlayer()
nw.Register'Hat':Write(net.WriteUInt, 6):Read(net.ReadUInt, 6):SetPlayer()

nw.Register'HatData':Write(function(v)
	net.WriteUInt(#v, 6)

	for k, v in ipairs(v) do
		net.WriteString(v)
	end -- TODO: FIX
end):Read(function()
	local tbl = {}

	for i = 1, net.ReadUInt(6) do
		tbl[i] = net.ReadString()
	end

	return tbl
end):SetLocalPlayer()

nw.Register'Employee':Write(net.WritePlayer):Read(net.ReadPlayer):SetLocalPlayer()
nw.Register'Employer':Write(net.WritePlayer):Read(net.ReadPlayer):SetPlayer()
nw.Register'DisguiseTeam':Write(net.WriteUInt, 8):Read(net.ReadUInt, 8):SetPlayer()
nw.Register'DisguiseTime':Write(net.WriteUInt, 32):Read(net.ReadUInt, 32):SetLocalPlayer()
nw.Register'ShareProps':Write(net.WriteTable):Read(net.ReadTable):SetLocalPlayer()
nw.Register'PropIsOwned':Write(net.WriteBool):Read(net.ReadBool):Filter(function(self) return self:CPPIGetOwner() end):SetNoSync()
nw.Register'Credits':Write(net.WriteUInt, 32):Read(net.ReadUInt, 32):SetLocalPlayer()

nw.Register'Upgrades':Write(function(v)
	net.WriteUInt(#v, 8)

	for k, upgid in ipairs(v) do
		net.WriteUInt(upgid, 8)
	end
end):Read(function()
	local ret = {}

	for i = 1, net.ReadUInt(8) do
		local obj = rp.shop.Get(net.ReadUInt(8))
		ret[obj:GetUID()] = true
	end

	return ret
end):SetLocalPlayer()

nw.Register'Outfit':Write(net.WriteUInt, 6):Read(net.ReadUInt, 6):SetPlayer()

nw.Register'JobUnlocks':Write(net.WriteTable):Read(net.ReadTable):SetLocalPlayer()
nw.Register"InventoryBlocked":Write(net.WriteBool):Read(net.ReadBool):SetPlayer()
function PLAYER:HasBlockedInventory()
	return self:GetNetVar("InventoryBlocked") or self:GetJobTable().InventoryBlock
end

if SERVER then

	function PLAYER:SetInventoryBlock(b)
		self:SetNetVar("InventoryBlocked", tobool(b))
	end
	
end