if CLIENT then
	killicon.AddFont( "weapon_smod_greasegun", "ChatFont", "Greasegun", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/mp5")
end

SWEP.Category				= "SMOD"
SWEP.PrintName				= "GREASEGUN"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 1500
SWEP.MoveSpeed				= 250

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 2
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_grease.mdl"
SWEP.WorldModel				= "models/weapons/w_grease.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "smg"

SWEP.Primary.Damage			= 40
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/smg2/smg2_fireburst1.wav")
SWEP.Primary.Cone			= 0.01
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 30
SWEP.Primary.Delay			= 1/6
SWEP.Primary.Ammo			= "Battery"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 0.5
SWEP.HeatMul				= 1

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
SWEP.HasDownRecoil			= true

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-4, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 1000