if CLIENT then
	killicon.AddFont( "weapon_ex_p90minigun", "ChatFont", "P90 Minigun" , Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/m249")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "5.7MM P90 MINIGUN"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 5750
SWEP.MoveSpeed				= 245

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 2
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_sub_p90.mdl"
SWEP.WorldModel				= "models/weapons/w_sub_p90.mdl"
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "smg"
SWEP.UseHands 				= false

SWEP.Primary.Damage			= 15
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/p90_mini/p90-1.wav")
SWEP.Primary.Cone			= 0.009
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 100
SWEP.Primary.Delay			= 0.05
SWEP.Primary.Ammo			= "AlyxGun"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 0.5
SWEP.HeatMul				= 1

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= true

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0
SWEP.IronSightsPos 			= Vector(5, 0, -4)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 1000

SWEP.HasBuildUp				= true