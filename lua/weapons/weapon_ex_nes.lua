if CLIENT then
	killicon.Add( "weapon_ex_nes",		"vgui/killicons/ew2_NESzapper",	Color( 255, 255, 255, 255 ) )
	SWEP.WepSelectIcon 		= surface.GetTextureID("vgui/killicons/ew2_NESzapper")
end

SWEP.Category				= "Extra Weapons"
SWEP.PrintName				= "CHILDHOOD NES ZAPPER"
SWEP.Base					= "weapon_cs_base"
SWEP.WeaponType				= "Secondary"

SWEP.Spawnable				= true
SWEP.AdminOnly				= false

SWEP.Slot					= 1
SWEP.SlotPos				= 1

SWEP.ViewModel 				= "models/weapons/v_pist_nesz.mdl"
SWEP.WorldModel				= "models/weapons/w_pist_nesz.mdl"
SWEP.ViewModelFlip 			= true
SWEP.HoldType				= "revolver"

game.AddAmmoType({name = "ex_childhood"})

if CLIENT then 
	language.Add("ex_childhood_ammo","NOSTALGIA BULLET")
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

	if self:Ammo1() > 3 then
		self.Owner:SetAmmo(3,self:GetPrimaryAmmoType())
	end

end

