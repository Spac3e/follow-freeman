AddCSLuaFile()
DEFINE_BASECLASS( "base_anim" )
ENT.Base = "ammo_bonuses_base"

ENT.PrintName = "Снаряжение Альянса"
ENT.Category = "За Фрименом"

ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.Model = "models/items/ammocrate_smg1.mdl"
ENT.Term = 'AmmoNotAlliance'
ENT.Factions = {
	[FACTION_COMBINE] = true,
	[FACTION_HELIX] = true,
	[FACTION_OTA] = true,
}
