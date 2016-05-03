if CLIENT then
	--killicon.Add( "weapon_ex_rebelsniper", "vgui/killicons/ew2_rebelsniper", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_rebelsniper")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "SAKO TGR-42"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 4750
SWEP.MoveSpeed				= 200

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= Model("models/weapons/v_GDCW_AWP.mdl")
SWEP.WorldModel				= Model("models/weapons/w_gdcawp.mdl")
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "ar2"
SWEP.DrawHands 				= false

game.AddAmmoType({
	name = "ex_338AP",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ
})

if CLIENT then 
	language.Add("ex_338AP_ammo",".338 AP")
end

SWEP.Primary.Damage			= 55
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("AWPF.single")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= 5
SWEP.Primary.SpareClip		= 5*4
SWEP.Primary.Delay			= 0.9
SWEP.Primary.Ammo			= "ex_338AP"
SWEP.Primary.Automatic 		= false

--SWEP.ReloadSound			= Sound("beta/reload1.wav")

SWEP.RecoilMul				= 0.1
SWEP.SideRecoilMul			= 0.5
SWEP.VelConeMul				= 0.75
SWEP.HeatMul				= 1
SWEP.CoolMul				= 1
SWEP.CoolSpeedMul			= 1

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 7
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

SWEP.DamageFalloff			= 3000

SWEP.PenetrationLossScale	= 0.01