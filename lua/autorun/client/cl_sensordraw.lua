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
	
	--[[
	if ply:GetActiveWeapon() ~= NULL and ply:GetActiveWeapon():GetClass() == "weapon_ex_combinesniper" then
	
		local Trace = ply:GetEyeTrace()
	
		local StartPos = ply:GetEyeTrace().StartPos
		local EndPos =  ply:GetEyeTrace().HitPos
	
		cam.Start3D2D( Vector(0,0,0), Angle(0,0,0), 1 )
		
			surface.SetDrawColor( Color( 255, 165, 0, 255 ) )
			surface.DrawRect( 0, 0, 8, 8 )
			render.DrawLine( StartPos, EndPos, Color( 100, 149, 237, 255 ), true )
			
		cam.End3D2D()

	end
	--]]

end

hook.Add("PostPlayerDraw","Sensor Drawer",SensorHandleDrawing)