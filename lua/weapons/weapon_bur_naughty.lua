SWEP.PrintName			= "DILDUS LAUNCHER"			
SWEP.Author				= "Burger"
SWEP.Instructions		= ""
SWEP.HoldType = "rpg"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Weight			= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.Category				= "Extra Weapons"

SWEP.Slot				= 4
SWEP.SlotPos			= 1
SWEP.DrawAmmo			= true
SWEP.DrawCrosshair		= true

SWEP.ViewModel			= "models/weapons/v_rpg.mdl"
SWEP.WorldModel			= "models/weapons/w_rocket_launcher.mdl"

game.AddAmmoType({name = "bur_dildoair", })

if CLIENT then
	language.Add("bur_dildoair_ammo","Air")
end

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= 100
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "bur_dildoair"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

if CLIENT then
	killicon.Add("ent_bur_naughty", "vgui/killicons/dilduslauncher", Color(255,255,255,255) )
	killicon.Add("weapon_bur_naughty", "vgui/killicons/dilduslauncher", Color(255,255,255,255) )
end

function SWEP:Initialize()
	self.ToggleSound = 1
	self.ClickSound = 1
	self.ReloadingTime = 0
	self.CoolDown = CurTime() + 1
end

function SWEP:Deploy()
	self.loopingsound = CreateSound(self.Owner, "ambient/machines/gas_loop_1.wav" )
	self.ToggleSound = 1
	self.ClickSound = 1
	self.ReloadingTime = 0
	self.CoolDown = CurTime() + 1
	return true
end

function SWEP:Holster()
	if SERVER then
		self.loopingsound:Stop()
	end
	return true
end

function SWEP:PrimaryAttack()

	if self.Owner:GetAmmoCount(self.Primary.Ammo) - self.TakeCount < 0 then return end

	if self.Owner:GetAmmoCount(self.Primary.Ammo) > 100 then 
		self:TakePrimaryAmmo(self.Owner:GetAmmoCount(self.Primary.Ammo) - 100)
	end

	self:TakePrimaryAmmo(self.TakeCount)
	self.CoolDown = CurTime() + 1

	
	self.FireCount = 20 - self.Owner:GetAmmoCount(self.Primary.Ammo)/5
	
	
	
	
	self.ShotAngle = Angle( -1, math.random(-1,1), 0 )
	self.Owner:ViewPunch( self.ShotAngle  )
	self.Weapon:EmitSound("garrysmod/balloon_pop_cute.wav",100-self.FireCount*2,50-self.FireCount*2)
	self.Owner:SetAnimation( PLAYER_ATTACK1 );
	self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	self.Weapon:SetNextPrimaryFire( CurTime() + 0.3 )	

	if SERVER then

		local ent = ents.Create( "ent_bur_naughty" )
		self.SpreadMul = 0.15
		EA =  self.Owner:EyeAngles() + Angle(math.Rand(1,-1),math.Rand(1,-1),0)*self.FireCount*self.SpreadMul
		pos = self.Owner:GetShootPos() + EA:Right() * 5 - EA:Up() * 4 + EA:Forward() * 8
		--pos = self.Owner:GetShootPos()
					
		ent:SetPos(pos)
		ent:SetAngles(EA + Angle(90,0,0))
		ent:Spawn()
		ent.Entity:SetDTInt( 0, 1 - (self.FireCount*0.04) )
		ent.Entity:SetDTInt( 1, 0 )
		ent:Activate()
		ent:SetOwner(self.Owner)
		ent:GetPhysicsObject():SetVelocity( self.Owner:GetVelocity() + EA:Forward() * (5500 - self.FireCount*250))
		--ent:GetPhysicsObject():AddAngleVelocity(Vector(0,0,-10000 + self.FireCount*500))
	end
		
end
 

function SWEP:SecondaryAttack()

	if self.Owner:GetAmmoCount(self.Primary.Ammo) < 25 then return end
	
	if self.Owner:GetAmmoCount(self.Primary.Ammo) > 100 then 
		self:TakePrimaryAmmo(self.Owner:GetAmmoCount(self.Primary.Ammo) - 100)
	end
	

	self.CoolDown = CurTime() + 3
	self.Owner:EmitSound("items/gift_drop.wav",100,100)
	if SERVER then
		self.Owner:SetVelocity(self.Owner:EyeAngles():Up()*self.Owner:GetAmmoCount(self.Primary.Ammo)*7)
	end
	self.Weapon:SetNextPrimaryFire( CurTime() + 1 )
	self.Weapon:SetNextSecondaryFire( CurTime() + 1 )
	self:TakePrimaryAmmo(100)
	
end


function SWEP:Reload()
end

function SWEP:Think()

	self.TakeCount = math.floor(math.Rand(3,5))
	
	if CLIENT then return end
	if self.ReloadingTime == nil then return end
	if self.ReloadingTime > CurTime() then return end
	if self.CoolDown > CurTime() then self.loopingsound:Stop() return end
	if self.Owner:GetAmmoCount(self.Primary.Ammo)+1 > 100 then
		if self.ClickSound == 0 then 
			self.Owner:EmitSound("weapons/slam/mine_mode.wav")
			self.loopingsound:Stop()
			self.ToggleSound = 1
			self.ClickSound = 1
		end
		return 
	end
	
	if self.ToggleSound == 1 then
		self.loopingsound:Play()
		self.ToggleSound = 0 
	end

	self.ReloadingTime = CurTime() + 0.04
	self.ClickSound = 0
	
	self.Owner:GiveAmmo(1,self.Primary.Ammo,true)

end