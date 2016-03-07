if CLIENT then
	killicon.AddFont( "weapon_cs_awp", "csd", "r", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/awp")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "PULSE COMBINE SNIPER"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 4750
SWEP.MoveSpeed				= 150

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_combinesniper_e2.mdl"
SWEP.WorldModel				= "models/weapons/w_combinesniper_e2.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"
SWEP.DrawHands 				= false

SWEP.Primary.Damage			= 500
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("jaanus/ep2sniper_fire.wav")
SWEP.Primary.Cone			= 0.001
SWEP.Primary.ClipSize		= 1
SWEP.Primary.SpareClip		= 60
SWEP.Primary.Delay			= 1
SWEP.Primary.Ammo			= "ar2"
SWEP.Primary.Automatic 		= false

SWEP.ReloadSound			= Sound("jaanus/ep2sniper_reload.wav")

SWEP.RecoilMul				= 0.1
SWEP.SideRecoilMul			= 0.5
SWEP.VelConeMul				= 10
SWEP.HeatMul				= 0.2

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 14
SWEP.HasCrosshair 			= false
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= true
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0
SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 9000