if CLIENT then
	killicon.AddFont( "weapon_cs_ar2",			"HL2MPTypeDeath",	"2",	Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/sg552")
end

SWEP.Category				= "HL2 to CSS"
SWEP.PrintName				= "RPG LAUNCHER"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 3500
SWEP.MoveSpeed				= 230

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/c_rpg.mdl"
SWEP.WorldModel				= "models/weapons/w_rocket_launcher.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "rpg"

SWEP.Primary.Damage			= 150
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/rpg/rocketfire1.wav")
SWEP.Primary.Cone			= .0025
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 1
SWEP.Primary.Delay			= 1/(30/60)
SWEP.Primary.Ammo			= "RPG_Round"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 1
SWEP.VelConeMul				= 0

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 3
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= true

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false

SWEP.HasIronSights 			= false
SWEP.EnableIronCross		= false
SWEP.HasGoodSights			= false
SWEP.IronSightTime			= 0.5
SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

function SWEP:ShootBullet(Damage,Shots,Cone,Source,Direction,Source)
	self:ThrowObject("ent_cs_rocket",10000)
	self:SendWeaponAnim(ACT_VM_RELOAD)
end

