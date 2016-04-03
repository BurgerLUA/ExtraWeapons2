if CLIENT then
	killicon.Add( "weapon_ex_double", "vgui/killicons/ew2_bishot", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_bishot")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "8MMX2 BISHOT"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 4750
SWEP.MoveSpeed				= 150

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_atgun.mdl"
SWEP.WorldModel				= "models/jaanus/atgun.mdl"
SWEP.ViewModelFlip 			= false
SWEP.HoldType				= "ar2"
SWEP.DrawHands 				= false

game.AddAmmoType({name = "ex_double"})

if CLIENT then 
	language.Add("ex_double_ammo","8MM")
end

SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("NPC_Hunter.FlechetteShoot")
SWEP.Primary.Cone			= 0.002
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 200
SWEP.Primary.Delay			= 1/(600/60)
SWEP.Primary.Ammo			= "ex_double"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 2
SWEP.HeatMul				= 1

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 5
SWEP.HasCrosshair 			= false
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= true
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= true

SWEP.BurstOverride			= 4
SWEP.BurstConeMul			= 0.1
SWEP.BurstSpeedOverride 	= 4
SWEP.BurstRecoilMul			= 0.25
SWEP.BurstHeatMul			= 0.25
SWEP.BurstZoomMul			= 4

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(-5, 0, -4)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 3000