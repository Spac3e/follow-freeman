-----------------------------------------------------------
-- TOGGLE COMMANDS --
-----------------------------------------------------------
if CLIENT then
	local net = net
	function rp.ChangeTeam(team)
		net.Start('rp.ChangeTeam')
			net.WriteInt(team, 8)
		net.SendToServer()
	end
else
	util.AddNetworkString('rp.ChangeTeam')
	net.Receive('rp.ChangeTeam', function(len, ply)
		local k = net.ReadInt(8)
		if !k then return end
		local CTeam = rp.teams[k]
		if !CTeam then return end
		if not GAMEMODE:CustomObjFitsMap(CTeam) then return end

		if CTeam.vote then
			if (#player.GetAll() == 1) then
				rp.Notify(ply, NOTIFY_GREEN, rp.Term('VoteAlone'))
				ply:ChangeTeam(k)

				return ""
			end

			-- Banned from job
			if (not ply:ChangeAllowed(k)) then
				rp.Notify(ply, NOTIFY_ERROR, rp.Term('BannedFromJob'))

				return ""
			end

			-- Voted too recently
			if (ply:GetTable().LastVoteTime and CurTime() - ply:GetTable().LastVoteTime < 80) then
				rp.Notify(ply, NOTIFY_ERROR, rp.Term('VotedTooSoon'), math.ceil(80 - (CurTime() - ply:GetTable().LastVoteTime)))

				return
			end

			-- Can't vote to become what you already are
			if (ply:Team() == k) then
				rp.Notify(ply, NOTIFY_GENERIC, rp.Term('AlreadyThisJob'))

				return 
			end

			-- Max players reached
			local max = CTeam.max

			if (max ~= 0 and ((max % 1 == 0 and team.NumPlayers(k) >= max) or (max % 1 ~= 0 and (team.NumPlayers(k) + 1) / #player.GetAll() > max))) then
				rp.Notify(ply, NOTIFY_ERROR, rp.Term('JobLimit'))

				return
			end

			if (CTeam.CurVote) then
				if (not CTeam.CurVote.InProgress) then
					table.insert(CTeam.CurVote.Players, ply)
					rp.Notify(ply, NOTIFY_GREEN, rp.Term('RegisteredForVote'))
				else
					rp.Notify(ply, NOTIFY_ERROR, rp.Term('AlreadyVoting'))

					return
				end
			else
				-- Setup a new vote
				CTeam.CurVote = {
					InProgress = false,
					Players = {ply}
				}

				rp.teamVote.CountDown(CTeam.name, 45, function()
					CTeam.CurVote.InProgress = true

					rp.teamVote.Create(CTeam.name, 45, CTeam.CurVote.Players, function(winner, breakdown)
						if (not winner or team.NumPlayers(k) >= max) then
							rp.GlobalChat(CHAT_NONE, rp.col.White, 'No winner for the ', CTeam.color, CTeam.name, rp.col.White, ' vote!')
						else
							rp.GlobalChat(CHAT_NONE, CTeam.color, winner:Name(), rp.col.White, ' has won the vote for ' .. CTeam.name .. '!')
							winner:ChangeTeam(k)
						end

						CTeam.CurVote = nil
					end)
				end)

				rp.Notify(ply, NOTIFY_GREEN, rp.Term('RegisteredForVote'))
			end

			ply:GetTable().LastVoteTime = CurTime()
		else
			if CTeam.admin == 1 and not ply:IsAdmin() then
				rp.Notify(ply, NOTIFY_ERROR, rp.Term('JobNeedsAdmin'))
				return
			end

			if CTeam.admin > 1 and not ply:IsSuperAdmin() then
				rp.Notify(ply, NOTIFY_ERROR, rp.Term('JobNeedsSA'))
				return
			end

			if !ply:CanTeam(CTeam) then
				return false
			end

			ply:ChangeTeam(k)
		end
	end)
end

function GM:AddEntityCommands(tblEnt)
	if CLIENT then return end

	local function buythis(ply, args)
		if ply:IsArrested() then return "" end

		if tblEnt.allowed[ply:Team()] != true then
			rp.Notify(ply, NOTIFY_ERROR, rp.Term('IncorrectJob'))

			return ""
		end

		if tblEnt.customCheck and not tblEnt.customCheck(ply) then
			if tblEnt.customCheckFailMsg then
				if isfunction(tblEnt.customCheckFailMsg) then
					rp.Notify(ply, NOTIFY_ERROR, tblEnt.customCheckFailMsg())
				else
					rp.Notify(ply, NOTIFY_ERROR, tblEnt.customCheckFailMsg)
				end
			else 
				rp.Notify(ply, NOTIFY_ERROR, rp.Term('CannotPurchaseItem'))
			end

			return ""
		end

		if tblEnt.unlockTime && tblEnt.unlockTime > ply:GetPlayTime() then
			rp.Notify(ply, NOTIFY_ERROR, rp.Term('NotEnoughTime'))
			return
		end

		local max = tonumber(tblEnt.max or 3)

		if ply:GetCount(tblEnt.ent) >= tonumber(max) then
			rp.Notify(ply, NOTIFY_ERROR, rp.Term('ItemLimit'), tblEnt.name)

			return ""
		end

		if not ply:CanAfford(tblEnt.price) then
			rp.Notify(ply, NOTIFY_ERROR, rp.Term('CannotAfford'))

			return ""
		end

		ply:AddMoney(-tblEnt.price)
		local trace = {}
		trace.start = ply:EyePos()
		trace.endpos = trace.start + ply:GetAimVector() * 85
		trace.filter = ply
		local tr = util.TraceLine(trace)
		local item = ents.Create(tblEnt.ent)
		item:SetPos(tr.HitPos)
		item.allowed = tblEnt.allowed
		item.ItemOwner = ply
		item:Spawn()
		item:PhysWake()

		timer.Simple(0, function()
			if item.Setowning_ent then
				item:Setowning_ent(ply)
			end

			if (tblEnt.onSpawn) then
				tblEnt.onSpawn(item, ply)
			end
		end)

		rp.Notify(ply, NOTIFY_GREEN, rp.Term('RPItemBought'), tblEnt.name, rp.FormatMoney(tblEnt.price))
		hook.Call('PlayerBoughtItem', GAMEMODE, ply, tblEnt.name, tblEnt.price, ply:GetMoney())
		ply:_AddCount(tblEnt.ent, item)

		return ""
	end

	rp.AddCommand(tblEnt.cmd, buythis)
end

if SERVER then
	rp.AddCommand('/copbuy', function(pl, text, args)
		if (not args[1]) or (not (pl:IsCP() or pl:IsMayor())) then return end
		local exploiter = true

		for k, v in ipairs(ents.FindInSphere(pl:GetPos(), 200)) do
			if IsValid(v) and (v:GetClass() == 'npc_copshop') then
				exploiter = false
				break
			end
		end

		if exploiter then return end
		local item = rp.CopItems[args[1]]

		if not pl:CanAfford(item.Price) then
			pl:Notify(NOTIFY_ERROR, rp.Term('CannotAfford'))
		else
			pl:Notify(NOTIFY_GENERIC, rp.Term('RPItemBought'), item.Name, rp.FormatMoney(item.Price))
			pl:TakeMoney(item.Price)

			if item.Weapon then
				pl:Give(item.Weapon)
			else
				item.Callback(pl)
			end
		end
	end)
end