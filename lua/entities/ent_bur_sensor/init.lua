AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/Items/AR2_Grenade.mdl") 
	self:PhysicsInit(SOLID_VPHYSICS)
	--self:SetModelScale(0.5)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	self.EnableTrace = 0
	local phys = self:GetPhysicsObject()

	if phys and phys:IsValid() then
		phys:Wake()
		phys:AddGameFlag(FVPHYSICS_NO_IMPACT_DMG)
		phys:AddGameFlag(FVPHYSICS_NO_NPC_IMPACT_DMG)
		phys:AddGameFlag(FVPHYSICS_PENETRATING)
		--phys:AddGameFlag(FVPHYSICS_DMG_SLICE)
		phys:EnableDrag(false)
		phys:EnableGravity(false)
		phys:SetVelocity(self:GetForward() * 9000 * phys:GetMass())
	end
	
	self.Hit = 0
	
	self.Sound1PlayTime = 0
	self.Sound1HasPlayed = true
		
	self.Sound2PlayTime = 0
	self.Sound2HasPlayed = true
	
	
	self:GetPhysicsObject():SetBuoyancyRatio(0)
	self.ArmTime = CurTime() + 0.2
	
	self.target = nil
	
	

	
end

function ENT:Use(activator, caller)
	return false
end

function ENT:OnRemove()
	return false
end 

local vel, len, pos, owner

function ENT:PhysicsCollide(data, physobj)

	if self.Hit == 1 then return end
	
	if data.HitEntity:Health() > 0 and data.Speed > 500 then 
		data.HitEntity:TakeDamage( 100, self.Owner, self.Entity )
	end	

	self.HitP = data.HitPos + self.Entity:GetUp()
	self.HitN = data.HitNormal
	
	self:SetNWVector( self.EntIndex().."HITP", self.HitP)
	self:SetNWVector( self.EntIndex().."HITN", self.HitN)

	if data.HitEntity:GetClass() == "worldspawn" && data.Speed > 2000 then
	
		self.Hit = 1
		physobj:EnableCollisions( false )

		physobj:EnableMotion(false)
		physobj:SetPos(data.HitPos + data.HitNormal)
		physobj:SetAngles(data.HitNormal:Angle()+Angle(0,0,0))
		self:EmitSound("Concrete_Block.ImpactHard")
			
		self.effectdata = EffectData()
		self.effectdata:SetStart( self:GetPos() - self:GetRight() ) // not sure if we need a start and origin (endpoint) for this effect, but whatever
		self.effectdata:SetOrigin( self:GetPos() - self:GetRight()*6 )
		self.effectdata:SetScale( 1 )
		
		for i = 1, 25 do
			util.Effect( "GlassImpact", self.effectdata )	
		end
			
			
		self.Pos1 = self.HitP + self.HitN
		self.Pos2 = self.HitP - self.HitN
		util.Decal("ExplosiveGunshot", self.Pos1, self.Pos2)

		self.Sound1PlayTime = CurTime() + 3
		self.Sound1HasPlayed = false
		
		self.Sound2PlayTime = CurTime() + 4.25
		self.Sound2HasPlayed = false
		
		timer.Simple(4.25, function()
			if not self:IsValid() then return end
			self.EnableTrace = 1
		end)
		
			
	elseif data.Speed > 500 then
		self:EmitSound("Missile.ShotDown")
		SafeRemoveEntityDelayed(self,5)
	end
	
end


function ENT:Think()

	if self.Sound1HasPlayed == false then
		if self.Sound1PlayTime < CurTime() then
			self.Entity:EmitSound("npc/ministrider/ministrider_preflechette.wav",100,100)
			self.Sound1HasPlayed = true
		end
	end

	if self.Sound2HasPlayed == false then
		if self.Sound2PlayTime < CurTime() then
			self.Entity:EmitSound("npc/roller/remote_yes.wav",100,100)
			self.Sound2HasPlayed = true
		end	
	end
	
	if SERVER then
		if self.EnableTrace == 0 then
			self:GetPhysicsObject():ApplyForceCenter(Vector(0,0,-50))
		end
	end
	
	if self.EnableTrace == 1 then
	
		self:SetNWBool( "Enable", true)
		
		self.tracedata = {}
		self.tracedata.start = self.HitP
		self.tracedata.endpos = self.HitP - (self.HitN*10000)
		self.tracedata.filter = self
		self.trace = util.TraceLine(self.tracedata)
		
		self:SetNWVector( self.EntIndex().."HITTD", self.trace.HitPos)
		
		if self.trace.HitNonWorld then
		
			self.target = self.trace.Entity
			self.target:TakeDamage( 5, self.Owner, self )
			self.target:EmitSound("npc/ministrider/flechette_flesh_impact3.wav")
			
			self:EmitSound("ambient/alarms/klaxon1.wav")
			self:SetNWBool( "Enable", false)	
			self.EnableTrace = 0
			
			self.target:SetMaterial( "burger/ignorez" )
			self.TIndex = self.target:EntIndex()
			
			SafeRemoveEntityDelayed(self,10)

		end
		
	end
	
	if self.target then

		if self.target:IsValid() then
		
			if self.target:IsPlayer() then
				if not self.target:Alive() then 
					SafeRemoveEntity(self)
				end	
			end
			
		else
			SafeRemoveEntity(self)
		end
		
	end
	
end

function ENT:OnRemove()
	
	if self.target then
		if self.target:IsValid() then
			self.target:SetMaterial("")
		end
	end
	
end

