jobz = {}

-- Table for allowed ranks.
jobz.allowedRanks = {
	"superadmin",
	"vip"
}

-- Do not edit this code
function VIPGroup(ply)
	local rank = jobz.allowedRanks
	return CLIENT or table.HasValue(rank,ply:GetNWString("usergroup"))
end

--[[
	Example jobs for the scripts.
	This allows for easy vip jobs.
--]]
TEAM_EXAMPLE = DarkRP.createJob("Example Job", {
    color = Color(255, 255, 255),
    model = "models/player/hostage/hostage_01.mdl",
    description = [[]],
    weapons = {},
    command = "example",
    max = 3,
    salary = 50,
    admin = 0,
    vote = false,
    customCheck = function(ply) return VIPGroup(ply) end,
    CustomCheckFailMsg = "You need to be VIP for this job.",
})

TEAM_EXAMPLE2 = DarkRP.createJob("Example Job 2", {
    color = Color(255, 255, 255),
    model = "models/player/hostage/hostage_01.mdl",
    description = [[]],
    weapons = {},
    command = "example2",
    max = 3,
    salary = 50,
    admin = 0,
    vote = false,
    customCheck = function(ply) return VIPGroup(ply) end,
    CustomCheckFailMsg = "You need to be VIP for this job.",
})