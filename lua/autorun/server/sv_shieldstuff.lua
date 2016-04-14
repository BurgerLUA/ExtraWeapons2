

local NextArmorThink = 0
local NextHealthThink = 0

function BurgerShield_Think()
	--[[
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
	--]]
end

hook.Add("Think","BurgerShield_Think",BurgerShield_Think)
