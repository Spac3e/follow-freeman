
-----------------------------------------------------
AddCSLuaFile()

ENT.Base = 'money_printer'
ENT.PrintName = 'Улучшенный Биткоин-Майнер'
ENT.Category = 'Money Printers'
ENT.Spawnable = true

ENT.MaxHP = 100 -- хп
ENT.PrintAmount = 15 -- количество печати
ENT.MaxInk = 50  -- максимум чернил

if SERVER then
	ENT.SeizeReward = 150 --Награда за уничтожение
	ENT.Model = 'models/props_lab/monitor02.mdl'
else
	function ENT:CalculateScreenPos(pos, ang)
		ang:RotateAroundAxis(ang:Up(), 90)
		ang:RotateAroundAxis(ang:Forward(), 82)
		pos = pos + ang:Up() * 13.1 + ang:Forward() * 2 - ang:Right() * 10
		return pos, ang, 0.02
	end
end