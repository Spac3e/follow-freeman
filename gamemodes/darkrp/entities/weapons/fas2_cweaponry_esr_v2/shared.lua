--[[
Server Name: λ HL2RP | Classic | Cuтu-17
Server IP:   185.221.196.56:27016
File Path:   addons/combine_weaponry/lua/weapons/fas2_cweaponry_esr_v2/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 0
end

if CLIENT then
    SWEP.PrintName = "ESR"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-3.41, -9, 2.2)
	SWEP.AimAng = Vector(0, 0, 0)
	SWEP.YawMod = 0
	SWEP.PitchMod = 0
	SWEP.Text3DForward = -3
	SWEP.Text3DRight = -2
	SWEP.Text3DSize = 0.02
	
	SWEP.MuzzleEffect = "muzzleflash_OTS"
	SWEP.Shell = ""
	
	SWEP.WMAng = Vector(-10, 180, 180)
	SWEP.WMPos = Vector(1, -16,1)
		SWEP.WepSelectIcon = surface.GetTextureID("VGUI/hud/fas2_cweaponry_esr")
end

	SWEP.AdminOnly 				= true 
SWEP.BulletLength = 7.62
SWEP.CaseLength = 39
SWEP.EmptySound = Sound("weapons/empty_assaultrifles.wav")
SWEP.NoProficiency = true
SWEP.NoAttachmentMenu = true
SWEP.CantChamber = true
SWEP.Spawnable            = false
SWEP.Anims = {}
SWEP.Anims.Draw_First = "lowtoidle"
SWEP.Anims.Draw = "lowtoidle"
SWEP.Anims.Holster = "idletolow"
SWEP.Anims.Fire = {"fire1", "fire2", "fire3"}
SWEP.Anims.Fire_Bipod = "fire_scoped"
SWEP.Anims.Fire_Aiming =  "fire_scoped"
SWEP.Anims.Idle = "IR_idle"
SWEP.Anims.Idle_Aim = "IR_idle"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload"
SWEP.Anims.Reload_Empty = "reload"
SWEP.Anims.Reload_Empty_Nomen = "reload"
SWEP.Anims.Reload_Bipod = "reload"
SWEP.Anims.Reload_Bipod_Nomen = "reload"
SWEP.Anims.Reload_Bipod_Empty = "reload"
SWEP.Anims.Reload_Bipod_Empty_Nomen = "reload"
SWEP.Anims.Bipod_Deploy = "IR_idle"
SWEP.Anims.Bipod_UnDeploy = "IR_idle"

SWEP.Sounds = {}
SWEP.Sounds["reload"] = {[1] = {time = 0, sound = Sound("Cweaponry_ESR_RELOAD")}}
	
SWEP.FireModes = {"x5","x10"}
SWEP.FireModeNames = {["x5"] = {display = "X5", auto = false, burstamt = 0};
["x10"] = {display = "X10", auto = false, burstamt = 0};}

SWEP.Category = "Спавн только с разрешения"
SWEP.Base = "fas2_base"
SWEP.Author            = ""

SWEP.Contact        = ""
SWEP.Purpose        = "Energy Sniper Rifle"
SWEP.Instructions        = ""

SWEP.ViewModelFOV    = 60
SWEP.ViewModelFlip    = false



SWEP.VM = "models/weapons/v_models/v_Cweaponry_esr.mdl"
SWEP.WM = "models/weapons/w_models/w_Cweaponry_esr.mdl"
SWEP.WorldModel   = "models/weapons/w_models/w_Cweaponry_esr.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 1
SWEP.Primary.DefaultClip    = 5
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = "XBowBolt"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic = true --       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.3
SWEP.DeployTime = 0.3
SWEP.HolsterTime = 0

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0
SWEP.Damage = 235
SWEP.FireSound = Sound("ESR_FIRE")
SWEP.FireSound_Suppressed = Sound("FAS2_AK47_S")

-- Accuracy related
SWEP.HipCone = 0.025
SWEP.AimCone = 0
SWEP.SpreadPerShot = 0.07
SWEP.MaxSpreadInc = 0.1
SWEP.SpreadCooldown = 0.1
SWEP.VelocitySensitivity = 1
SWEP.AimFOV = 0

-- Recoil related
SWEP.ViewKick = 3
SWEP.Recoil = 4

-- Reload related
SWEP.ReloadTime = 0.7
SWEP.ReloadTime_Nomen = 0.7
SWEP.ReloadTime_Empty = 0.7
SWEP.ReloadTime_Empty_Nomen = 0.7

SWEP.ReloadTime_Bipod = 0.7
SWEP.ReloadTime_Bipod_Nomen = 0.7
SWEP.ReloadTime_Bipod_Empty = 0.7
SWEP.ReloadTime_Bipod_Empty_Nomen = 0.7

SWEP.InstalledBipod = true
SWEP.BipodAngleLimitYaw = 50
SWEP.BipodAngleLimitPitch = 10
SWEP.BipodDeployTime = 0.2
SWEP.BipodUndeployTime = 0.2
SWEP.BipodPos = Vector(0, 0, 0)
SWEP.BipodAng = Vector(0, 0, 0)

if CLIENT then
	local old, x, y, ang
	local sight = surface.GetTextureID("VGUI/fas2_combine_weaponry/combine_scope2")
	local lens = surface.GetTextureID("VGUI/fas2_combine_weaponry/combine_lense2")
	local lensring = surface.GetTextureID("VGUI/fas2/lensring")
	local cd, alpha = {}, 0.5
	local Ini = true
	
	function SWEP:DrawRenderTarget()
		if self.dt.Status == FAS_STAT_ADS then
			alpha = math.Approach(alpha, 0, FrameTime() * 5)
		else
			alpha = math.Approach(alpha, 1, FrameTime() * 5)
		end
		
		x, y = ScrW(), ScrH()
		old = render.GetRenderTarget()
		ang = self.Wep:GetAttachment(self.Wep:LookupAttachment("muzzle")).Ang
		ang:RotateAroundAxis(ang:Forward(), 0)
		
		if self.FireMode == "x5" then
		curzoommode = 5
		self.AimSens = 0.2
		elseif self.FireMode == "x10" then
		curzoommode = 2
		self.AimSens = 0.1
		end
		
		cd.angles = ang
		cd.origin = self.Owner:GetShootPos()
		cd.x = 0
		cd.y = 0
		cd.w = 512
		cd.h = 512
		cd.fov = curzoommode
		cd.drawviewmodel = false
		cd.drawhud = false
		render.SetRenderTarget(self.ScopeRT)
		render.SetViewPort(0, 0, 512, 512)
		
			if alpha < 1 or Ini then
				render.RenderView(cd)
				Ini = false
			end
			
			ang = self.Owner:EyeAngles()
			ang.p = ang.p + self.BlendAng.x
			ang.y = ang.y + self.BlendAng.y
			ang.r = ang.r + self.BlendAng.z
			ang = -ang:Forward()
			local light = render.ComputeLighting(self.Owner:GetShootPos(), ang)
			
			cam.Start2D()
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetTexture(lensring)
				surface.DrawTexturedRect(0, 0, 512, 512)
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetTexture(sight)
				surface.DrawTexturedRect(0, 0, 512, 512)
				surface.SetDrawColor(150 * light[1], 150 * light[2], 150 * light[3], 255 * alpha)
				surface.SetTexture(lens)
				surface.DrawTexturedRect(0, 0, 512, 512)
			cam.End2D()
		
		render.SetViewPort(0, 0, x, y)
		render.SetRenderTarget(old)
		
		if self.PSO1Glass then
			self.PSO1Glass:SetTexture("$basetexture", self.ScopeRT)
		end
	end
end
local vm, t, a

local SP = game.SinglePlayer()
local reg = debug.getregistry()
local GetVelocity = reg.Entity.GetVelocity
local Length = reg.Vector.Length
local GetAimVector = reg.Player.GetAimVector

local mag, CT, ang, cone, vel, ammo,ent,hm

local mod, cr, tr, aim

local td = {}

local ef

function SWEP:PrimaryAttack()
	if CLIENT then
		hm = GetConVarNumber("fas2_hitmarker")
	else
		if game.SinglePlayer() then
			hm = tonumber(self.Owner:GetInfo("fas2_hitmarker"))
		end
	end

	if self.FireMode == "safe" then
		if IsFirstTimePredicted() then
			self:CycleFiremodes()
		end
		
		return
	end
	
	if IsFirstTimePredicted() then
		if self.BurstAmount > 0 and self.dt.Shots >= self.BurstAmount then
			return
		end
		
		if self.ReloadState != 0 then
			self.ReloadState = 3
			return
		end
		
		if self.dt.Status == FAS_STAT_CUSTOMIZE then
			return
		end
		
		if self.Cooking or self.FuseTime then
			return
		end
		
		if self.dt.Status == FAS_STAT_SPRINT or self.dt.Status == FAS_STAT_QUICKGRENADE then
			return
		end
		
		td.start = self.Owner:GetShootPos()
		td.endpos = td.start + self.Owner:GetAimVector() * 30
		td.filter = self.Owner
			
		tr = util.TraceLine(td)
		
		if tr.Hit then
			return
		end
		
		mag = self:Clip1()
		CT = CurTime()
		
		if mag <= 0 or self.Owner:WaterLevel() >= 3 then
			self:EmitSound(self.EmptySound, 60, 100)
			self:SetNextPrimaryFire(CT + 0.2)
			//self:EmitSound("FAS2_DRYFIRE", 70, 100)
			return
		end
	
		if self.CockAfterShot and not self.Cocked then
			if SERVER then
				if SP then
					SendUserMessage("FAS2_COCKREMIND", self.Owner) -- wow okay
				end
			else
				self.CockRemindTime = CurTime() + 1
			end
			
			return
		end
		
		local bullet = {}
		bullet.Num = self.Shots
		bullet.Src = self.Owner:GetShootPos()
		bullet.Dir = self.Owner:GetAimVector()
		bullet.Spread = Vector( self.CurCone , self.CurCone, 0)
		bullet.Tracer = 1
		bullet.Damage = self.Damage
		bullet.Force	= self.Damage/2
		bullet.TracerName = "AirboatGunTracer"
		bullet.Callback = function(a, b, c)
		c:SetDamageType( bit.bor( DMG_BULLET ) )
			if SERVER and game.SinglePlayer() and hm > 0 then
				ent = b.Entity
				
				if ent:IsNPC() or ent:IsPlayer() then
					SendUserMessage("FAS2_HITMARKER", self.Owner)
				end
			end
			
			if CLIENT and hm > 0 then
				ent = b.Entity
				
				if ent:IsNPC() or ent:IsPlayer() then
					self.HitMarkerTime = CurTime() + 0.2
					self.HitMarkerAlpha = 255
				end
			end
		end
			
		self.Owner:FireBullets( bullet )
		ef = EffectData()
		ef:SetEntity(self)
		util.Effect("fas2_ef_muzzleflash", ef)
		
		if CLIENT then
			self:CreateMuzzle()
			
			if self.Shell and self.CreateShell then
				self:CreateShell()
			end
		end
		
		mod = self.Owner:Crouching() and 0.75 or 1
		
		self:PlayFireAnim(mag)
			
		if self.dt.Status == FAS_STAT_ADS then
			if self.BurstAmount > 0 then
				if self.DelayedBurstRecoil then
					if self.dt.Shots == self.ShotToDelayUntil then
						self:AimRecoil(self.BurstRecoilMod)
					end
				else
					self:AimRecoil(self.BurstRecoilMod)
				end
			else
				self:AimRecoil()
			end
		else
			if self.BurstAmount > 0 then
				if self.DelayedBurstRecoil then
					if self.dt.Shots == self.ShotToDelayUntil then
						self:HipRecoil(self.BurstRecoilMod)
					end
				else
					self:HipRecoil(self.BurstRecoilMod)
				end
			else
				self:HipRecoil()
			end
		end
		
		self.SpreadWait = CT + self.SpreadCooldown
		
		if self.BurstAmount > 0 then
			self.AddSpread = math.Clamp(self.AddSpread + self.SpreadPerShot * mod * 0.5, 0, self.MaxSpreadInc)
			self.AddSpreadSpeed = math.Clamp(self.AddSpreadSpeed - 0.2 * mod * 0.5, 0, 1)
		else
			self.AddSpread = math.Clamp(self.AddSpread + self.SpreadPerShot * mod, 0, self.MaxSpreadInc)
			self.AddSpreadSpeed = math.Clamp(self.AddSpreadSpeed - 0.2 * mod, 0, 1)
		end
		
		if self.CockAfterShot then
			self.Cocked = false
		end
	
		if SERVER and SP then
			SendUserMessage("FAS2SPREAD", self.Owner)
		end
		
		if CLIENT then
			self.CheckTime = 0
		end
		
		if self.dt.Suppressed then
			self:EmitSound(self.FireSound_Suppressed, 75, 100)
		else
			self:EmitSound(self.FireSound, 105, 100)
		end
		
		self.Owner:SetAnimation(PLAYER_ATTACK1)
		
		self.ReloadWait = CT + 0.3
	end
	
	if self.BurstAmount > 0 then
		self.dt.Shots = self.dt.Shots + 1
		self:SetNextPrimaryFire(CT + self.FireDelay * self.BurstFireDelayMod)
	else
		self:SetNextPrimaryFire(CT + self.FireDelay)
	end
	
	self:TakePrimaryAmmo(1)
	
	//self:SetNextSecondaryFire(CT + 0.1)
	
	return 
end

function SWEP:Reload()
	CT = CurTime()
	
	if CT < self.ReloadWait then
		return
	end
	
	if self.ReloadDelay and CT < self.ReloadDelay then
		return
	end

	if self.Owner:KeyDown(IN_USE) then
		self:CycleFiremodes()
		return
	end
	
	if self.FireMode == "safe" then
		if SERVER and SP then
			SendUserMessage("FAS2_CHECKWEAPON", self.Owner)
		end
		
		if CLIENT then
			self.CheckTime = CT + 0.5
		end
		
		return
	end
	
	if self.CockAfterShot and not self.Cocked then
		self:CockLogic()
	end
	
	mag = self:Clip1()
	
	if (not self.CantChamber and mag >= self.Primary.ClipSize + 1 or self.CantChamber and mag >= self.Primary.ClipSize) or self.Owner:GetAmmoCount(self.Primary.Ammo) == 0 then
		if SERVER and SP then
			SendUserMessage("FAS2_CHECKWEAPON", self.Owner)
		end
		
		if CLIENT then
			self.CheckTime = CT + 0.5
		end
		
		return
	end
	
	if SERVER then
		self.dt.Status = FAS_STAT_IDLE
	end
	
	if mag == 0 then
		if self.Owner.FAS_FamiliarWeapons[self.Class] then
			if self.dt.Bipod then
				FAS2_PlayAnim(self, self.Anims.Reload_Bipod_Empty_Nomen)
				self.ReloadDelay = CT + self.ReloadTime_Bipod_Empty_Nomen + 0.3
				self:SetNextPrimaryFire(CT + self.ReloadTime_Bipod_Empty_Nomen + 0.3)
				self:SetNextSecondaryFire(CT + self.ReloadTime_Bipod_Empty_Nomen + 0.3)
			else
				FAS2_PlayAnim(self, self.Anims.Reload_Empty_Nomen)
				self.ReloadDelay = CT + self.ReloadTime_Empty_Nomen + 0.3
				self:SetNextPrimaryFire(CT + self.ReloadTime_Empty_Nomen + 0.3)
				self:SetNextSecondaryFire(CT + self.ReloadTime_Empty_Nomen + 0.3)
			end
		else
			if self.dt.Bipod then
				FAS2_PlayAnim(self, self.Anims.Reload_Bipod_Empty)
				self.ReloadDelay = CT + self.ReloadTime_Bipod_Empty + 0.3
				self:SetNextPrimaryFire(CT + self.ReloadTime_Bipod_Empty + 0.3)
				self:SetNextSecondaryFire(CT + self.ReloadTime_Bipod_Empty + 0.3)
			else
				FAS2_PlayAnim(self, self.Anims.Reload_Empty)
				self.ReloadDelay = CT + self.ReloadTime_Empty + 0.3
				self:SetNextPrimaryFire(CT + self.ReloadTime_Empty + 0.3)
				self:SetNextSecondaryFire(CT + self.ReloadTime_Empty + 0.3)
			end
		end
	else
		if self.Owner.FAS_FamiliarWeapons[self.Class] then
			if self.dt.Bipod then
				FAS2_PlayAnim(self, self.Anims.Reload_Bipod_Nomen)
				self.ReloadDelay = CT + self.ReloadTime_Bipod_Nomen + 0.3
				self:SetNextPrimaryFire(CT + self.ReloadTime_Bipod_Nomen + 0.3)
				self:SetNextSecondaryFire(CT + self.ReloadTime_Bipod_Nomen + 0.3)
			else
				FAS2_PlayAnim(self, self.Anims.Reload_Nomen)
				self.ReloadDelay = CT + self.ReloadTime_Nomen + 0.3
				self:SetNextPrimaryFire(CT + self.ReloadTime_Nomen + 0.3)
				self:SetNextSecondaryFire(CT + self.ReloadTime_Nomen + 0.3)
			end
		else
			if self.dt.Bipod then
				FAS2_PlayAnim(self, self.Anims.Reload_Bipod)
				self.ReloadDelay = CT + self.ReloadTime_Bipod + 0.3
				self:SetNextPrimaryFire(CT + self.ReloadTime_Bipod + 0.3)
				self:SetNextSecondaryFire(CT + self.ReloadTime_Bipod + 0.3)
			else
				FAS2_PlayAnim(self, self.Anims.Reload)
				self.ReloadDelay = CT + self.ReloadTime + 0.3
				self:SetNextPrimaryFire(CT + self.ReloadTime + 0.3)
				self:SetNextSecondaryFire(CT + self.ReloadTime + 0.3)
			end
		end
	end
end

function SWEP:DoImpactEffect( tr, nDamageType )
if CLIENT then
	if ( tr.HitSky ) then return end

	local effectdata = EffectData()
	effectdata:SetOrigin( tr.HitPos + tr.HitNormal )
	effectdata:SetNormal( tr.HitNormal )
	util.Effect( "cball_bounce", effectdata )
end
end