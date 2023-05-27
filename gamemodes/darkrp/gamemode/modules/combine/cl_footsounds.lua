
-----------------------------------------------------

local foot_sounds_ota = {
	Sound("npc/combine_soldier/gear1.wav"),
	Sound("npc/combine_soldier/gear2.wav"),
	Sound("npc/combine_soldier/gear3.wav"),
	Sound("npc/combine_soldier/gear4.wav"),
	Sound("npc/combine_soldier/gear5.wav"),
	Sound("npc/combine_soldier/gear6.wav"),
}

local foot_sounds_cp = {
	Sound("npc/metropolice/gear1.wav"),
	Sound("npc/metropolice/gear2.wav"),
	Sound("npc/metropolice/gear3.wav"),
	Sound("npc/metropolice/gear4.wav"),
	Sound("npc/metropolice/gear5.wav"),
	Sound("npc/metropolice/gear6.wav"),
}

local zombie_sounds = {
	Sound("npc/zombie/foot1.wav"),
	Sound("npc/zombie/foot2.wav"),
	Sound("npc/zombie/foot3.wav"),
}


local r = table.Random

hook('PlayerFootstep', function(client, position, foot, soundName, volume)
	if client:IsCombine() then
		if volume > 0.4 then
			client:EmitSound(r(ply:GetFaction() == FACTION_OTA && foot_sounds_ota || foot_sounds_cp), 75, 100, volume)
		end
		--client:EmitSound("npc/metropolice/gear"..math.random(1, 6)..".wav", volume * 130)
		--if (client:IsCP()) then

		--elseif client:IsCombine() then
		--	
--
		--end
	elseif client:IsZombie() then
		client:EmitSound(r(zombie_sounds), 75, 100, volume)
	end
end)

local on = Sound('npc/overwatch/radiovoice/on1.wav')
local off = Sound('npc/overwatch/radiovoice/off4.wav')

hook('PlayerStartVoice', function(ply)
	if ply:IsCombine() then
		ply:EmitSound(on, 75)
	end
end)

hook('PlayerEndVoice', function(ply)
	if ply:IsCombine() then
		ply:EmitSound(off, 75)
	end
end)

hook('ChatRoomMessage', function(chat, pl, text)
	if pl:IsCombine() then
		if chat == CHAT_LOCAL then
			pl:EmitSound(on, 75)	
		end
	end
end)