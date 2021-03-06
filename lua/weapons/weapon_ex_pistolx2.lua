if CLIENT then
	killicon.AddFont( "weapon_ex_pistolx2",		"HL2MPTypeDeath",	"--",	Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/usp45")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "PISTOL AKIMBO"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Secondary"

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.CSSMoveSpeed				= 200

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_pistols.mdl"
SWEP.WorldModel				= "models/weapons/w_pistol.mdl"
SWEP.ViewModelFlip 			= false
SWEP.HoldType				= "duel"

SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots 		= 1
SWEP.Primary.Sound			= Sound("weapons/pistol/pistol_fire2.wav")
SWEP.Primary.Cone			= 0.075
SWEP.Primary.ClipSize		= 36
SWEP.Primary.SpareClip		= 150
SWEP.Primary.Delay			= 1/(1400/60)
SWEP.Primary.Ammo			= "pistol"
SWEP.Primary.Automatic 		= true
--SWEP.ReloadSound			= Sound("weapons/pistol/pistol_reload1.wav")

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.25
SWEP.VelConeMul				= 2
SWEP.HeatMul				= 0.75

SWEP.BurstOverride			= 6
SWEP.BurstConeMul			= 0.5
SWEP.BurstSpeedOverride 	= 1
SWEP.BurstHeatMul			= 1

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.25
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= true
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false
SWEP.HasDryFire				= false
SWEP.HasDual				= true

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(0, 5, 3)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 300

SWEP.EnableTracer			= false

SWEP.AddFOV					= 30