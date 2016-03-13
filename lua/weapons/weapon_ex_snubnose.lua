if CLIENT then
	killicon.AddFont( "weapon_ex_snubnose", "ChatFont", "Snubnose", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/scout")
end


SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "SNUBNOSE .357"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Secondary"

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_magnum.mdl"
SWEP.WorldModel				= "models/weapons/w_357.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "revolver"
SWEP.UseHands 				= false

SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/357/357_fire2.wav")
SWEP.Primary.Cone			= 0.006
SWEP.Primary.ClipSize		= 6
SWEP.Primary.SpareClip		= 36
SWEP.Primary.Delay			= 1/7
SWEP.Primary.Ammo			= "357"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 1
SWEP.SideRecoilMul			= 0.5
SWEP.VelConeMul				= 1
SWEP.HeatMul				= 1

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.5
SWEP.HasCrosshair			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false
SWEP.HasDryFire				= false

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(-3, 4, -1)
SWEP.IronSightsAng 			= Vector(0, 0.125, 0)

SWEP.DamageFalloff			= 3000