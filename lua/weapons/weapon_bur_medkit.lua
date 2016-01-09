AddCSLuaFile()

SWEP.PrintName		= "Modified Medkit"
SWEP.Author			= "robotboy655 & MaxOfS2D"
SWEP.Purpose    	= "Heal people with your primary attack, or yourself with the secondary."
SWEP.Category 		= "Burger's Weapons"

SWEP.MoveSpeed		= 0

SWEP.Spawnable			= true
SWEP.UseHands			= true

SWEP.ViewModel			= "models/weapons/c_medkit.mdl"
SWEP.WorldModel			= "models/weapons/w_medkit.mdl"

SWEP.ViewModelFOV		= 54
SWEP.Slot				= 0
SWEP.SlotPos			= 1

SWEP.Primary.ClipSize		= 100
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			= "none"

SWEP.HealAmount = 5 -- Maximum heal amount per use
SWEP.MaxAmmo = 100 -- Maxumum ammo

local HealSound = Sound( "items/smallmedkit1.wav" )
local DenySound = Sound( "items/medshotno1.wav" )

function SWEP:Initialize()

	self:SetHoldType( "slam" )

	if ( CLIENT ) then return end

end

function SWEP:PrimaryAttack()

	if ( CLIENT ) then return end

	local tr = util.TraceLine( {
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 64,
		filter = self.Owner
	} )

	local target = tr.Entity
	self:HealTarget(target)

end

function SWEP:SecondaryAttack()

	if ( CLIENT ) then return end

	local target = self.Owner
	self:HealTarget(target)

end

function SWEP:HealTarget(target)

	if ( IsValid( target ) && self:Clip1() >= 1 && target:Health() < target:GetMaxHealth() ) then

		self:TakePrimaryAmmo( 1 )

		target:SetHealth( target:GetMaxHealth() )
		target:EmitSound( HealSound )

		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
		self:SetNextPrimaryFire( CurTime() + self:SequenceDuration() + 1 )
		self:SetNextSecondaryFire( CurTime() + self:SequenceDuration() + 1 )

	else

		self:EmitSound( DenySound )
		self:SetNextPrimaryFire( CurTime() + 1 )
		self:SetNextSecondaryFire( CurTime() + 1 )

	end


end

function SWEP:Holster()
	
	return (self:GetNextPrimaryFire() <= CurTime() and self:GetNextSecondaryFire() <= CurTime())

end

function SWEP:CustomAmmoDisplay()

	self.AmmoDisplay = self.AmmoDisplay or {} 
	self.AmmoDisplay.Draw = true
	self.AmmoDisplay.PrimaryClip = self:Clip1()

	return self.AmmoDisplay

end