-- We'll replace this some day.. maybe
ba.ranks.Create('Root', 10)
	:SetImmunity(10000)
	:SetRoot(true)

ba.ranks.Create('Sudo Root', 9)
	:SetImmunity(10000)
	:SetRoot(true)

ba.ranks.Create('Global Admin', 8)
	:SetImmunity(7500)
	:SetFlags('umasgdc')
	:SetGlobal(true)
	:SetSuperAdmin(true)

ba.ranks.Create('Manager', 7)
	:SetImmunity(7500)
	:SetFlags('umasgx')
	:SetAdmin(true)

ba.ranks.Create('Super Admin', 6)
	:SetImmunity(7200)
	:SetFlags('umasg')
	:SetAdmin(true)

ba.ranks.Create('Head Admin', 5)
	:SetImmunity(7000)
	:SetFlags('umas')
	:SetAdmin(true)

ba.ranks.Create('Admin', 4)
	:SetImmunity(6000)
	:SetFlags('uma')
	:SetAdmin(true)

ba.ranks.Create('Moderator', 3)
	:SetImmunity(5000)
	:SetFlags('um')
	:SetAdmin(true)

ba.ranks.Create('VIP', 2)
	:SetImmunity(0)
	:SetFlags('uv')
	:SetVIP(true)

ba.ranks.Create('User', 1)
	:SetImmunity(0)
	:SetFlags('u')