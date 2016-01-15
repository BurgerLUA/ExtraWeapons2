AddCSLuaFile()

SWEP.PrintName		= "Modified Medkit"
SWEP.Author			= "robotboy655 & MaxOfS2D"
SWEP.Purpose    	= "Heal people with your primary attack, or yourself with the secondary."
SWEP.Category 		= "Burger's Weapons"

SWEP.MoveSpeed			= 200

SWEP.Spawnable			= true
SWEP.UseHands			= true

SWEP.ViewModel			= "models/weapons/c_medkit.mdl"
SWEP.WorldModel			= "models/weapons/w_medkit.mdl"

SWEP.ViewModelFOV		= 54
SWEP.Slot				= 0
SWEP.SlotPos			= 1

game.AddAmmoType({name = "medical"})

if CLIENT then 
	language.Add("medical_ammo","Medical Supplies")
end

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "medical"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			= "none"

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = true

local HealSound = Sound( "items/smallmedkit1.wav" )
local DenySound = Sound( "items/medshotno1.wav" )

function SWEP:Initialize()

	self:SetHoldType( "slam" )

	if ( CLIENT ) then return end

end

function SWEP:PrimaryAttack()

	self:Animation()
	
	if CLIENT then return end

	if IsFirstTimePredicted() then
		local tr = util.TraceLine( {
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 64,
			filter = self.Owner
		} )

		local target = tr.Entity
		self:HealTarget(target)
	end
	
	
	
	
end

function SWEP:SecondaryAttack()

	self:Animation()
	
	if CLIENT then return end
	
	if IsFirstTimePredicted() then
		self:HealTarget(self.Owner)
	end
	
end

function SWEP:Animation()
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	self:SetNextPrimaryFire( CurTime() + self:SequenceDuration() )
	self:SetNextSecondaryFire( CurTime() + self:SequenceDuration() )
end


function SWEP:CanHeal(target)
	return ( IsValid( target ) && self:Ammo1() ~= 0 && target:Health() < target:GetMaxHealth() )
end

function SWEP:HealTarget(target)

	if self:CanHeal(target) then
	
		local DesiredHeal = math.Clamp(target:GetMaxHealth() - target:Health(),0, math.min(15,self:Ammo1()))
		
		self:TakePrimaryAmmo( DesiredHeal )

		target:SetHealth( target:Health() + DesiredHeal )
		target:EmitSound( HealSound )
		
	else
		self.Owner:EmitSound( DenySound )
	end


end