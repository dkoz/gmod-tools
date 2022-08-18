--[[
	Simple Third-Person Script
	Type /thirdperson in-game toggles it on/off
--]]

DarkRP.declareChatCommand({
	command = "thirdperson",
	description = "Toggle third person on and off.",
	delay = 1.5
})

if( CLIENT ) then
	function ThirdPersonUmsg( data )
		if( LocalPlayer().ThirdPerson == nil ) then
			LocalPlayer().ThirdPerson = true
		else
			LocalPlayer().ThirdPerson = !LocalPlayer().ThirdPerson
		end
	end
	usermessage.Hook( "ThirdPerson", ThirdPersonUmsg )
	
	function ThirdPerson( ply, pos, ang, fov )
		if( LocalPlayer().ThirdPerson ) then
			local view = {}
			local dist = 100
			local trace = {}
			
			trace.start = pos
			trace.endpos = pos - ( ang:Forward() * dist )
			trace.filter = LocalPlayer()
			local trace = util.TraceLine( trace )
			if( trace.HitPos:Distance( pos ) < dist - 10 ) then
				dist = trace.HitPos:Distance( pos ) - 10
			end
			view.origin = pos - ( ang:Forward() * dist )
			view.angles = ang
			view.fov = fov
			
			return view
		end
	end
	hook.Add( "CalcView", "ThirdPerson", ThirdPerson )
	
	function ThirdPersonSDLP()
		if( LocalPlayer().ThirdPerson ) then
			return true
		end
	end
	hook.Add( "ShouldDrawLocalPlayer", "ThirdPersonSDLP", ThirdPersonSDLP )
	
	else
	
	function ToggleTP( ply, args )
		local DoSay = function( text )
			umsg.Start( "ThirdPerson", ply )
			umsg.End()
		end
		return args, DoSay
	end
	DarkRP.defineChatCommand( "thirdperson", ToggleTP )
end