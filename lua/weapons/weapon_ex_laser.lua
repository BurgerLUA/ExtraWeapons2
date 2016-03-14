if CLIENT then
	killicon.AddFont( "weapon_ex_laser", "ChatFont", "Laser Rifle" , Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/m249")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "LASER RIFLE"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 5750
SWEP.MoveSpeed				= 125

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_laser.mdl"
SWEP.WorldModel				= "models/weapons/w_irifle.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "shotgun"
SWEP.UseHands 				= false

SWEP.Primary.Damage			= 5
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/airboat/airboat_gun_energy1.wav")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 500
SWEP.Primary.Delay			= 0.05
SWEP.Primary.Ammo			= "ar2"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1.25
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 2
SWEP.HeatMul				= 0

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 8
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
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 2500