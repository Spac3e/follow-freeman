
-----------------------------------------------------

AddCSLuaFile()

local BaseClass = baseclass.Get('weapon_hl2axe')

SWEP.Spawnable			= true
SWEP.Category = "SUP Melee"

SWEP.PrintName				= "Дилдо"

//SWEP.ViewModel				= Model( "models/weapons/HL2meleepack/v_pipe.mdl" )
//SWEP.WorldModel				= Model( "models/props_canal/mattpipe.mdl" )


SWEP.ViewModel				= Model( "models/weapons/v_dildo.mdl" )
SWEP.WorldModel				= Model( "models/weapons/w_dildo.mdl" )
SWEP.ViewModelFOV			= 65
SWEP.ViewbobIntensity = 1.5


SWEP.Push = false

SWEP.HitSound = Sound( "physics/flesh/flesh_squishy_impact_hard2.wav" )
SWEP.SwingSound = Sound( "WeaponFrag.Roll" )
SWEP.HitSoundElse = Sound("physics/flesh/flesh_impact_hard6.wav")

SWEP.HitRate = 0.4
SWEP.DamageDelay = 0.2
SWEP.DamageMin = 10
SWEP.DamageMax = 20

SWEP.HitAngle = Angle(2, 2, 0.125)

SWEP.HoldType = "melee"

SWEP.AttackTime = 0

function SWEP:PrimaryAttack()

	self.Owner:SetAnimation(PLAYER_ATTACK1)
	CT = CurTime()

	self:SendWeaponAnim(math.random(0,1) == 0 && ACT_VM_HITCENTER || ACT_VM_MISSCENTER)

	if IsFirstTimePredicted() then
		self:EmitSound(self.SwingSound, 70, 100)
		self.DamageTime = CT + self.DamageDelay
		self.AttackTime = CurTime() + self.HitRate
	end

	self.Owner:ViewPunch(self.HitAngle)

	self:SetNextPrimaryFire(CT + self.HitRate)
	self:SetNextSecondaryFire(CT + self.HitRate)
end

function SWEP:Think()
	if self.DamageTime and CurTime() > self.DamageTime then
		if SERVER then
			self.Owner:LagCompensation(true)
		end

		self:Damage()

		if SERVER then
			self.Owner:LagCompensation(false)
		end

		self.DamageTime = nil
	end
	if self.AttackTime && self.AttackTime > CurTime() then
		self.AttackTime = nil
	end
end


if CLIENT then
	SWEP.BlendPos = Vector(0, 0, 0)
	SWEP.BlendAng = Vector(0, 0, 0)
	SWEP.OldDelta = Angle(0, 0, 0)
	SWEP.AngleDelta = Angle(0, 0, 0)

	local reg = debug.getregistry()
	local Right = reg.Angle.Right
	local Up = reg.Angle.Up
	local Forward = reg.Angle.Forward
	local RotateAroundAxis = reg.Angle.RotateAroundAxis
	local GetVelocity = reg.Entity.GetVelocity
	local Length = reg.Vector.Length


	local Vec0 = Vector(0, 0, 0)
	local TargetPos, TargetAng, cos1, sin1, tan, ws, rs, mod, vel, FT, sin2, delta

	local SP = game.SinglePlayer()
	local PosMod, AngMod = Vector(0, 0, 0), Vector(0, 0, 0)
	local CurPosMod, CurAngMod = Vector(0, 0, 0), Vector(0, 0, 0)

	function SWEP:PreDrawViewModel()
		CT = UnPredictedCurTime()
		vm = self.Owner:GetViewModel()

		EA = EyeAngles()
		FT = FrameTime()

		delta = Angle(EA.p, EA.y, 0) - self.OldDelta
		delta.p = math.Clamp(delta.p, -10, 10)

		self.OldDelta = Angle(EA.p, EA.y, 0)
		self.AngleDelta = LerpAngle(math.Clamp(FT * 10, 0, 1), self.AngleDelta, delta)
		self.AngleDelta.y = math.Clamp(self.AngleDelta.y, -10, 10)

		vel = Length(GetVelocity(self.Owner))
		ws = self.Owner:GetWalkSpeed()

		PosMod, AngMod = Vec0 * 1, Vec0 * 1

		if vel < 10 or not self.Owner:OnGround() then
			cos1, sin1 = math.cos(CT), math.sin(CT)
			tan = math.atan(cos1 * sin1, cos1 * sin1)

			AngMod.x = AngMod.x + tan * 1.15
			AngMod.y = AngMod.y + cos1 * 0.4
			AngMod.z = AngMod.z + tan

			PosMod.y = PosMod.y + tan * 0.2
		elseif vel > 10 and vel < ws * 1.2 then
			mod = 6 + ws / 130
			mul = math.Clamp(vel / ws, 0, 1)
			sin1 = math.sin(CT * mod) * mul
			cos1 = math.cos(CT * mod) * mul
			tan1 = math.tan(sin1 * cos1) * mul

			AngMod.x = AngMod.x + tan1
			AngMod.y = AngMod.y - cos1
			AngMod.z = AngMod.z + cos1
			PosMod.x = PosMod.x - sin1 * 0.4
			PosMod.y = PosMod.y + tan1 * 1
			PosMod.z = PosMod.z + tan1 * 0.5
		elseif (vel > ws * 1.2 and self.Owner:KeyDown(IN_SPEED)) or vel > ws * 3 then
			rs = self.Owner:GetRunSpeed()
			mod = 7 + math.Clamp(rs / 100, 0, 6)
			mul = math.Clamp(vel / rs, 0, 1)
			sin1 = math.sin(CT * mod) * mul
			cos1 = math.cos(CT * mod) * mul
			tan1 = math.tan(sin1 * cos1) * mul

			AngMod.x = AngMod.x + tan1 * 0.2
			AngMod.y = AngMod.y - cos1 * 1.5
			AngMod.z = AngMod.z + cos1 * 3
			PosMod.x = PosMod.x - sin1 * 1.2
			PosMod.y = PosMod.y + tan1 * 1.5
			PosMod.z = PosMod.z + tan1
		end

		FT = FrameTime()

		CurPosMod = LerpVector(FT * 10, CurPosMod, PosMod*3)
		CurAngMod = LerpVector(FT * 10, CurAngMod, AngMod*3)
	end

	function SWEP:GetViewModelPosition(pos, ang)
		RotateAroundAxis(ang, Right(ang), CurAngMod.x + self.AngleDelta.p)
		RotateAroundAxis(ang, Up(ang), CurAngMod.y + self.AngleDelta.y * 0.3)
		RotateAroundAxis(ang, Forward(ang), CurAngMod.z + self.AngleDelta.y * 0.3)

		pos = pos + (CurPosMod.x + self.AngleDelta.y * 0.1) * Right(ang)
		pos = pos + (CurPosMod.y + self.BlendPos.y) * Forward(ang)
		pos = pos + (CurPosMod.z + self.BlendPos.z - self.AngleDelta.p * 0.1) * Up(ang)

		return pos, ang
	end
end
