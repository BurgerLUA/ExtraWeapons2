if CLIENT then
	local Color_Icon = Color( 255, 80, 0, 255 )
	killicon.AddFont( "weapon_cs_smg",		"HL2MPTypeDeath",	"/",	Color_Icon )
	killicon.AddFont( "weapon_cs_357",			"HL2MPTypeDeath",	".",	Color_Icon )
	killicon.AddFont( "weapon_cs_ar2",			"HL2MPTypeDeath",	"2",	Color_Icon )
	killicon.AddFont( "ent_cs_crossbow_bolt",		"HL2MPTypeDeath",	"1",	Color_Icon )
	killicon.AddFont( "weapon_cs_spas",		"HL2MPTypeDeath",	"0",	Color_Icon )
	killicon.AddFont( "ent_cs_rpg_missile",		"HL2MPTypeDeath",	"3",	Color_Icon )
	killicon.AddFont( "ent_cs_grenade_frag",	"HL2MPTypeDeath",	"4",	Color_Icon )
	killicon.AddFont( "weapon_cs_pistol",		"HL2MPTypeDeath",	"-",	Color_Icon )
	killicon.AddFont( "ent_cs_combine_ball",	"HL2MPTypeDeath",	"8",	Color_Icon )
	killicon.AddFont( "ent_cs_smg1_grenade",		"HL2MPTypeDeath",	"7",	Color_Icon )
	killicon.AddFont( "weapon_cs_stunstick",	"HL2MPTypeDeath",	"!",	Color_Icon )
	killicon.AddFont( "weapon_cs_crowbar",		"HL2MPTypeDeath",	"6",	Color_Icon )

end

SWEP.Category				= "HL2 to CSS"
SWEP.PrintName				= ".357 COLT PYTHON"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Secondary"

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/c_357.mdl"
SWEP.WorldModel				= "models/weapons/w_357.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "revolver"

SWEP.Primary.Damage			= 100
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/357/357_fire2.wav")
SWEP.Primary.Cone			= 0
SWEP.Primary.ClipSize		= 6
SWEP.Primary.SpareClip		= 36
SWEP.Primary.Delay			= 1/(80/60)
SWEP.Primary.Ammo			= "357"
SWEP.Primary.Automatic 		= false
SWEP.Secondary.Automatic 	= true

SWEP.RecoilMul 				= 3
SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false