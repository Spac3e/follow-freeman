AddCSLuaFile()

ENT.Base = 'money_printer'
ENT.PrintName = 'Печатная машинка'
ENT.Category = 'Money Printers'
ENT.Spawnable = true

ENT.MaxHP = 90 -- хп
ENT.PrintAmount = 15 -- количество печати
ENT.MaxInk = 6  -- максимум чернил

if SERVER then
	ENT.SeizeReward = 50 --Награда за уничтожение
	ENT.Model = 'models/props_c17/consolebox01a.mdl'
else
	function ENT:CalculateScreenPos(pos, ang)
		ang:RotateAroundAxis(ang:Up(), 90)
		ang:RotateAroundAxis(ang:Forward(), 90)
		pos = pos + ang:Up() * 16.15
		return pos, ang, 0.03
	end
end