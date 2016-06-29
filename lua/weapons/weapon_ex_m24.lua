if CLIENT then
	--killicon.Add( "weapon_ex_rebelsniper", "vgui/killicons/ew2_rebelsniper", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_rebelsniper")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "M24"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 4750
SWEP.CSSMoveSpeed				= 170

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= Model("models/weapons/v_GDCW_M24SI.mdl")
SWEP.WorldModel				= Model("models/weapons/w_snip_m24_6.mdl")
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "ar2"
SWEP.DrawHands 				= false

SWEP.Primary.Damage			= 80
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("M24F.single")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= 10
SWEP.Primary.SpareClip		= 10*2
SWEP.Primary.Delay			= 1.25
SWEP.Primary.Ammo			= "css_762mm"
SWEP.Primary.Automatic 		= false

--SWEP.ReloadSound			= Sound("beta/reload1.wav")

SWEP.RecoilMul				= 0.1
SWEP.SideRecoilMul			= 0.5
SWEP.VelConeMul				= 1
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1

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
SWEP.IronSightTime			= 0.5
SWEP.IronSightsPos 			= Vector(3, 0, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 9000

SWEP.EnableTracer			= false