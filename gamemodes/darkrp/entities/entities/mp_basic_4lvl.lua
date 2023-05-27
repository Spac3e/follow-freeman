AddCSLuaFile()

ENT.Base = 'money_printer'
ENT.PrintName = 'Лазерный принтер'
ENT.Category = 'Money Printers'
ENT.Spawnable = true

ENT.MaxHP = 80 -- хп
ENT.PrintAmount = 13 -- количество печати
ENT.MaxInk = 5  -- максимум чернил

if SERVER then
	ENT.SeizeReward = 50 --Награда за уничтожение
	ENT.Model = 'models/props_c17/consolebox05a.mdl'
else
	function ENT:CalculateScreenPos(pos, ang)
		ang:RotateAroundAxis(ang:Up(), 0)
		pos = pos + ang:Up() * 5.7 - ang:Forward() * 0.4 + ang:Right() * 6
		return pos, ang, 0.037
	end
end