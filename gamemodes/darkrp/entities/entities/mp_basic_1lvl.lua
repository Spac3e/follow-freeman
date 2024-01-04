AddCSLuaFile()

ENT.Base = 'money_printer'
ENT.PrintName = 'Печатный станок'
ENT.Category = 'Money Printers'
ENT.Spawnable = true

ENT.MaxHP = 50 -- хп
ENT.PrintAmount = 2 -- количество печати
ENT.MaxInk = 5  -- максимум чернил

if SERVER then
	ENT.SeizeReward = 50 --Награда за уничтожение
	ENT.Model = 'models/props_lab/reciever01a.mdl'
else
	function ENT:CalculateScreenPos(pos, ang)
		ang:RotateAroundAxis(ang:Up(), 90)
		pos = pos + ang:Up() * 3.1 + ang:Forward() * 3.5 + ang:Right() * 4
		return pos, ang, 0.03
	end
end