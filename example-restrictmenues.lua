allowedGroups = {
    "superadmin",
    "admin",
    "moderator",
    "operator"
}

function spawnGroup(ply)
    return table.HasValue(allowedGroups, ply:GetNWString("usergroup"))
end

hook.Add( "SpawnMenuOpen", "RestrictSpawnMenu", function(ply)
    if spawnGroup(ply) then
        return false
    else
        return true
    end
end)