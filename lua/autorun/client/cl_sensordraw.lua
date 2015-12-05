local Mat = Material("sprites/bomb_planted_ring")

function SensorHandleDrawing(ply)

	if not IsValid(ply) then return end
	if not ply:Alive() then return end
	
	local IsInSensor = false
	
	for k,v in pairs(ents.FindByClass("ent_bur_sensor")) do
		local Distance = ply:GetPos():Distance(v:GetPos())
		local EntSpeed = v:GetVelocity():Length()
		local PlySpeed = ply:GetVelocity():Length()
		if Distance <= 200 and EntSpeed < 1 and PlySpeed > 1 then
			IsInSensor = true
		end
	end
	
	if IsInSensor == true then
		local Pos = ply:GetPos() + (ply:OBBCenter()*1.2)
		render.SetMaterial(Mat)
		render.DrawSprite(Pos,ply:OBBMaxs().z*1.2,ply:OBBMaxs().z*1.2, Color(255,0,0,255))
	end

end

hook.Add("PostPlayerDraw","Sensor Drawer",SensorHandleDrawing)