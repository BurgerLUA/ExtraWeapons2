SWEP.PrintName 					= "Penis"                         
SWEP.Category 					= "Burger's Weapons"                	

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

SWEP.Primary.Sound 				= Sound ("ambient/water/water_spray1.wav")
SWEP.Primary.ClipSize			= -1
SWEP.Primary.DefaultClip		= -1
SWEP.Primary.Automatic   		= true
SWEP.Primary.Ammo         		= "none"
SWEP.Primary.Delay 				= 0.1

SWEP.PenisHeal = 0


SWEP.Secondary.Sound			= Sound ("vo/ravenholm/engage03.wav")						
SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= -1
SWEP.Secondary.Automatic		= true
SWEP.Secondary.Ammo				= "none"
SWEP.Secondary.Delay 			= 1




function SWEP:Initialize()  
	self:SetWeaponHoldType( self.HoldType )
	util.PrecacheSound(self.Primary.Sound) 
	util.PrecacheSound(self.Secondary.Sound) 
end 

function SWEP:PrimaryAttack()

	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	self:SetNextSecondaryFire( CurTime() + self.Secondary.Delay )
	self.Weapon:EmitSound(self.Primary.Sound)
	self.Owner:ViewPunch( Angle( -0.1, 0, 0 ) )

	self.Owner:SetHealth( math.Clamp(self.Owner:Health() + 3,0,100) )

	if (SERVER) then
		self:ShootPiss(self:GetPenisPosAng(20))
	end
	
end

function SWEP:GetPenisPosAng(Add)
	local ShootAng = self.Owner:GetAngles() - Angle(Add,0,0)
	ShootAng.p = math.Clamp(ShootAng.p,-45,45)
	local ShootPos = self.Owner:GetPos() + self.Owner:OBBCenter() + Angle(0,self.Owner:GetAngles().y,0):Forward()*3
	return ShootPos,ShootAng
end

function SWEP:ShootPiss(ShootPos,ShootAng)

	local ent = ents.Create("ent_pee")
	ent:SetPos(ShootPos)
	ent:SetAngles(ShootAng)
	ent:SetOwner(self.Owner)
	ent:Spawn()
	local Trail = util.SpriteTrail(ent, 0, Color(255,255,0), false, 5, 1, .8, 1/(15+1)*0.5, "trails/laser.vmt")
	
	local phys = ent:GetPhysicsObject();
	if IsValid(phys) then
		phys:ApplyForceCenter(ShootAng:Forward()*1000 + self.Owner:GetVelocity())
	end
	
end

function SWEP:SecondaryAttack()

	self:SetNextPrimaryFire( CurTime() + self.Secondary.Delay )
	self:SetNextSecondaryFire( CurTime() + self.Secondary.Delay )
	
	self.Weapon:EmitSound(self.Secondary.Sound);
	self.Owner:ViewPunch( Angle( -10, 0, 0 ) )

	if (SERVER) then
		self:ShootCum(self:GetPenisPosAng(10))
	end

end

function SWEP:ShootCum(ShootPos,ShootAng)

	local ent = ents.Create("ent_cum")
	ent:SetPos(ShootPos)
	ent:SetAngles(ShootAng)
	ent:SetOwner(self.Owner)
	ent:Spawn()
	local Trail = util.SpriteTrail(ent, 0, Color(255,255,255), true, math.random(4,5), 0, 0.05 * math.random(1,3), 1/(15+1)*0.5, "effects/bloodstream.vmt")
	
	local phys = ent:GetPhysicsObject()
	if IsValid(phys) then
		phys:ApplyForceCenter(ShootAng:Forward()*800 + self.Owner:GetVelocity())
	end
	
end

function SWEP:Reload()
end