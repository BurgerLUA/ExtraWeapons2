if CLIENT then
	killicon.Add( "weapon_ex_nes",		"vgui/killicons/ew2_NESzapper",	Color( 255, 255, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_NESzapper")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "NES ZAPPER"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Secondary"

SWEP.FuckBots				= true

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_pist_nesz.mdl"
SWEP.WorldModel				= "models/weapons/w_pist_nesz.mdl"
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "revolver"

game.AddAmmoType({
	name = "ex_childhood",
	dmgtype = DMG_DISSOLVE,
	tracer = TRACER_LINE_AND_WHIZ
})

if CLIENT then 
	language.Add("ex_childhood","NES Charge")
end

SWEP.Primary.Damage			= 100
SWEP.Primary.NumShots 		= 1
SWEP.Primary.Sound			= Sound("weapons/NESZapper/NESZap1.wav")
SWEP.Primary.Cone			= 0.0025
SWEP.Primary.ClipSize		= -1
SWEP.Primary.SpareClip		= 6
SWEP.Primary.Delay			= 0.1
SWEP.Primary.Ammo			= "ex_childhood"
SWEP.Primary.Automatic 		= false

SWEP.RecoilMul				= 0.25
SWEP.SideRecoilMul			= 0.1
SWEP.VelConeMul				= 0.5
SWEP.HeatMul				= 1

SWEP.ReloadSound			= Sound("weapons/NESZapper/NESKill.wav")

SWEP.HasScope 				= false
SWEP.ZoomAmount 			= 0.5
SWEP.HasCrosshair 			= true
SWEP.HasCSSZoom 			= false

SWEP.HasPumpAction 			= false
SWEP.HasBoltAction 			= false
SWEP.HasBurstFire 			= false
SWEP.HasSilencer 			= false
SWEP.HasDoubleZoom			= false
SWEP.HasSideRecoil			= true
SWEP.HasDownRecoil			= false
SWEP.HasDryFire				= false

SWEP.HasIronSights 			= true
SWEP.EnableIronCross		= true
SWEP.HasGoodSights			= true
SWEP.IronSightTime			= 0.25
SWEP.IronSightsPos 			= Vector(4, 5, 1)
SWEP.IronSightsAng 			= Vector(0, 0, 0)

SWEP.DamageFalloff			= 5000

function SWEP:SpareThink()

	local WeaponAmmo = self:Ammo1()

	if self:Ammo1() > 1 then
		self.Owner:SetAmmo(1,self:GetPrimaryAmmoType())
	end

end

function ExtraWeapons_PlayerDeath(victim,inflictor,attacker)

	if victim ~= attacker then
	
		if attacker and attacker:IsPlayer() and attacker:Alive() then
			local Weapon = attacker:GetActiveWeapon()
			
			if Weapon and Weapon:IsValid() and Weapon:GetClass() == "weapon_ex_nes" then
			
				victim:EmitSound("weapons/NESZapper/NESHit1.wav")
				attacker:EmitSound("weapons/NESZapper/NESHit1.wav")
				
				timer.Simple(2, function()
					if Weapon and Weapon:IsValid() then
				
						attacker:EmitSound("weapons/NESZapper/NESKill.wav")
				
						attacker:SetAmmo(1,Weapon:GetPrimaryAmmoType())
					end
				end)

			end
		end
		
	end

end

hook.Add("PlayerDeath","ExtraWeapons_PlayerDeath",ExtraWeapons_PlayerDeath)

