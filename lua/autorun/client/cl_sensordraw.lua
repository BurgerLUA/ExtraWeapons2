local DrawMaterial = "burger/ignorez"

function SensorHandleDrawing(ply)

	if not IsValid(ply) then return end
	if not ply:Alive() then return end
	
	local IsInSensor = false
	
	for k,v in pairs(ents.FindByClass("ent_bur_sensor")) do
	
		local Distance = ply:GetPos():Distance(v:GetPos())
		local EntSpeed = v:GetVelocity():Length()
		local PlySpeed = ply:GetVelocity():Length()
		
		if Distance <= 256 and EntSpeed < 1 and PlySpeed > 1 then
			IsInSensor = true
		end
		
	end
	
	if IsInSensor == true then
		ply:SetSubMaterial(0,DrawMaterial)
	elseif IsInSensor == false then
		ply:SetSubMaterial(0,nil)
	end

end

hook.Add("PostPlayerDraw","Sensor Drawer",SensorHandleDrawing)