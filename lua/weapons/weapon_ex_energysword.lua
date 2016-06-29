if CLIENT then
	--killicon.AddFont( "weapon_ex_stunstick",	"HL2MPTypeDeath",	"!",	Color( 255, 80, 0, 255 ) )
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "ENERGY SWORD"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Free"

SWEP.Cost					= 0
SWEP.CSSMoveSpeed				= 240

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 0
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_halo_sword.mdl"
SWEP.WorldModel				= "models/weapons/w_halo_sword.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "knife"

SWEP.UseHands				= false

game.AddAmmoType({name = "smod_metal"})

if CLIENT then 
	language.Add("smod_metal_ammo","Metal")
end

SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.ClipSize		= 100
SWEP.Primary.SpareClip		= 0
SWEP.Primary.Delay			= 1
SWEP.Primary.Ammo			= "smod_weeb"
SWEP.Primary.Automatic 		= true 

SWEP.Secondary.Damage		= 30
SWEP.Secondary.NumShots		= 1
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.SpareClip	= -1
SWEP.Secondary.Delay		= 1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic 	= true 

SWEP.RecoilMul				= 1
SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 1
SWEP.HasCrosshair 			= false
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false

SWEP.MeleeSoundMiss			= Sound("Weapon_StunStick.Melee_Miss")
SWEP.MeleeSoundWallHit		= Sound("Weapon_StunStick.Melee_HitWorld")
SWEP.MeleeSoundFleshSmall	= Sound("Weapon_StunStick.Melee_Hit")
SWEP.MeleeSoundFleshLarge	= Sound("Weapon_StunStick.Melee_Hit")

SWEP.IronSightTime			= 0.125
SWEP.IronSightsPos 			= Vector(-10, -10, 5)
SWEP.IronSightsAng 			= Vector(0, 0, -45)

SWEP.AddFOV					= 20

SWEP.DamageFalloff			= 1000

function SWEP:PrimaryAttack()
	if self:IsUsing() then return end
	if self:GetNextPrimaryFire() > CurTime() then return end
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:SendSequence("fire")
	
	
	local DamageMul = 1
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)
	
	if self:GetIsLeftFire() then
		DamageMul = 2
	else
		DamageMul = 1
	end
	
	if SERVER then
		--self.Owner:ChatPrint(self.Primary.Damage*DamageMul)
	end
	
	self:SetIsLeftFire(false)
	
	if self:NewSwing(self.Primary.Damage*DamageMul ) then
		self:AddDurability(-5*DamageMul)
	end
	
end

function SWEP:Lunge(strength)
	local Angles = self.Owner:EyeAngles()
	local Forward = (Angles - Angle(Angles.p,0,0)):Forward()
	--self.Owner:SetVelocity( Vector(0,0,500) )
	--self.Owner:SetVelocity( Forward*strength )
end

function SWEP:SecondaryAttack()
	if self:IsUsing() then return end
	if self:GetNextSecondaryFire() > CurTime() then return end
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:SendSequence("melee")

	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay/2)
	self:SetNextSecondaryFire(CurTime() + self.Primary.Delay*2)
	
	local DamageMul = 0.3
	
	if SERVER then
		--self.Owner:ChatPrint(self.Primary.Damage*DamageMul)
	end

	self:SetIsLeftFire(true)

	if self:NewSwing(self.Primary.Damage*DamageMul) then
		self:AddDurability(-5)
	end
	
	
	
	
end

function SWEP:Reload()

end

function SWEP:AddDurability(amount)

	self:SetClip1( math.Clamp(self:Clip1() + amount,0,100) )

	if self:Clip1() <= 0 then
		self.Owner:EmitSound("physics/metal/sawblade_stick1.wav")
		if self and SERVER then
			self.Owner:StripWeapon(self:GetClass())
		end
	end
	
end

function SWEP:Deploy()

	self:EmitGunSound(Sound("Weapon_SMODSword.Deploy"))
	self.Owner:DrawViewModel(true)
	self:SendWeaponAnim(ACT_VM_DRAW)
	self:SetNextPrimaryFire(CurTime() + self.Owner:GetViewModel():SequenceDuration())	
	self:SetIsLeftFire(false)
	
	return true
end

