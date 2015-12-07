if CLIENT then
	killicon.AddFont( "weapon_cs_spas",		"HL2MPTypeDeath",	"0",	Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/m3")
end

SWEP.Category				= "HL2 to CSS"
SWEP.PrintName				= "12 GAUGE SPAS12"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 2
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/c_shotgun.mdl"
SWEP.WorldModel				= "models/weapons/w_shotgun.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "shotgun"

SWEP.Primary.Damage			= 100/8
SWEP.Primary.NumShots		= 8
SWEP.Primary.Sound			= Sound("weapons/shotgun/shotgun_fire7.wav")
SWEP.Primary.Cone			= 0.09
SWEP.Primary.ClipSize		= 6
SWEP.Primary.SpareClip		= 32
SWEP.Primary.Delay			= 1/(120/60)
SWEP.Primary.Ammo			= "Buckshot"
SWEP.Primary.Automatic 		= false

SWEP.ReloadSound = Sound("weapons/shotgun/shotgun_reload3.wav")
SWEP.BurstSound = Sound("weapons/shotgun/shotgun_dbl_fire.wav")

SWEP.RecoilMul 				= 3
SWEP.VelConeMul				= 2

SWEP.RecoilMul				= 1
SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= true
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= true
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false