
-----------------------------------------------------

rp.AddMenuCommand('Управление', 'Выдать премию подчиненному', function()
	local cps = table.Filter(player.GetAll(), function(v) 
		return rp.IsHigherRank(LocalPlayer(), v)
	end)

	ui.PlayerReuqest(cps, function(v)
		ui.StringRequest('Премия', 'За что вы хотите выдать премию?', '', function(a)
			if IsValid(v) then
				net.Start('rp.GiveReward')
					net.WriteEntity(v)
					net.WriteString(a)
				net.SendToServer()
			end
		end)
	end)
end, function() return ply:GetFactionRank() >= RANK_TRAINER end)

rp.AddMenuCommand('Управление', 'Выдать премию в радиусе', function()
	ui.StringRequest('Премия', 'За что вы хотите выдать премию?', '', function(a)
		net.Start('rp.GiveReward')
			net.WriteEntity(LocalPlayer())
			net.WriteString(a)
		net.SendToServer()
	end)
end, function() return ply:GetFactionRank() >= RANK_TRAINER end)

rp.AddMenuCommand('Управление', 'Уволить подчиненного', function()
	local cps = table.Filter(player.GetAll(), function(v) 
		return rp.IsHigherRank(LocalPlayer(), v)
	end)

	ui.PlayerReuqest(cps, function(v)
		ui.StringRequest('Уволить подчиненного', 'За что вы хотите уволить?', '', function(a)
			if IsValid(v) then
				net.Start('rp.Demote')
					net.WriteEntity(v)
					net.WriteString(a)
				net.SendToServer()
			end
		end)
	end)
end, function() return ply:GetFactionRank() >= RANK_OFFICER end)

rp.AddMenuCommand('Управление', 'Выгнать подчиненного из фракции ', function()
	local cps = table.Filter(player.GetAll(), function(v) 
		return rp.IsHigherRank(LocalPlayer(), v)
	end)

	ui.PlayerReuqest(cps, function(v)
		ui.StringRequest('Выгнать из фракции', 'За что вы хотите выгнать?', '', function(a)
			if IsValid(v) then
				net.Start('rp.KickFromFaction')
					net.WriteEntity(v)
					net.WriteString(a)
				net.SendToServer()
			end
		end)
	end)
end, function() return ply:GetFactionRank() >= RANK_LEADER end)
