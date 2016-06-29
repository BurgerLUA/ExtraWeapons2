if CLIENT then
	--killicon.Add( "weapon_ex_rebelsniper", "vgui/killicons/ew2_rebelsniper", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_rebelsniper")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "AS50"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 4750
SWEP.CSSMoveSpeed				= 150

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= Model("models/weapons/v_GDCWAS50.mdl")
SWEP.WorldModel				= Model("models/weapons/w_gdcas50.mdl")
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "ar2"
SWEP.DrawHands 				= false

game.AddAmmoType({
	name = "ex_50bmg",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ
})

if CLIENT then 
	language.Add("ex_50bmg_ammo",".50 BMG")
end

SWEP.Primary.Damage			= 150
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("AS50F.single")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= 5
SWEP.Primary.SpareClip		= 5*4
SWEP.Primary.Delay			= 1/(187/60)
SWEP.Primary.Ammo			= "ex_50bmg"
SWEP.Primary.Automatic 		= false

--SWEP.ReloadSound			= Sound("beta/reload1.wav")

SWEP.RecoilMul				= 0.4
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 5
SWEP.HeatMul				= 0.25
SWEP.CoolMul				= 0.5
SWEP.CoolSpeedMul			= 0.5

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
SWEP.IronSightsPos 			= Vector(3, 0, -1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 9000

SWEP.ColorOverlay			= Color(255,0,0,40)

SWEP.ShootOffsetStrength	= Angle(2,2,0)