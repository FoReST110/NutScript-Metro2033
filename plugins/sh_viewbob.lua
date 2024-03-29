PLUGIN.name = "ViewBob"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "1337 S0 DR4M4T1C"

PLUGIN.config = {}
PLUGIN.config.activated = true

if CLIENT then
	
	local curang = Angle( 0, 0, 0 )
	local curvec = Vector( 0, 0, 0 )
	local tarang = Angle( 0, 0, 0 )
	local tarvec = Vector( 0, 0, 0 )
	local apprate = .1
	
	function PLUGIN:CalcView( ply, pos, ang, fov )
	
		local ft = FrameTime()
		local vel = math.floor( ply:GetVelocity():Length()-1 )
		local runspeed = ply:GetRunSpeed()
		local walkspeed = ply:GetWalkSpeed()
		local v = {}		
		if 
			( ply:IsValid() &&
			ply:Alive() &&
			ply.character &&
			!ply:ShouldDrawLocalPlayer() &&
			!ply:GetOverrideSeq()  &&
			(
				!ply:GetNetVar("ragdoll" )  ||
				ply:GetNetVar("ragdoll" ) == 0
			)	
			)
		then
			if ply:OnGround() then
				if vel > walkspeed+5 then
					local perc = vel/runspeed*10
					perc = math.Clamp( perc, .5, 6 )
					tarang = Angle( math.abs( math.cos( RealTime()*(runspeed/40) ) * 1.5 * perc ) - perc*1, math.sin( RealTime()*(runspeed/40) ) * .2 * perc, 0 )
					tarvec = Vector( 0, 0, math.sin( RealTime()*(runspeed/30) ) * .4 * perc )
				else
					local perc = vel/walkspeed*40
					perc = math.Clamp( perc/30, .5, 4 )
					tarang = Angle( math.cos( RealTime()*4 ) * .3 * perc, 0, 0 )
					tarvec = Vector( 0, 0, math.sin( RealTime()*3 ) * .3 * perc )
				end
			else
				if ply:WaterLevel() >= 2 then
					tarvec = Vector( 0, 0, 0 )
					tarang = Angle( 0, 0, 0 )
				else	
					local vel = math.abs( ply:GetVelocity().z )
					local af = 0
					perc = math.Clamp( vel/200, .1, 8 )
					if perc > 1 then
						af = perc
					end
					tarang = Angle( math.cos( RealTime()*15 ) * 2 * perc + math.Rand( -af*2, af*2 ), math.sin( RealTime()*15 ) * 2 * perc + math.Rand( -af*2, af*2 ) ,math.Rand( -af*5, af*5 )  )
					tarvec = Vector( math.cos( RealTime()*15 ) * .5 * perc , math.sin( RealTime()*15 ) * .5 * perc, 0 )
				end
			end
		
			curang = LerpAngle( ft * 2, curang, tarang )
			curvec = LerpVector( ft * 2, curvec, tarvec )
			
			v.angles = ang + curang
			v.origin = pos + curvec
			v.fov = fov
			
			return GAMEMODE:CalcView(ply, v.origin, v.angles, v.fov)
			
		end
		
	end
	
end