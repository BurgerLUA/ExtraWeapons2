include("shared.lua")

function ENT:Initialize()

end

local NextThink = 0
local Mat = Material("sprites/bomb_planted_ring")

function ENT:Think()
	if self:GetVelocity():Length() < 0.01 then
		render.SetMaterial(Mat)
		render.DrawSprite(self:GetPos(),5,5, Color(255,0,0,255))
	end
end

function ENT:Draw()	
	self:DrawModel()
end