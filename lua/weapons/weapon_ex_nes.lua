if CLIENT then
	killicon.AddFont( "weapon_cs_deserteagle", "csd", "f", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/deserteagle")
end

SWEP.Category				= "Counter-Strike"
SWEP.PrintName				= ".357 NES ZAPPER"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Secondary"

SWEP.Cost					= 650
SWEP.MoveSpeed				= 250

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_pist_nesz.mdl"
SWEP.WorldModel				= "models/weapons/w_pist_nesz.mdl"
SWEP.VModelFlip 			= true
SWEP.HoldType				= "revolver"

SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/NESZapper/NESZap1.wav")
SWEP.Primary.Cone			= 0.003
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 35
SWEP.Primary.Delay			= 1/7
SWEP.Primary.Ammo			= "CombineCannon"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul 				= 1
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 0.5
SWEP.HeatMul				= 1

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.75
SWEP.HasCrosshair			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(6.3, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 3000
