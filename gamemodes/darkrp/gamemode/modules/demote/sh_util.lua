rp.AddTerm('FiredTerminal', 'Вас уволил #')
rp.AddTerm('YouFired', 'Вы уволили #')

function rp.AddRelationships(faction, table)
	rp.Factions[faction].relationships = table
end

function rp.CanDemote(player, target)
	if player:IsPlayer() and target:IsPlayer() then
		local p_team = rp.teams[player:Team()]
		local t_team = rp.teams[target:Team()]
		if p_team.faction && p_team.faction == t_team.faction and rp.Factions[p_team.faction].relationships then
			local relationships = rp.Factions[p_team.faction].relationships
			if (relationships[1][player:Team()] and relationships[2][target:Team()]) or (relationships[1][player:Team()] > relationships[1][target:Team()]) then
				return true
			end
		end
	end
	return false
end


