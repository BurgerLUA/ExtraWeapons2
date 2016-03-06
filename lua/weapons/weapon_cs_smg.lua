if CLIENT then
	killicon.AddFont( "weapon_cs_smg",		"HL2MPTypeDeath",	"/",	Color( 255, 80, 0, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/gfx/vgui/mp5")
end

SWEP.Category				= "HL2 to CSS"
SWEP.PrintName				= "4.6MM MP7"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 2
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/c_smg1.mdl"
SWEP.WorldModel				= "models/weapons/w_smg1.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "smg"

SWEP.Primary.Damage			= 15
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/smg1/smg1_fire1.wav")
SWEP.Primary.Cone			= .005
SWEP.Primary.ClipSize		= 45
SWEP.Primary.SpareClip		= 120
SWEP.Primary.Delay			= 1/(750/60)
SWEP.Primary.Ammo			= "smg1"
SWEP.Primary.Automatic 		= true
SWEP.ReloadSound			= Sound("weapons/smg1/smg1_reload.wav")
--SWEP.BurstSound				= Sound("weapons/smg1/smg1_fireburst1.wav")

SWEP.RecoilMul				= 2
SWEP.SideRecoilMul			= 0.5
SWEP.VelConeMul				= 1.25
SWEP.HeatMul				= 0.5

SWEP.BurstConeMul			= 0.5

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.25
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= true
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false
SWEP.HasDryFire				= false

SWEP.Object					= "grenade_ar2"

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(-6.43, 0, 0)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 2000



--[[
function SWEP:SecondaryAttack()
	
	if self.Owner:GetAmmoCount(self.Secondary.Ammo) > 0 then
		self.Owner:SetAnimation(PLAYER_ATTACK1)
		self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
		self:ThrowObject(self.Object,1000)
		self:EmitGunSound(self.Secondary.Sound)
		self:TakeSecondaryAmmo(1)
	end
	
	self:SetNextSecondaryFire(CurTime() + 1)
	
end
--]]