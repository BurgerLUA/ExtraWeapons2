

local NextArmorThink = 0
local NextHealthThink = 0

function BurgerShield_Think()
	
	if NextHealthThink <= CurTime() then
		
		for k,v in pairs(player.GetAll()) do
			if v:Alive() then
				if v:HasWeapon("weapon_bur_medkit") then
					if v:GetAmmoCount("medical") < 100 then
						v:GiveAmmo(1,"medical", true )
					elseif v:GetAmmoCount("medical") > 100 then
						v:SetAmmo( math.max(100,v:GetAmmoCount("medical")-10), "medical" )
					end
				end
			end
		end
		
		NextHealthThink = CurTime() + 3

	end
	
end

hook.Add("Think","BurgerShield_Think",BurgerShield_Think)


function ExtraWeapons_PlayerDeath(victim,inflictor,attacker)

	if victim ~= attacker then
		

		local Weapon = attacker:GetActiveWeapon()
		
		if Weapon and Weapon:IsValid() and Weapon:GetClass() == "weapon_ex_nes" then
		
			victim:EmitSound("weapons/NESZapper/NESHit1.wav")
			attacker:EmitSound("weapons/NESZapper/NESHit1.wav")
			
			timer.Simple(2, function()
				if Weapon and Weapon:IsValid() then
			
					attacker:EmitSound("weapons/NESZapper/NESKill.wav")
			
					attacker:SetAmmo(3,Weapon:GetPrimaryAmmoType())
				end
			end)

		end
		
	end

end

hook.Add("PlayerDeath","ExtraWeapons_PlayerDeath",ExtraWeapons_PlayerDeath)
