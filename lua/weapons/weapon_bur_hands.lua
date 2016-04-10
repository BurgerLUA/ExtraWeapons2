SWEP.PrintName 					= "Hands"                         
SWEP.Category					= "Extra Weapons"           	

SWEP.ViewModel 					= "models/weapons/c_arms_citizen.mdl"
SWEP.WorldModel 				= ""

SWEP.Author 					= "Burger"     
SWEP.Base						= "weapon_base"
SWEP.HoldType 					= "normal"

SWEP.DrawCrosshair 				= false
SWEP.DrawAmmo 					= false  

SWEP.Spawnable 					= false
SWEP.AdminSpawnable 			= false

SWEP.AutoSwitchTo 				= false
SWEP.AutoSwitchFrom 			= true
SWEP.Weight 					= 0

SWEP.Primary.ClipSize			= -1
SWEP.Primary.DefaultClip		= -1
SWEP.Primary.Automatic   		= false
SWEP.Primary.Ammo         		= "none"
						
SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= -1
SWEP.Secondary.Automatic		= false
SWEP.Secondary.Ammo				= "none"

SWEP.Range = 100

function SWEP:Initialize()  
	self:SetWeaponHoldType( self.HoldType )
end 

function SWEP:SetupDataTables()
	self:NetworkVar("Entity",0,"CarryEntity")
	self:NetworkVar("Float",0,"OldMass")
end

function SWEP:PrimaryAttack()
	
	if SERVER then

		if not self:IsCarryingObject() then

			local TraceData = {
				start = self.Owner:EyePos(),
				endpos = self.Owner:EyePos() + self.Owner:EyeAngles():Forward() * self.Range,
				filter = function( ent ) 	
					local PhysObj = ent:GetPhysicsObject()
					if ent:IsValid() and ent:GetClass() == "prop_physics" and PhysObj:IsValid() then
						if PhysObj:IsMotionEnabled() then
							if PhysObj:IsMoveable() then
								return true
							end
						end
					end
					
					return false
					
				end} 

			local TraceResult = util.TraceLine(TraceData)
			local Winner = TraceResult.Entity
			
			self:CarryObject(Winner)
			
		else
			self:DropObject()
		end
		
	end

end

function SWEP:IsCarryingObject()
	return ( self:GetCarryEntity() and self:GetCarryEntity():IsValid() )
end

function SWEP:CarryObject(Winner)
	if Winner and Winner:IsValid() then
	
		local PhysObj = Winner:GetPhysicsObject()
	
		if PhysObj and PhysObj:IsValid() then
	
			self:SetCarryEntity(Winner)
			self:SetOldMass(PhysObj:GetMass())
			
			--PhysObj:SetMass(1000)
			
		end
	end
end

function SWEP:DropObject()

	local Ent = self:GetCarryEntity()
	local Phys = Ent:GetPhysicsObject()
	
	Phys:SetMass(self:GetOldMass())
	--Phys:EnableMotion(true)
	
	self:SetCarryEntity(nil)
end



function SWEP:Think()

	local Ent = self:GetCarryEntity()
	
	if Ent and Ent:IsValid() then
	
		local PhysObj = Ent:GetPhysicsObject()
		
		if PhysObj and PhysObj:IsValid() then
	
			local CarryPoint = self.Owner:EyePos() + self.Owner:EyeAngles():Forward()*self.Range

			local Force = (CarryPoint - self:GetCarryEntity():GetPos()):GetNormal() * FrameTime() * 100000
			

			PhysObj:ApplyForceCenter(Force + Vector(0,0,1)*PhysObj:GetMass()*6.6)


		end
	
	end

end



function SWEP:SecondaryAttack()
	
end

function SWEP:Reload()

end