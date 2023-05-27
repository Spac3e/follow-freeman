AddCSLuaFile()

ENT.Base = 'money_printer'
ENT.PrintName = 'Печатный конвеер'
ENT.Category = 'Money Printers'
ENT.Spawnable = true

ENT.MaxHP = 100 -- хп
ENT.PrintAmount = 18 -- количество печати
ENT.MaxInk = 6  -- максимум чернил

if SERVER then
	ENT.SeizeReward = 50 --Награда за уничтожение
	ENT.Model = 'models/props_lab/reciever_cart.mdl'
else
	function ENT:CalculateScreenPos(pos, ang)
		ang:RotateAroundAxis(ang:Up(), 90)
		ang:RotateAroundAxis(ang:Forward(), 90)
		pos = pos + ang:Up() * 13 + ang:Forward() * 8 - ang:Right() * 19
		return pos, ang, 0.03
	end
end