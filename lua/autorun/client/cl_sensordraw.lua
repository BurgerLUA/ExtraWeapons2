local DrawMaterial = "burger/ignorez"

function SensorHandleDrawing(ply)
	
	--print("test")

	if not IsValid(ply) then return end
	--if not ply == LocalPlayer() then return end
	if not ply:Alive() then return end

	
	local IsInSensor = false

	--print("test")
	
	for k,v in pairs(ents.FindByClass("ent_bur_sensor")) do

		local Distance = ply:GetPos():Distance(v:GetPos())
		local EntSpeed = v:GetVelocity():Length()
		local PlySpeed = ply:GetVelocity():Length()
		
		if Distance <= 256 and EntSpeed < 1 and PlySpeed > 1 then
			IsInSensor = true
		end

	end
	
	--PrintTable(ply:GetMaterials())
	
	if IsInSensor == true and ply:GetMaterial() ~= DrawMaterial then
		--ply:DrawModel()
		ply:SetMaterial(DrawMaterial)
		--print(ply:Nick(), "In Sensor")
		
	else--if ply:GetMaterial() == DrawMaterial then
		ply:SetMaterial("")
		--print("BAD")
	end

	
	
end

hook.Add("PostPlayerDraw","Sensor Drawer",SensorHandleDrawing)