
-----------------------------------------------------
local relations = {}

RANK_LEADER = 3
RANK_OFFICER = 2
RANK_TRAINER = 1

hook('LoadTerms', function()
	rp.AddTerm('HasFired', "# уволил # за #.")
	rp.AddTerm('HasKickedFromFaction', "# выгнал # из фракции за #")
	rp.AddTerm('RewardReceivedBy', "Вы получили премию в размере # от # за #.")
	rp.AddTerm('RewardGivenBy', "Вы выдали премию # в размере # за #.")
	rp.AddTerm('RewardCooldown', "Вы не можете выдавать премию следующие # секунд.")
	rp.AddTerm('TargerHasRewardCooldown', "Игрок уже недавно получал премию, подождите # секунд перед выдачей новой.")
	rp.AddTerm('DemoteCooldown', "Подождите # секунд перед следующим увольнением.")
	rp.AddTerm('FactionDemote', "Вас выгнали из этой фракции, необходимо подождать # секунд.")
	rp.AddTerm('WrongReason', "Причина должна быть от 3 до 20 символов!")
end)

local id = 0
function rp.AddRelationships(teams, rank, factions)
	factions = istable(factions) && factions || {factions}

	local targets = {}
	for k, v in pairs(rp.GetFactionTeams(factions)) do
		targets[v] = true
	end

	for k, team in pairs(istable(teams) && teams or {teams}) do
		relations[team] = {rank = rank, factions = factions, targets = targets}
	end
end

function rp.IsHigherRank(self, target)
	return relations[self:Team()] && relations[self:Team()].targets[target:Team()] && self:GetFactionRank() > target:GetFactionRank()
end

function PLAYER:GetFactionRelations()
	return relations[self:Team()] || false
end

function PLAYER:GetFactionRank()
	return relations[self:Team()] && relations[self:Team()].rank || 0
end