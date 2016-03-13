if CLIENT then
	killicon.AddFont( "weapon_ex_double", "ChatFont", "Bishot", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/awp")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "COMBINE BISHOT"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 4750
SWEP.MoveSpeed				= 170

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
	language.Add("ex_double_ammo","8MMX2")
end

SWEP.Primary.Damage			= 12.5
SWEP.Primary.NumShots		= 2
SWEP.Primary.Sound			= Sound("NPC_Hunter.FlechetteShoot")
SWEP.Primary.Cone			= 0.001
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 100
SWEP.Primary.Delay			= 0.25
SWEP.Primary.Ammo			= "ex_double"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 2
SWEP.HeatMul				= 1

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 8
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
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(3, 10, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 5000