if CLIENT then
	killicon.AddFont( "weapon_ex_nes",		"ChatFont",	"NES Gun",	Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/usp45")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "NES ZAPPER"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Secondary"

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_pist_nesz.mdl"
SWEP.WorldModel				= "models/weapons/w_pist_nesz.mdl"
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "revolver"

SWEP.Primary.Damage			= 100
SWEP.Primary.NumShots 		= 1
SWEP.Primary.Sound			= Sound("weapons/NESZapper/NESZap1.wav")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= 1
SWEP.Primary.SpareClip		= 64
SWEP.Primary.Delay			= 1
SWEP.Primary.Ammo			= "Battery"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 0.1
SWEP.SideRecoilMul			= 0.1
SWEP.VelConeMul				= 2
SWEP.HeatMul				= 0.1

SWEP.ReloadSound			= Sound("weapons/NESZapper/NESKill.wav")

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.5
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false
SWEP.HasDryFire				= false

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(4, 5, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 1000