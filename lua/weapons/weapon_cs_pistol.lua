if CLIENT then
	killicon.AddFont( "weapon_cs_pistol",		"HL2MPTypeDeath",	"-",	Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/usp45")
end

SWEP.Category				= "HL2 to CSS"
SWEP.PrintName				= "9MM USP MATCH"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Secondary"

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/c_pistol.mdl"
SWEP.WorldModel				= "models/weapons/w_pistol.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "revolver"

SWEP.Primary.Damage			= 5 * 3
SWEP.Primary.NumShots 		= 1
SWEP.Primary.Sound			= Sound("weapons/pistol/pistol_fire2.wav")
SWEP.Primary.Cone			= .005
SWEP.Primary.ClipSize		= 18
SWEP.Primary.SpareClip		= 150
SWEP.Primary.Delay			= 1/(400/60)
SWEP.Primary.Ammo			= "Battery"
SWEP.Primary.Automatic 		= false
SWEP.ReloadSound			= Sound("weapons/pistol/pistol_reload1.wav")

SWEP.RecoilMul				= 1
SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false