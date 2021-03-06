if CLIENT then
	killicon.Add( "weapon_ex_minigun", "vgui/killicons/ew2_minigun" , Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_minigun")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "MINIGUN"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 5750
SWEP.CSSMoveSpeed				= 150

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 3
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_minigun.mdl"
SWEP.WorldModel				= "models/weapons/w_minigun.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "shotgun"
SWEP.UseHands 				= false

game.AddAmmoType({
	name = "ex_minigun",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ
})

if CLIENT then 
	language.Add("ex_minigun_ammo","12.7mm")
end

SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/minigun/mini-1.wav")
SWEP.Primary.Cone			= 0.0125
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 400
SWEP.Primary.Delay			= 0.05
SWEP.Primary.Ammo			= "ex_minigun"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 0.25
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 2
SWEP.HeatMul				= 1

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.5
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false 
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= true

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(0, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.BuildUpAmount			= 20

SWEP.DamageFalloff			= 1000

SWEP.HasBuildUp				= true

function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}

	self.AmmoDisplay.Draw = true //draw the display?

	self.AmmoDisplay.PrimaryClip = self:Ammo1()
	self.AmmoDisplay.PrimaryAmmo = self:GetBuildUp()

	return self.AmmoDisplay
	
end

function SWEP:SpareThink()
	if self.Owner:KeyDown(IN_ATTACK) then
		self.CSSMoveSpeed				= 25
	else
		self.CSSMoveSpeed				= 150
	end
end