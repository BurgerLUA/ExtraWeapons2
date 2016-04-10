SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "SENSOR LAUNCHER"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Free"

SWEP.Cost					= 2000
SWEP.MoveSpeed				= 200

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 4
SWEP.SlotPos				= 2

SWEP.ViewModel				= "models/weapons/c_shotgun.mdl"
SWEP.WorldModel				= "models/weapons/w_shotgun.mdl"
SWEP.VModelFlip 			= false
SWEP.HoldType				= "shotgun"

SWEP.Primary.Damage			= 100
SWEP.Primary.NumShots		= 1
SWEP.Primary.Sound			= Sound("weapons/ar2/npc_ar2_altfire.wav")
SWEP.Primary.Cone			= 0.01
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 2
SWEP.Primary.Delay			= 2
SWEP.Primary.Ammo			= "Thumper"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 1
SWEP.VelConeMul				= 2

SWEP.HasScope 				= true
SWEP.ZoomAmount 			= 8
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= true

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= false

SWEP.IsReloading = false
SWEP.ReloadDelay = 0

game.AddAmmoType({
	name = "bur_sensor",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ
})

if CLIENT then
	language.Add("bur_sensor_ammo","Wall Sensor")
end

function SWEP:PrimaryAttack()	

	if self:Ammo1() <= 0 then return end
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self:TakePrimaryAmmo(1)
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:EmitSound(self.Primary.Sound, 100, 100)
	
	if SERVER then
		local nade = ents.Create("ent_bur_sensor")
		EA =  self.Owner:EyeAngles()
		pos = self.Owner:GetShootPos()
		pos = pos - EA:Up() * 4 + EA:Forward() * 8
					
		local HandleCone = self:HandleCone(self.Primary.Cone)				
		local ConeMod01 = HandleCone * math.Rand(-1,1) * 45
		local ConeMod02 = HandleCone * math.Rand(-1,1) * 45

		nade:SetPos(pos)
		nade:SetAngles(EA + Angle(ConeMod01,ConeMod02,0) )
		nade:Spawn()
		nade.RealOwner = self.Owner
		--nade:SetOwner(self.Owner)

	end
	
end


