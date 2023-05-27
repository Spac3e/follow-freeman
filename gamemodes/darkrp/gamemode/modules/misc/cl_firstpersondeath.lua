cvar.Register'enable_firstpersondeath':SetDefault(true):AddMetadata('State', 'RPMenu'):AddMetadata('Menu', 'Смерть от первого лица')

hook("CalcView", "FirstPersonDeath", function(pl, pos, ang, fov, nearz, farz)
	if (not cvar.GetValue('enable_firstpersondeath') or pl:Alive() or not IsValid(pl:GetRagdollEntity())) then return end
	local rag = pl:GetRagdollEntity()
	local eyeattach = rag:LookupAttachment('eyes')
	if (not eyeattach) then return end
	local eyes = rag:GetAttachment(eyeattach)
	if (not eyes) then return end

	return {
		origin = eyes.Pos,
		angles = eyes.Ang,
		fov = fov
	}
end)