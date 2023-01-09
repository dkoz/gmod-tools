--[[
	Restrict Menues
--]]

-- Table containing the usergroups allowed to open Spawn and Context menu.
local spawnGroup = {
    ["superadmin"] = true,
    ["admin"] = true,
    ["moderator"] = true
}

-- Do not edit below this line
function RestrictMenues()
	-- Specifies which groups can open the menu.
    if ( !spawnGroup[ LocalPlayer():GetNWString("usergroup") ] ) then
		-- Notifies players that don't have correct group
        notification.AddLegacy( "You don't have permission to open this menu!", NOTIFY_ERROR, 2 )
        return false
    else
        return true
    end
end
-- Hook for Spawn Menu
hook.Add( "SpawnMenuOpen", "RestrictSpawnMenu", RestrictMenues )

-- Hook for Context Menu
hook.Add( "ContextMenuOpen", "RestrictContextMenu", RestrictMenues )