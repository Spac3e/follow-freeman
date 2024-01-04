SWEP.Instructions 	= ""
SWEP.UrfFood  		= true
SWEP.Category 		= "[За Фрименом] Еда"
SWEP.Author 		= "За Фрименом"
SWEP.IconLetter		= "V"
SWEP.Spawnable		= false
SWEP.AdminOnly		= true

SWEP.Primary.Clipsize 		= -1
SWEP.Primary.DefaultClip 	= -1
SWEP.Primary.Automatic 		= true
SWEP.Primary.Ammo 			= "none"

SWEP.Secondary.Clipsize 	= -1
SWEP.Secondary.DefaultClip 	= -1
SWEP.Secondary.Automatic 	= false
SWEP.Secondary.Ammo 		= "none"

SWEP.DrawAmmo = false
SWEP.DrawCrosshair      	= false
SWEP.Slot					= 1
SWEP.SlotPos				= 1
SWEP.HoldType 				= "slam"
SWEP.DrawWeaponInfoBox     	= false
SWEP.ViewModelFOV          	= 54
SWEP.UseHands              	= true
SWEP.CustomWorldMdl        	= false

SWEP.WorldModel = ""
SWEP.ViewModel 	= ""
SWEP.PrintName 	= "FoodSwep BASE"

function SWEP:Initialize()
    self:SetHoldType("slam")
end

function SWEP:Holster()
    if SERVER and IsValid(self.Owner) then
        self.Owner:StripWeapon(self:GetClass())
    end

    return true
end