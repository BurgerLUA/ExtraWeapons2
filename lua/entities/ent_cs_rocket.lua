ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "HE GRENADE"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false 

AddCSLuaFile()

function ENT:Initialize()
	if SERVER then
		self:SetModel("models/weapons/w_missile_closed.mdl") 
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		
		local phys = self:GetPhysicsObject()
		
		if phys:IsValid() then
			phys:Wake()
			phys:SetBuoyancyRatio(0)
			phys:EnableGravity(false)
		end
	end
end

function ENT:PhysicsCollide(data, physobj)
	if SERVER then
	
		self.HitP = data.HitPos
		self.HitN = data.HitNormal

		self:Detonate(data.HitPos)
		
	end
end

function ENT:Think()
	if SERVER then
		self:GetPhysicsObject():ApplyForceCenter(self:GetUp()*-10)
	end
end

function ENT:Detonate(pos)
	if SERVER then
		if not self:IsValid() then return end
		
		local effectdata = EffectData()
			effectdata:SetStart( pos + Vector(0,0,100)) // not sure if we need a start and origin (endpoint) for this effect, but whatever
			effectdata:SetOrigin( pos)
			effectdata:SetScale( 100 )
			effectdata:SetRadius( 5000 )
		util.Effect( "Explosion", effectdata)

		if self.Owner then
			util.BlastDamage(self, self.Owner, pos, 400, 300)
		end
		
		self:EmitSound("weapons/hegrenade/explode"..math.random(3,5)..".wav",100,100)
		
		if IsValid(self.HitP) then
			self.Pos1 = self.HitP + self.HitN
			self.Pos2 = self.HitP - self.HitN
			util.Decal("Scorch", self.Pos1, self.Pos2)
		end
				
		self:Remove()
	end
end

function ENT:Draw()
	if CLIENT then
		self:DrawModel()
	end
end


