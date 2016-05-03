if CLIENT then
	--killicon.Add( "weapon_ex_rebelsniper", "vgui/killicons/ew2_rebelsniper", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_rebelsniper")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "BARRETT M82A1"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 4750
SWEP.MoveSpeed				= 170

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= Model("models/weapons/v_GDCW_M82.mdl")
SWEP.WorldModel				= Model("models/weapons/w_gdcm82.mdl")
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "ar2"
SWEP.DrawHands 				= false

game.AddAmmoType({
	name = "ex_416",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ
})

if CLIENT then 
	language.Add("ex_416_ammo",".416 Barrett")
end

SWEP.Primary.Damage			= 150
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("M82F.single")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= 10
SWEP.Primary.SpareClip		= 10*2
SWEP.Primary.Delay			= 1/2
SWEP.Primary.Ammo			= "ex_416"
SWEP.Primary.Automatic 		= false

--SWEP.ReloadSound			= Sound("beta/reload1.wav")

SWEP.RecoilMul				= 0.1
SWEP.SideRecoilMul			= 0.5
SWEP.VelConeMul				= 5
SWEP.HeatMul				= 0.5
SWEP.CoolMul				= 0
SWEP.CoolSpeedMul			= 0.2

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 13
SWEP.HasCrosshair 			= false
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.5
SWEP.IronSightsPos 			= Vector(3, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 9000

SWEP.ShootOffsetStrength	= Angle(1,1,0)