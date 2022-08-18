-- Configuration for tags
local Tags = 
{
	{"ulx rank", "Chat Prefix", Color(255, 255, 255, 255) }, -- Example
	{"superadmin", "Owner", Color(200, 0, 0, 255) },
	{"admin", "Admin", Color(255, 255, 255, 255) },
	{"vip", "VIP", Color(0, 220, 0, 255) },
}

-- Do not edit below this line.
hook.Add("OnPlayerChat", "Tags", function(ply, Text, Team, PlayerIsDead)
	if ply:IsValid() then
		for k,v in pairs(Tags) do
			if ply:IsUserGroup(v[1]) then
				if Team then
						if ply:Alive() then
							chat.AddText(Color(0, 204, 0, 255), "{TEAM} [", v[3], v[2], Color(50, 50, 50, 255), "] ", v[3], ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), Text)
						else
							chat.AddText(Color(50, 50, 50, 255), "*DEAD*", Color(0, 204, 0, 255), "{TEAM} [", v[3], v[2], Color(50, 50, 50, 255), "] ", v[3], ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), Text)
						end
						return true
				end
				if ply:IsPlayer() then
					if ply:Alive() then
						chat.AddText(Color(50, 50, 50, 255), "[", v[3], v[2], Color(50, 50, 50, 255), "] ", v[3], ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), Text)
						return true
					elseif !ply:Alive() then
						chat.AddText(Color(50, 50, 50, 255), "*DEAD* [", v[3], v[2], Color(50, 50, 50, 255), "] ", v[3], ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), Text)
						return true
					end
				end
			end
		end
	end
end)