if CLIENT then
	killicon.Add( "weapon_ex_mosin", "vgui/killicons/ew2_mosinnagant", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_mosinnagant")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "7.62MM MOSIN-NAGANT"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2750
SWEP.MoveSpeed				= 260

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_mosin.mdl"
SWEP.WorldModel				= "models/weapons/w_mosin.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"
SWEP.UseHands 				= false

SWEP.Primary.Damage			= 105
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/AK101/ak101_fire.wav")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= 5
SWEP.Primary.SpareClip		= 50
SWEP.Primary.Delay			= 1.3
SWEP.Primary.Ammo			= "StriderMinigun"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 0.25
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 2
SWEP.HeatMul				= 0.25

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= true
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false
SWEP.HasDryFire				= false

SWEP.BurstOverride			= 6
SWEP.BurstConeMul			= 10

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(-1, 4, 0)
SWEP.IronSightsAng 			= Vector(1,1.5, -5)

SWEP.DamageFalloff			= 3000

SWEP.DisableReloadUntilEmpty = true