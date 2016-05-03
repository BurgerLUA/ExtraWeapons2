if CLIENT then
	killicon.Add( "weapon_halo_plasmarifle", "vgui/killicons/ew2_HCEplasmarifle", Color( 0, 0, 255, 255 ) )
	killicon.Add( "ent_smod_plasmaprojectile", "vgui/killicons/ew2_HCEplasmarifle", Color( 0, 0, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_HCEplasmarifle")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "PLASMA RIFLE"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 3500
SWEP.MoveSpeed				= 240

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 2
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_plasmarifle.mdl"
SWEP.WorldModel				= "models/weapons/w_halo_plasmarifle.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "pistol"

SWEP.Primary.Damage			= 20
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/plasma_rifle/plasma_rifle.wav")
SWEP.Primary.Cone			= 0.015
SWEP.Primary.ClipSize		= 200
SWEP.Primary.SpareClip		= 0
SWEP.Primary.Delay			= ( 1/(450/60) )
SWEP.Primary.Ammo			= "smod_weeb"
SWEP.Primary.Automatic 		= true

SWEP.RecoilMul				= 0.25
SWEP.SideRecoilMul			= 1
SWEP.VelConeMul				= 0.75
SWEP.HeatMul				= 1
SWEP.CoolMul				= 0.5

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.25
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= true

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= true
SWEP.HasDryFire				= false

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-1, 0, 2)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 3000

SWEP.AddFOV					= 10

SWEP.TracerName 			= "AR2Tracer"

SWEP.BulletEnt				= "ent_smod_plasmaprojectile"
SWEP.SourceOverride			= Vector(2,-20,-3)

SWEP.MeleeSoundMiss			= Sound("weapons/plasma_rifle/plasma_melee.wav")
SWEP.MeleeSoundWallHit		= Sound("weapons/foot/foot_kickwall.wav")
SWEP.MeleeSoundFleshSmall	= Sound("weapons/foot/foot_kickbody.wav")
SWEP.MeleeSoundFleshLarge	= Sound("weapons/foot/foot_kickbody.wav")

SWEP.HasSpecialFire			= true

SWEP.BuildUpAmount = 5

SWEP.BuildUpCoolAmount = 20

function SWEP:SpecialFire()

	--PrintTable(GetActivities(self))
	
	--if not self:CanPrimaryAttack() then	return end
	if self:IsBusy() then return end
	if self:GetNextPrimaryFire() > CurTime() then return end
	
	self:SetNextPrimaryFire(CurTime() + 1.3)
	--self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:WeaponAnimation(self:Clip1(),ACT_VM_HITCENTER)
	
	--if IsFirstTimePredicted() then
		self:NewSwing(90)
	--end

end

function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}

	self.AmmoDisplay.Draw = true //draw the display?

	self.AmmoDisplay.PrimaryClip = math.ceil(self:Clip1() / 2)
	self.AmmoDisplay.PrimaryAmmo = math.Clamp(self:GetBuildUp() * 2 * (1/0.75),0,100)

	return self.AmmoDisplay
	
end


function SWEP:PostPrimaryFire()

	if self:GetBuildUp() >= 50 * 0.75 then
		--if IsFirstTimePredicted() then
			self:WeaponAnimation(self:Clip1(),ACT_VM_FIDGET)
			self.Owner:EmitSound(Sound("weapons/plasma_rifle/plasma_overheat.wav"))
			self:SetNextPrimaryFire(CurTime() + 999)
			self:SetSpecialFloat(1)
		--end
	end

end

 function SWEP:SpareThink()
 
	local BuildUp = self:GetBuildUp()
	
	if self:GetSpecialFloat() == 1 and BuildUp == 0 then
		local ViewModel = self.Owner:GetViewModel()
		self:WeaponAnimation(self:Clip1(),ACT_VM_RELOAD)
		self:SetNextPrimaryFire(CurTime() + ViewModel:SequenceDuration())
		self:SetSpecialFloat(0)
	end
	
end


