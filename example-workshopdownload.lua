--[[
	Forces people to install all addons from your workshop collection
--]]
if (SERVER) then
	for k, v in pairs( engine.GetAddons() ) do
		if v.mounted then
			resource.AddWorkshop(v.wsid)
			print("\t[+] "..v.wsid..": "..v.title)		
		end
	end
end