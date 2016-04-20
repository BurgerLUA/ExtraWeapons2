SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "SENSOR LAUNCHER"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Primary"

SWEP.Cost					= 2000
SWEP.MoveSpeed				= 200

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 2
SWEP.SlotPos				= 2

SWEP.ViewModel				= "models/weapons/c_shotgun.mdl"
SWEP.WorldModel				= "models/weapons/w_shotgun.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "shotgun"

SWEP.Primary.Damage			= 100
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/ar2/npc_ar2_altfire.wav")
SWEP.Primary.Cone			= 0.01
SWEP.Primary.ClipSize		= 1
SWEP.Primary.SpareClip		= 2
SWEP.Primary.Delay			= 0.25
SWEP.Primary.Ammo			= "Thumper"
SWEP.Primary.Automatic 		= false

SWEP.ReloadSound = Sound("weapons/shotgun/shotgun_reload3.wav")

SWEP.RecoilMul				= 1
SWEP.VelConeMul				= 2

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 8
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= true

SWEP.HasPumpAction 			= true
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false

SWEP.IsReloading = false
SWEP.ReloadDelay = 0

SWEP.HasHL2Pump				= true

SWEP.Object					= "ent_bur_sensor"

SWEP.PumpSound				= Sound("weapons/shotgun/shotgun_cock.wav")

game.AddAmmoType({
	name = "bur_sensor",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ
})

if CLIENT then
	language.Add("bur_sensor_ammo","Wall Sensor")
end

function SWEP:PrimaryAttack()

	if self:GetIsReloading() then
		if self:GetIsShotgunReload() then
			self:FinishShotgunReload()
		else
			--self:CancelReload()
		end
	end

	if not self:CanPrimaryAttack() then	return end
	if not self:CanShoot() then return end
	self:TakePrimaryAmmo(1)

	self:WeaponSound()
	self:WeaponDelay() -- don't predict, has delay
	self:AfterPump() -- don't predict, has animations
	self:WeaponAnimation(self:Clip1(),ACT_VM_PRIMARYATTACK)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	if (IsFirstTimePredicted() or game.SinglePlayer()) then
			
		if SERVER then
			local Shoot = self.Owner:GetShootPos()
			local Eye= self.Owner:EyeAngles()
			self:ThrowObject(self.Object,4000)
		end

		if (CLIENT or game.SinglePlayer()) then 
			self:AddRecoil() -- Predict
		end

	end

end

function SWEP:ThrowObject(object,force)

	if (CLIENT) then return end
	local EA =  self.Owner:EyeAngles()
	local pos = self.Owner:GetShootPos() + EA:Right() * 2 - EA:Up() * 4 + EA:Forward() * 10	

	local ent = ents.Create(object)		
	ent:SetPos(pos)
	ent:SetAngles(EA)
	ent:Spawn()
	ent:Activate()
	ent:Fire()
	ent:SetOwner(self.Owner)
	ent.RealOwner = self.Owner
	
	if ent:GetPhysicsObject():IsValid() then
		ent:GetPhysicsObject():SetVelocity(self.Owner:GetVelocity() + EA:Forward() * force + EA:Up()*50)
	end
	
	ent.Damage = 100
	ent.Radius = 100
	
end