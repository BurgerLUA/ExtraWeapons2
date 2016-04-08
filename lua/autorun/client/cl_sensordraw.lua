local Mat = Material("sprites/bomb_planted_ring")

local Beam = Material("trails/laser")

function SensorHandleDrawing()

	for k,ply in pairs(player.GetAll()) do
	
		if not IsValid(ply) then return end
		if not ply:Alive() then return end
		
		if not (not ply:ShouldDrawLocalPlayer() and LocalPlayer() == ply) then

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
			
			local Weapon = ply:GetActiveWeapon()
			
			if Weapon ~= NULL and Weapon:GetClass() == "weapon_ex_combinesniper" then
			
				local Trace = ply:GetEyeTrace()
			
				local StartPos = ply:GetEyeTrace().StartPos
				local EndPos =  ply:GetEyeTrace().HitPos
				
				--PrintTable(Weapon:GetAttachments())
				
				local MuzzleAttachment = Weapon:LookupAttachment( "laser" )
				local MuzzlePos = Weapon:GetAttachment(MuzzleAttachment).Pos
			
				render.SetMaterial(Beam)
				render.DrawBeam(MuzzlePos,EndPos,2,0,1,Color(0,255,255,255))

			end
		end
	
	end
	

end

hook.Add("PostDrawTranslucentRenderables","Sensor Drawer",SensorHandleDrawing)