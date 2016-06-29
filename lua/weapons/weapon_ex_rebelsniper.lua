if CLIENT then
	killicon.Add( "weapon_ex_rebelsniper", "vgui/killicons/ew2_rebelsniper", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_rebelsniper")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "REBEL SNIPER"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 4750
SWEP.CSSMoveSpeed				= 170

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/ctf_weapons/v_sniper.mdl"
SWEP.WorldModel				= "models/ctf_weapons/w_sniper.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"
SWEP.DrawHands 				= false

game.AddAmmoType({
	name = "ex_cannon",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ
})

if CLIENT then 
	language.Add("ex_cannon_ammo","20x102mm")
end

SWEP.Primary.Damage			= 5000
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("beta/fire1.wav")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= 1
SWEP.Primary.SpareClip		= 20
SWEP.Primary.Delay			= 1
SWEP.Primary.Ammo			= "ex_cannon"
SWEP.Primary.Automatic 		= false

SWEP.ReloadSound			= Sound("beta/reload1.wav")

SWEP.RecoilMul				= 0.01
SWEP.SideRecoilMul			= 0.5
SWEP.VelConeMul				= 5
SWEP.HeatMul				= 0.1

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 14
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
SWEP.IronSightTime			= 0
SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 9000