AddCSLuaFile()

if SERVER then
   	resource.AddFile("materials/vgui/ttt/icon_biohazardball.vmt")
end

SWEP.Author 				= "jmoak3"
SWEP.Contact 				= "mrjmoak3@gmail.com or @jmoak3"
SWEP.Purpose 				= "A seemingly harmless ball of zombie meat"
SWEP.Instructions 			= "Throw the Biohazard Ball and infect a player! Right click to eat!"

SWEP.Spawnable 				= true
SWEP.AdminOnly		 		= false
SWEP.UseHands 				= false

SWEP.ViewModel 				= "models/weapons/v_bugbait.mdl"
SWEP.WorldModel				= "models/weapons/w_bugbait.mdl"

game.AddAmmoType( {
	name = "biohazrd_ball",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE,
	plydmg = 0,
	npcdmg = 0,
	force = 2000,
	minsplash = 10,
	maxsplash = 5
} )

SWEP.HoldType = "grenade"
SWEP.Primary.ClipSize 		= 5
SWEP.Primary.DefaultClip	= 5
SWEP.DrawAmmo = true
SWEP.ViewModelFOV  = 72
SWEP.ViewModelFlip = true

SWEP.Category 				= "jmoak3"

SWEP.DrawCrosshair = false
SWEP.Primary.Ammo 			= "grenade"



SWEP.Secondary.ClipSize 	= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.AllowDrop = true
SWEP.ViewModelFlip = false

SWEP.PrintName 				= "Biohazard Ball"
SWEP.Slot					= 1
SWEP.AutoSpawnable = false
SWEP.Icon = "vgui/ttt/icon_biohazardball"

local testing = false

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
	self.CanFire = true
end


function SWEP:Reload()
end

function SWEP:Think()
	
end

function SWEP:Throw()
	if (!SERVER) then return end

	self:TakePrimaryAmmo(1)
	
	self:ShootEffects()
	self.BaseClass.ShootEffects(self)
	
	self.Weapon:SendWeaponAnim(ACT_VM_THROW)
	self.CanFire = false
	
	local ent = ents.Create("sent_biohazardball")
	
	if (self.Weapon==nil) then return end
	
	timer.Create("BBFireTimer", 1, 1, function()
						self.CanFire = true
						self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
						end) 
	
	ent:SetPos(self.Owner:EyePos() + (self.Owner:GetAimVector()* 16))
	ent:SetAngles(self.Owner:EyeAngles())
	ent:Spawn()
	
	local phys = ent:GetPhysicsObject()
	
	if !(phys && IsValid(phys)) then ent:Remove() return end
	
	phys:ApplyForceCenter(self.Owner:GetAimVector():GetNormalized() * 1300)

end

function SWEP:PrimaryAttack()
	if (self:CanPrimaryAttack() && self.CanFire) then
		self:Throw()
	end
end


