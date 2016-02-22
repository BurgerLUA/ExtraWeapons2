if CLIENT then
	killicon.AddFont( "weapon_cs_ar2",			"HL2MPTypeDeath",	"2",	Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/sg552")
end

SWEP.Category				= "HL2 to CSS"
SWEP.PrintName				= "PULSE OSIPR"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 3500
SWEP.MoveSpeed				= 230

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/c_irifle.mdl"
SWEP.WorldModel				= "models/weapons/w_irifle.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"

SWEP.Primary.Damage			= 11 * 3
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/ar2/fire1.wav")
SWEP.Primary.Cone			= .0025
SWEP.Primary.ClipSize		= 30
SWEP.Primary.SpareClip		= 90
SWEP.Primary.Delay			= 1/(666/60)
SWEP.Primary.Ammo			= "AirboatGun"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.VelConeMul				= 1.5

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 3
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= true

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= true
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.BurstOverride			= 5
SWEP.BurstSpeedOverride 	= 1
SWEP.BurstConeMul			= 0.8
--SWEP.BurstSound = "weapons/ar1/ar1_dist1.wav"

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0
SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 3000