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
    customCheck = function(ply) return ply:GetUserGroup() == "vip" end,
    CustomCheckFailMsg = "You need to be VIP for this job.",
})