if CLIENT then
	killicon.Add( "weapon_ex_combinesniper", "vgui/killicons/ew2_combinesniper", Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_combinesniper")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "CHARGED PULSE SNIPER"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 4750
SWEP.MoveSpeed				= 0

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_combinesniper_e2.mdl"
SWEP.WorldModel				= "models/weapons/w_combinesniper_e2.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "ar2"
SWEP.DrawHands 				= false

game.AddAmmoType({name = "ex_charged"})

if CLIENT then 
	language.Add("ex_charged_ammo","Charged Pulse")
end

SWEP.Primary.Damage			= 200
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("jaanus/ep2sniper_fire.wav")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 20
SWEP.Primary.Delay			= 0.75
SWEP.Primary.Ammo			= "ex_charged"
SWEP.Primary.Automatic 		= false

SWEP.ReloadSound			= Sound("jaanus/ep2sniper_reload.wav")

SWEP.RecoilMul				= 0.125
SWEP.SideRecoilMul			= 0.5
SWEP.VelConeMul				= 10
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
SWEP.IronSightTime			= 0
SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 9000

SWEP.IgnoreDrawDelay		= true

SWEP.CustomScope			= Material("vgui/svdscope1")