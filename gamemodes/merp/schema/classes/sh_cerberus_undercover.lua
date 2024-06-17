CLASS.name = "Alliance"
CLASS.faction = FACTION_CERBERUS
CLASS.isDefault = false
CLASS.color = Color(49, 136, 215, 255)

CLASS_CERBERUS_UNDERCOVER = CLASS.index

function CLASS:CanSwitchTo(client)
	return true
end