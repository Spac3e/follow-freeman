
-----------------------------------------------------
AddCSLuaFile()

ENT.Base = 'money_printer'
ENT.PrintName = 'Генератор токенов Повстанцев'
ENT.Category = 'Money Printers'
ENT.Spawnable = true

ENT.MaxHP = 200 -- хп
ENT.PrintAmount = 30 -- количество печати
ENT.MaxInk = 100  -- максимум чернил

if SERVER then
	ENT.SeizeReward = 300 --Награда за уничтожение
	ENT.Model = 'models/props_lab/reciever_cart.mdl'
else
	function ENT:CalculateScreenPos(pos, ang)
		ang:RotateAroundAxis(ang:Up(), 90)
		ang:RotateAroundAxis(ang:Forward(), 90)
		pos = pos + ang:Up() * 13 + ang:Forward() * 8 - ang:Right() * 19
		return pos, ang, 0.03
	end
end