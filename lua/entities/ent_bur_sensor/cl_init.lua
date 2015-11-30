include("shared.lua")

function ENT:Initialize()

end

local NextThink = 0
local Mat = Material("sprites/bomb_planted_ring")

function ENT:Think()
	if self:GetVelocity():Length() < 1 then
		if NextThink <= CurTime() then
			EmitSound("common/stuck1.wav",self:GetPos(),self:EntIndex(),CHAN_AUTO,1,75,0,100)
			NextThink = CurTime() + 1
		end
	end
end

function ENT:Draw()	
	self:DrawModel()
end