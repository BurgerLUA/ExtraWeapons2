function BurgerShield_ScalePlayerDamage(ply,hitgroup,dmginfo)

	--[[
	local Damage = dmginfo:GetDamage()
	local Armor = ply:Armor()
	
	local Scale = 1

	if Armor > 0 then
		if Damage >= 50 and hitgroup == HITGROUP_HEAD then
			ply:SetArmor(0)
			dmginfo:ScaleDamage(5)
		end
	end
	
	
	ply.AR_RechargeTime = CurTime() + 10
	--]]
end

hook.Add("ScalePlayerDamage","BurgerShield_ScalePlayerDamage",BurgerShield_ScalePlayerDamage)

local NextArmorThink = 0
local NextHealthThink = 0

function BurgerShield_Think()
	
	--[[
	if NextArmorThink <= CurTime() then
	
		for k,v in pairs(player.GetAll()) do
			if v:Alive() then
				if not v.AR_RechargeTime then
					v.AR_RechargeTime = 0
				elseif v.AR_RechargeTime <= CurTime() then
					v:SetArmor(math.Clamp(v:Armor() + 1,0,100))
				end
			end
		end
		
		NextArmorThink = CurTime() + 0.1
		
	end
	--]]
	
	if NextHealthThink <= CurTime() then
		
		for k,v in pairs(player.GetAll()) do
			if v:Alive() then
				if v:HasWeapon("weapon_bur_medkit") then
					if v:GetAmmoCount("medical") < 100 then
						v:GiveAmmo(1,"medical", true )
					end
				end
			end
		end
		
		NextHealthThink = CurTime() + 3

	end
	
	


end

hook.Add("Think","BurgerShield_Think",BurgerShield_Think)