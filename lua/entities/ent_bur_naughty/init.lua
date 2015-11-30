AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self.YeahTest = true
	self:SetModel("models/misc/dildo.mdl") 
	self:PhysicsInit(SOLID_VPHYSICS)
	--self:SetModelScale(0.5)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCustomCollisionCheck( true )
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	--self:PhysicsInit( SOLID_NONE )
	self.EnableTrace = 0
	local phys = self:GetPhysicsObject()

	if phys and phys:IsValid() then
		phys:Wake()
		phys:SetMass(1)
		phys:EnableDrag(false)
		phys:EnableGravity(false)
		phys:AddGameFlag(FVPHYSICS_NO_IMPACT_DMG)
		phys:AddGameFlag(FVPHYSICS_NO_NPC_IMPACT_DMG)
		phys:AddGameFlag(FVPHYSICS_DMG_DISSOLVE)
		--phys:AddGameFlag(FVPHYSICS_NO_SELF_COLLISIONS)
	end
	
	self:GetPhysicsObject():SetBuoyancyRatio(0)
	self.FallTime = CurTime() + self:GetDTInt(0)
	
	--spd = physenv.GetPerformanceSettings()
   -- spd.MaxVelocity = 2992
	
    --physenv.SetPerformanceSettings(spd)
end

function ENT:Use(activator, caller)
	return false
end

function ENT:OnRemove()
	return false
end 


function ENT:PhysicsCollide(data, physobj)

	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	
	physobj:EnableDrag(true)
	physobj:EnableGravity(true)
	
	self.HitP = data.HitPos + self.Entity:GetUp()
	self.HitN = data.HitNormal

	if data.HitEntity:IsValid() and data.Speed > 1000 then 

		if data.HitEntity:GetClass() == "func_breakable_surf" then
			data.HitEntity:Fire("Break")
		end
		
		local Damage = (20+(data.OurOldVelocity:Length()/200)^1.5)*0.4
		
		if data.HitEntity:Health() >= 1 then
			if data.HitEntity:IsPlayer() then 
				if not (data.HitEntity:Team() == self.Owner:Team() and self.Owner:Team() ~= 1001) then
				
					self:EmitSound("misc/rubberglove_snap.wav",100,100)
					
					if data.HitEntity:Health() <= Damage then
						data.HitEntity:TakeDamage( 1000000, self.Owner, self.Entity )
						data.HitEntity:EmitSound("weapons/rainblower/rainblower_start.wav")
						data.HitEntity:EmitSound("vo/npc/alyx/uggh02.wav")
						
						for i=1, 10 do 
							local Coloured = ents.Create("ent_bur_naughty")
							local RandomColor = Color(math.Rand(0,255),math.Rand(0,255),math.Rand(0,255))
							local Trail = util.SpriteTrail(Coloured, 0, RandomColor, true, 30, 0, 1, 1/(15+1)*0.5, "trails/laser.vmt")
							
							Coloured:SetPos(self.HitP + Vector(math.random(-1,1),math.random(-1,1),math.random(-1,1))*10)
							Coloured:SetAngles(data.HitNormal:Angle() + Angle(180,0,0))
							Coloured:Spawn()
							Coloured:GetPhysicsObject():EnableDrag(false)
							Coloured:GetPhysicsObject():EnableGravity(false)
							Coloured:Activate()
							Coloured:SetOwner(self.Owner)
							Coloured:SetMaterial("models/shiny")
							Coloured:SetColor(self.RandColor)
							Coloured:GetPhysicsObject():SetVelocity(Vector(math.random(-1,1),math.random(-1,1),math.random(-1,1))*800)
							Coloured:GetPhysicsObject():AddAngleVelocity(Vector(-1000,-1000,-1000))
						end
						
					else
						data.HitEntity:TakeDamage( Damage, self.Owner, self.Entity )
						local CumEnt = ents.Create("ent_cum")
						constraint.NoCollide( CumEnt, data.HitEntity, 0, 0 )
						CumEnt:SetPos(data.HitEntity:GetPos() + Vector(0,0,30) + data.HitEntity:GetForward()*4)
						CumEnt:SetAngles(self:GetAngles())
						CumEnt:SetOwner(data.HitEntity)
						CumEnt:Spawn();
						CumEnt.trail = util.SpriteTrail(CumEnt, 0, Color(255,255,255), true, math.random(4,5), 0, 0.05 * math.random(1,3), 1/(15+1)*0.5, "sprites/physbeama.vmt")
						CumEnt.phys = CumEnt:GetPhysicsObject();
						CumEnt.phys:ApplyForceCenter( data.HitEntity:GetAimVector():GetNormalized() * 400 + data.HitEntity:GetVelocity( ):Length() * data.HitEntity:GetForward());
						CumEnt.phys:AddAngleVelocity(Vector(0,2,0))
					end
				end
			else
				data.HitEntity:TakeDamage( Damage, self.Owner, self.Entity )
			end
		end

		local Pent = ents.Create( "ent_bur_naughty" )
		Pent:SetPos(self.HitP + self.HitN*10)
		Pent:SetAngles(data.HitNormal:Angle() + Angle(180,0,0))
		Pent:Spawn()
		Pent:Activate()
		Pent:SetOwner(self.Owner)
		Pent:GetPhysicsObject():SetVelocity(data.OurOldVelocity)

	end	
	
	if data.HitEntity:GetClass() == "worldspawn" && data.Speed > 2000 then

		physobj:EnableMotion(false)
		physobj:SetPos(data.HitPos - data.HitNormal*5)
		physobj:SetAngles(data.HitNormal:Angle()+Angle(90,0,0))
	
		local Data = EffectData()
		Data:SetStart( self:GetPos() - self:GetRight() ) // not sure if we need a start and origin (endpoint) for this effect, but whatever
		Data:SetOrigin( self:GetPos() - self:GetRight()*6 )
		Data:SetScale( 1 )
		for o = 1, 10 do
			util.Effect( "GlassImpact", Data )	
		end
		
		util.Decal("ExplosiveGunshot", self.HitP + self.HitN, self.HitP - self.HitN)
		
		self:EmitSound("Concrete_Block.ImpactHard")
		
	elseif data.Speed > 500 then
		self:EmitSound("physics/body/body_medium_impact_hard3.wav")
	end
	
	SafeRemoveEntityDelayed(self,5)
	
end


function ENT:Think()
	local phys = self:GetPhysicsObject()

	if self.FallTime <= CurTime() and phys:IsValid() and self.YeahTest==true then
		phys:EnableGravity(true)
		self.YeahTest = false
	end
	
end
