rp.orgs = rp.orgs or {}
rp.orgs.cached = rp.orgs.cached or {}
rp.orgs.Colors = rp.orgs.Colors or {}

util.AddNetworkString('rp.OrgsMenu')
util.AddNetworkString('rp.SetOrgMoTD')
util.AddNetworkString('rp.OrgBannerReceived')
util.AddNetworkString('rp.OrgBannerInvalidate')
util.AddNetworkString('rp.SetOrgBanner')
util.AddNetworkString('rp.SetOrgBannerDefault')
util.AddNetworkString('rp.orgs.GetColors')
util.AddNetworkString('rp.orgs.GetColor')

local db = rp._Stats

local function sendColor(name)
	timer.Simple(0.3, function()
		local v = rp.orgs.Colors[name] or Color(255, 255, 255, 255)
		
		net.Start('rp.orgs.GetColor')
			net.WriteString(name)
			net.WriteColor(Color(math.floor(v.r or 0), math.floor(v.g or 0), math.floor(v.b or 0), math.floor(v.a or 255)))
		net.Broadcast()
	end)
end

-- Creation & Modification
function rp.orgs.Exists(name, cback)
	db:Query('SELECT COUNT("Name") FROM orgs WHERE Name=?;', name, function(count)
		cback(count[1]['COUNT("Name")'] and tonumber(count[1]['COUNT("Name")']) > 0)
	end)
end

function rp.orgs.Create(steamid, name, color, callback)
	rp.orgs.Colors[name] = color
	sendColor(name)
	
	db:Query('INSERT INTO orgs(Owner, Name, Color, MoTD) VALUES(?, ?, ?, ?);', steamid, name, pcolor.ToHex(color), 'Welcome to ' .. name .. '!', function()
		db:Query('INSERT INTO org_rank(Org, RankName, Weight, Invite, Kick, Rank, MoTD) VALUES(?, ?, ?, ?, ?, ?, ?),(?, ?, ?, ?, ?, ?, ?);', name, 'Owner', 100, 1, 1, 1, 1, name, 'Member', 1, 0, 0, 0, 0, function()
			rp.orgs.cached[name] = {
				Members = {},
				Ranks = {
					Owner = {
						Org=name,
						RankName='Owner',
						Weight=100,
						Invite=true,
						Kick=true,
						Rank=true,
						MoTD=true
					},
					Members = {
						Org=name,
						RankName='Member',
						Weight=1,
						Invite=false,
						Kick=false,
						Rank=false,
						MoTD=false
					}
				}
			}
		
			rp.orgs.Join(steamid, name, 'Owner', callback)
		end)
	end)
end

function rp.orgs.Remove(name, callback)
	db:Query('DELETE FROM orgs WHERE Name=?;', name, function()
		db:Query('DELETE FROM org_player WHERE Org=?;', name, function()
			db:Query('DELETE FROM org_rank WHERE Org=?;', name, function()
				db:Query('DELETE FROM org_banner WHERE Org=?;', name, function()
					for k, v in ipairs(rp.orgs.GetOnlineMembers(name)) do
						v:SetOrg(nil, nil)
						v:SetOrgData(nil)
						rp.Notify(v, NOTIFY_ERROR, rp.Term('OrgDisbanded'), name)
					end
					
					rp.orgs.cached[name] = nil
					
					if callback then callback() end
				end)
			end)
		end)
	end)
end

function rp.orgs.Quit(steamid, callback)
	db:Query('DELETE FROM org_player WHERE SteamID=?;', steamid, callback)
end

function rp.orgs.SetMoTD(org, motd, callback)
	db:Query('UPDATE orgs SET MoTD=? WHERE Name=?', motd, org, function() -- this line was not playing nice
		for k, v in ipairs(rp.orgs.GetOnlineMembers(org)) do
			local dat = v:GetOrgData()
			dat.MoTD = motd
			v:SetOrgData(dat)
		end
		if callback then callback() end
	end)
end

function rp.orgs.SetColor(org, color, callback)
	db:Query('UPDATE orgs SET Color=? WHERE Name=?', pcolor.ToHex(color), org, function()
		rp.orgs.Colors[org] = color
		sendColor(org)
		
		for k, v in ipairs(rp.orgs.GetOnlineMembers(org)) do
			v:SetOrg(org, color)
		end

		if callback then
			callback()
		end
	end)
end


-- Members
function PLAYER:SetOrg(name, color)
	self:SetNetVar('Org', name)
	self:SetNetVar('OrgColor', color)
end

function rp.orgs.Join(steamid, org, rank, callback)
	rp.orgs.cached[org].Members[steamid] = {
		SteamID=steamid,
		Org=org,
		Rank=rank
	}
	
	db:Query('INSERT INTO org_player(SteamID, Org, Rank) VALUES(?, ?, ?);', steamid, org, rank, callback)
end

function rp.orgs.Kick(steamid, callback)
	local pl = rp.FindPlayer(steamid)

	if (pl) then
		steamid = pl:SteamID64()
	end

	db:Query('DELETE FROM org_player WHERE SteamID=?;', steamid, function()
		if IsValid(pl) then
			rp.Notify(rp.orgs.GetOnlineMembers(pl:GetOrg()), NOTIFY_ERROR, rp.Term('OrgPlayerKicked'), pl, pl:GetOrg())
			rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgPlayerYoureKicked'), pl:GetOrg())
			pl:SetOrg(nil, nil)
			pl:SetOrgData(nil)
		end

		if callback then
			callback()
		end
	end)
end
function rp.orgs.GetMembers(org, callback)
	db:Query("SELECT * FROM org_rank WHERE Org=? ORDER BY Weight DESC;", org, function(ranks)
		db:Query('SELECT org_player.SteamID, org_player.Rank, player_data.Name FROM org_player LEFT JOIN player_data ON org_player.SteamID = player_data.SteamID WHERE org_player.Org = ?;', org, function(members)
		
			rp.orgs.cached[org] = {
				Ranks = {},
				Members = {},
				RanksOrdered = ranks
			}
			
			for k, v in ipairs(ranks) do
				rp.orgs.cached[org].Ranks[v.RankName] = v
			end
			
			for k, v in ipairs(members) do
				rp.orgs.cached[org].Members[v.SteamID] = v
			end
			
			if (callback) then callback(members, ranks) end
		end)
	end)
end

function rp.orgs.GetMemberCount(name, cback)
	db:Query('SELECT COUNT("Name") FROM org_player WHERE Org=?;', name, function(count)
		cback(count[1]['COUNT("Name")'] and tonumber(count[1]['COUNT("Name")']) or 0)
	end)
end

-- Ranks
function PLAYER:SetOrgData(d)
	self:SetNetVar('OrgData', d)
end

function rp.orgs.RecalculateWeights(org, ranks)
	table.SortByMember(ranks, 'Weight', true)
	
	local mems = rp.orgs.GetOnlineMembers(org)
	
	for k, v in ipairs(ranks) do
		local newWeight = 1 + math.floor(((k - 1) / (#ranks - 1)) * 99)
		
		if (newWeight != v.Weight) then		
			for _, pl in pairs(mems) do
				local od = pl:GetOrgData()
				if (od.Rank == v.RankName) then
					od.Weight = v.Weight
					pl:SetOrgData(od)
				end
			end
			
			db:Query('UPDATE org_rank SET Weight=? WHERE Org=? AND RankName=?', newWeight, org, v.RankName)
		end
		
		rp.orgs.cached[org].Ranks[v.RankName].Weight = newWeight
	end
end

function rp.orgs.CanTarget(pl, targID)
	if (!pl:GetOrg()) then return false end
	if (pl:SteamID64() == targID) then return false end
	if (#tostring(targID) != 17) then return false end
	
	if (!rp.orgs.cached[pl:GetOrg()]) then rp.orgs.GetMembers(pl:GetOrg()) end
	
	local targrank = rp.orgs.cached[pl:GetOrg()].Ranks[rp.orgs.cached[pl:GetOrg()].Members[targID].Rank] or rp.orgs.cached[pl:GetOrg()].RanksOrdered[#rp.orgs.cached[pl:GetOrg()].RanksOrdered]
	if (pl:GetOrgData().Perms.Weight <= targrank.Weight) then return false end
	
	return true
end

-- Load data
local function SetOrg(pl, d)
	pl:SetOrg(d.Name, pcolor.FromHex(d.Color))
	local r = d.OrgData
	pl:SetOrgData({
		Rank 	= d.Rank or r.Perms.RankName,
		MoTD 	= d.MoTD,
		Perms 	= {
			Weight 	= r.Perms.Weight,
			Owner 	= (r.Perms.Weight == 100),
			Invite 	= r.Perms.Invite,
			Kick 	= r.Perms.Kick,
			Rank 	= r.Perms.Rank,
			MoTD 	= r.Perms.MoTD,
		}
	})
end


hook('PlayerAuthed', 'rp.orgs.PlayerAuthed', function(pl)
--concommand.Add('or', function(pl)
	local steamid = pl:SteamID64()
	db:Query('SELECT * FROM org_player LEFT JOIN orgs ON org_player.Org = orgs.Name WHERE org_player.SteamID=' .. steamid .. ';', function(data)
		local d = data[1]
		if d then
			d.OrgData = {}
			db:Query('SELECT * FROM org_rank WHERE Org = "' .. d.Org .. '" AND RankName = "' .. d.Rank .. '";', function(data)
				local _d = data[1]
				if _d then
					d.OrgData.Perms = _d
					SetOrg(pl, d)
				end
			end)
		end
	end)
end)


-- Commands

rp.AddCommand('/createorg', function(pl, text, args)
	local name = string.Trim(args[1] or '')

	if (pl:GetOrg() ~= nil) then
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgMustLeaveFirst'))
		return
	end

	if (string.len(name) < 2) then
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgNameShort'))
		return
	end

	if (string.len(name) > 20) then
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgNameLong'))
		return
	end

	rp.orgs.Exists(name, function(exists)
		if (!IsValid(pl)) then return end
		
		if (exists) then
			rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgNameTaken'))
			return
		end

		if not pl:CanAfford(rp.cfg.OrgCost) then
			rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgCannotAfford'))
			return
		end

		local color = Color(255,255,255)
		local start = SysTime()
		rp.orgs.Create(pl:SteamID64(), name, color, function()
			pl:TakeMoney(rp.cfg.OrgCost)
			pl:SetOrg(name, color)
			local orgdata = rp.orgs.BaseData['Owner']
			orgdata.MoTD = 'Welcome to ' .. name .. '!'
			pl:SetOrgData(orgdata)
			rp.Notify(pl, NOTIFY_GREEN, rp.Term('OrgCreated'))
		end)
	end)
end)

net('rp.SetOrgMoTD', function(len, pl)
	if not pl:GetOrg() or not pl:GetOrgData() or not pl:GetOrgData().Perms or not pl:GetOrgData().Perms.Owner then return end

	local motd = net.ReadString()
	rp.orgs.SetMoTD(pl:GetOrg(), motd, function()
		rp.Notify(pl, NOTIFY_GREEN, rp.Term('OrgMOTDChanged'))
	end)
end)

rp.AddCommand('/setorgcolor', function(pl, text, args)
	if not pl:GetOrg() or not pl:GetOrgData() or not pl:GetOrgData().Perms or not pl:GetOrgData().Perms.Owner then return end

	local color = Color(tonumber(args[1] or 255), tonumber(args[2] or 255), tonumber(args[3] or 255))

	rp.orgs.SetColor(pl:GetOrg(), color, function()
		rp.Notify(pl, NOTIFY_GREEN, rp.Term('OrgColorChanged'))
	end)
end)

rp.AddCommand('/orgmenu', function(pl, text, args)
	if not pl:GetOrg() then return end

	rp.orgs.GetMembers(pl:GetOrg(), function(members, ranks)
		net.Start('rp.OrgsMenu')
			local rankref = {}

			net.WriteUInt(#ranks, 4)
			for k, v in ipairs(ranks) do
				net.WriteString(v.RankName)
				net.WriteUInt(v.Weight, 7)
				net.WriteBool(v.Invite)
				net.WriteBool(v.Kick)
				net.WriteBool(v.Rank)
				net.WriteBool(v.MoTD)
				
				rankref[v.RankName] = v.RankName
			end
			
			net.WriteUInt(#members, 8)
			for k, v in ipairs(members) do
				net.WriteString(v.SteamID)
				net.WriteString(v.Name)
				net.WriteString(rankref[v.Rank] or ranks[#ranks].Rank) -- fix for players being a rank that doesnt exist
			end

		net.Send(pl)
	end)
end)

rp.AddCommand('/quitorg', function(pl, text, args)
	if not pl:GetOrg() or not pl:GetOrgData() or not pl:GetOrgData().Perms then return end
	if (!rp.orgs.cached[pl:GetOrg()]) then rp.orgs.GetMembers(pl:GetOrg()) end
	
	if (pl:GetOrgData().Rank == "Stuck") and (not pl:IsRoot()) then
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgYouAreStuck'))
		return
	end -- EASTER EGGS
	
	if pl:GetOrgData().Perms.Owner then
		rp.orgs.Remove(pl:GetOrg())
	else
		rp.orgs.Quit(pl:SteamID64(), function()
			rp.orgs.cached[pl:GetOrg()].Members[pl:SteamID64()] = nil
		
			rp.Notify(rp.orgs.GetOnlineMembers(pl:GetOrg()), NOTIFY_ERROR, rp.Term('OrgPlayerQuit'), pl, pl:GetOrg())
			pl:SetOrg(nil, nil)
			pl:SetOrgData(nil)
		end)
	end
end)

rp.AddCommand('/orgkick', function(pl, text, args)
	if not args[1] or not pl:GetOrg() or not pl:GetOrgData() or not pl:GetOrgData().Perms or not pl:GetOrgData().Perms.Kick or pl:GetOrgData().Perms.Kick == 0 or not rp.orgs.CanTarget(pl, args[1]) then return end

	local sid = args[1]
	local target = rp.FindPlayer(sid)

	rp.orgs.cached[pl:GetOrg()].Members[args[1]] = nil
	rp.orgs.Kick(args[1])
end)

rp.AddCommand('/orginvite', function(pl, text, args)
	if not args[1] or not pl:GetOrg() or not pl:GetOrgData() or not pl:GetOrgData().Perms or not pl:GetOrgData().Perms.Invite then return end
	local targ = rp.FindPlayer(args[1])
	
	if (targ:GetOrg()) then return end
	
	if (!rp.orgs.cached[pl:GetOrg()]) then rp.orgs.GetMembers(pl:GetOrg()) end

	local org = pl:GetOrg()

	rp.orgs.GetMemberCount(org, function(count)
		if (!IsValid(pl)) then return end
		
		local lim = (pl:HasUpgrade('org_prem') and 100 or 50)
		if (count >= lim) then
			rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgMemberLimit'), lim)
			return
		end

		if not IsValid(targ) then return end
		
		if (targ.OrgInvites and targ.OrgInvites[org]) then return end
		targ.OrgInvites = targ.OrgInvites or {}
		targ.OrgInvites[org] = true
		GAMEMODE.ques:Create("Would you like to join " .. org, util.CRC(pl:SteamID() .. targ:SteamID()), targ, 300, function(resp)
			if (tobool(resp) == true)  then
				db:Query("SELECT * FROM org_rank WHERE Org=? AND Weight=1;", pl:GetOrg(), function(data)
					rp.orgs.Join(targ:SteamID64(), org, data[1].RankName, function()
						targ:SetOrg(org, pl:GetOrgColor())
						local orgdata = {
							Rank = data[1].RankName,
							MoTD = pl:GetOrgData().MoTD,
							Perms = {
								Weight = data[1].Weight,
								Owner = (data[1].Weight == 100),
								Invite = data[1].Invite,
								Kick = data[1].Kick,
								Rank = data[1].Rank,
								MoTD = data[1].MoTD
							}
						}
						
						targ:SetOrgData(orgdata)
						
						rp.orgs.cached[pl:GetOrg()].Members[targ:SteamID64()] = {
							SteamID=targ:SteamID64(),
							Org=org,
							Rank=data[1].RankName
						}
						
						rp.Notify(rp.orgs.GetOnlineMembers(targ:GetOrg()), NOTIFY_GREEN, rp.Term('OrgMemberJoined'), targ, targ:GetOrg())
						targ.OrgInvites[org] = nil
					end)
				end)
			end	
		end)
	end)
end)

rp.AddCommand('/orgsetrank', function(pl, text, args)
	if not args[1] or not pl:GetOrg() or not pl:GetOrgData() or not pl:GetOrgData().Perms or not pl:GetOrgData().Perms.Rank or not rp.orgs.CanTarget(pl, args[1]) then return end
	
	local rankName = args[2]
	local cache = rp.orgs.cached[pl:GetOrg()].Ranks
	
	if (!cache[rankName] or pl:GetOrgData().Perms.Weight <= cache[rankName].Weight) then return end
	
	db:Query('SELECT * FROM org_rank WHERE Org=?', pl:GetOrg(), function(ranks)
		for k, v in ipairs(ranks) do
			if (v.RankName == rankName) then
				db:Query("UPDATE org_player SET Rank=? WHERE SteamID=?;", rankName, args[1])
				
				local targ = rp.FindPlayer(args[1])
				if (targ) then
					local od = targ:GetOrgData()
					
					targ:SetOrgData({
						Rank 	= v.RankName,
						MoTD 	= od.MoTD,
						Perms 	= {
							Weight 	= v.Weight,
							Owner 	= (v.Weight == 100),
							Invite 	= v.Invite,
							Kick 	= v.Kick,
							Rank 	= v.Rank,
							MoTD 	= v.MoTD
						}
					})
					
					rp.Notify(targ, NOTIFY_GENERIC, rp.Term('OrgYourRank'), pl, rankName)
					rp.Notify(pl, NOTIFY_GENERIC, rp.Term('OrgSetRank'), targ, rankName)
				else					
					rp.Notify(pl, NOTIFY_GENERIC, rp.Term('OrgSetRank'), args[1], rankName)
				end
				
				rp.orgs.cached[pl:GetOrg()].Members[args[1]].Rank = rankName
				
				return
			end
		end
		
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgUnknownRank'), rankName)
	end)
end)

rp.AddCommand('/orgrank', function(pl, text, args)
	local perms = pl:GetOrg() and pl:GetOrgData() and pl:GetOrgData().Perms
	
	if (!args[1] or !perms or !perms.Owner) then return end

	if (!rp.orgs.cached[pl:GetOrg()]) then rp.orgs.GetMembers(pl:GetOrg()) end
	
	local rankName = args[1]
	local newName
	local weight
	local invite
	local kick
	local rank
	local motd
	
	if (args[6]) then
		weight = tonumber(args[2])
		invite = args[3]
		kick = args[4]
		rank = args[5]
		motd = args[6]
	else
		newName = args[2]
	end
	
	db:Query('SELECT * FROM org_rank WHERE Org=?', pl:GetOrg(), function(ranks)
		for k, v in ipairs(ranks) do
			if (v.RankName == rankName) then
				if (newName) then
					db:Query("UPDATE org_rank SET RankName=? WHERE Org=? AND RankName=?", newName, pl:GetOrg(), rankName, function()
						db:Query("UPDATE org_player SET Rank=? WHERE Org=? AND Rank=?;", newName, pl:GetOrg(), rankName)
						
						rp.Notify(pl, NOTIFY_GREEN, rp.Term('OrgRankRename'), rankName, newName)
						
						for k, v in ipairs(rp.orgs.GetOnlineMembers(pl:GetOrg())) do
							if (v:GetOrgData().Rank == rankName) then
								local orgData = v:GetOrgData()
								orgData.Rank = newName
								v:SetOrgData(orgData)
							end
						end
						
						for k, v in pairs(rp.orgs.cached[pl:GetOrg()].Members) do
							if (v.Rank == rankName) then
								v.Rank = newName
							end
						end
						
						rp.orgs.cached[pl:GetOrg()].Ranks[newName] = rp.orgs.cached[pl:GetOrg()].Ranks[rankName]
						rp.orgs.cached[pl:GetOrg()].Ranks[newName].RankName = newName
						rp.orgs.cached[pl:GetOrg()].Ranks[rankName] = nil
					end)
					
					return
				end
				
				if (weight != v.Weight) then
					if (v.Weight == 100 or v.Weight == 1) then
						rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgReorderLimit'))
						return
					end
					
					v.Weight = weight
					rp.orgs.RecalculateWeights(pl:GetOrg(), ranks)
					return
				end
				
				db:Query("UPDATE org_rank SET Invite=?, Kick=?, Rank=?, MoTD=? WHERE Org=? AND RankName=?;", invite, kick, rank, motd, pl:GetOrg(), rankName, function()
					rp.Notify(pl, NOTIFY_GREEN, rp.Term('OrgRankUpdated'), rankName)
					
					for k, v in ipairs(rp.orgs.GetOnlineMembers(pl:GetOrg())) do
						if (v:GetOrgData().Rank == rankName) then
							v:SetOrgData({
								Rank 	= rankName,
								MoTD 	= v:GetOrgData().MoTD,
								Perms 	= {
									Weight 	= weight,
									Owner 	= (weight == 100),
									Invite 	= tobool(invite),
									Kick 	= tobool(kick),
									Rank 	= tobool(rank),
									MoTD 	= robool(motd)
								}
							})
						end
					end
					
					local cache = rp.orgs.cached[pl:GetOrg()].Ranks[rankName]
					cache.Invite = tobool(invite)
					cache.Kick = tobool(kick)
					cache.Rank = tobool(rank)
					cache.MoTD = tobool(motd)
				end)
				
				return
			end
		end
		
		-- Insert time!
		if (#ranks >= (pl:HasUpgrade('org_prem') and 10 or 5)) then
			rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgMaxRanks'))
			return
		end
		
		db:Query("INSERT INTO org_rank(Org, RankName, Weight, Invite, Kick, Rank, MoTD) VALUES(?, ?, ?, ?, ?, ?, ?);", pl:GetOrg(), rankName, weight, invite, kick, rank, motd, function()
			rp.orgs.cached[pl:GetOrg()].Ranks[rankName] = ranks[table.insert(ranks, {
				Org = pl:GetOrg(),
				RankName = rankName,
				Weight = weight,
				Invite = tobool(invite),
				Kick = tobool(kick),
				Rank = tobool(rank),
				MoTD = tobool(motd)
			})]
			
			rp.orgs.RecalculateWeights(pl:GetOrg(), ranks)
			
			rp.Notify(pl, NOTIFY_GREEN, rp.Term('OrgRankCreated'))
		end)
	end)
end)

rp.AddCommand('/orgrankremove', function(pl, text, args)
	local perms = pl:GetOrg() and pl:GetOrgData() and pl:GetOrgData().Perms
	
	if (!args[1] or !perms or !perms.Owner) then return end
	
	if (!rp.orgs.cached[pl:GetOrg()]) then rp.orgs.GetMembers(pl:GetOrg()) end
	
	local rankName = args[1]
	
	db:Query("SELECT * FROM org_rank WHERE Org=? ORDER BY Weight DESC", pl:GetOrg(), function(ranks)
		for k, v in ipairs(ranks) do
			if (v.RankName == rankName) then
				if (k == 1 or k == #ranks) then
					rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgDeleteLimit'))
					return
				end
				
				local nextRank = ranks[k+1]
				db:Query("UPDATE org_player SET Rank=? WHERE Org=? AND Rank=?", nextRank.RankName, pl:GetOrg(), rankName)
				db:Query("DELETE FROM org_rank WHERE Org=? AND RankName=?", pl:GetOrg(), rankName)
				for _, pl in ipairs(rp.orgs.GetOnlineMembers(pl:GetOrg())) do
					local od = pl:GetOrgData()
					
					if (od.Rank == rankName) then
						od = {
							Rank 	= nextRank.RankName,
							MoTD 	= od.MoTD,
							Perms 	= {
								Weight 	= nextRank.Weight,
								Owner 	= (nextRank.Weight == 100),
								Invite 	= nextRank.Invite,
								Kick 	= nextRank.Kick,
								Rank 	= nextRank.Rank,
								MoTD 	= nextRank.MoTD,
							}
						}
						
						pl:SetOrgData(od)
					end
				end
				
				for _, mem in pairs(rp.orgs.cached[pl:GetOrg()].Members) do
					if (mem.Rank == rankName) then
						mem.Rank = nextRank.Name
					end
				end
				
				rp.orgs.cached[pl:GetOrg()].Ranks[rankName] = nil
				
				rp.Notify(pl, NOTIFY_GREEN, rp.Term('OrgRankDelete'), rankName)
				
				return
			end
		end
		
		rp.Notify(pl, NOTIFY_ERROR, rp.Term('OrgUnknownRank'), rankName)
	end)
end)

local function OrgChat(pl, text, args) 
	if (pl:GetOrg() == nil) then return end 
	rp.Chat(CHAT_ORG, rp.orgs.GetOnlineMembers(pl:GetOrg()), pl:GetOrgColor(), '[ORG] ', pl, table.concat(args, ' ')) 
end 
rp.AddCommand('/org', OrgChat) 
rp.AddCommand('/o', OrgChat)

net('rp.SetOrgBanner', function(len, pl)
	if (!pl:GetOrg() or !pl:GetOrgData().Perms.Owner) then return end
	if (!pl:HasUpgrade('org_prem')) then return end
	
	local data = {}
	
	local dim = net.ReadUInt(7)
	
	for i=0, dim do
		data[i] = {}
		
		for k=0, dim do
			local size = net.ReadUInt(5)
			local px = net.ReadUInt(size)
			
			data[i][k] = px
		end
	end
	
	net.Start('rp.OrgBannerReceived')
	net.Send(pl)
	
	rp.Notify(pl, NOTIFY_GREEN, rp.Term('OrgBannerUpdated'))
	
	db:Query('REPLACE INTO org_banner (Org, Time, Data) VALUES(?, ?, ?);', pl:GetOrg(), os.time(), util.TableToJSON(data), function()
		net.Start('rp.OrgBannerInvalidate')
			net.WriteString(pl:GetOrg())
		net.Broadcast()
	end)
end)