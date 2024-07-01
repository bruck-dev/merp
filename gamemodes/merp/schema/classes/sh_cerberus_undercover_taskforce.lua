CLASS.name = "Task Force"
CLASS.faction = FACTION_CERBERUS
CLASS.isDefault = false
CLASS.color = Color(255, 255, 255, 255)
CLASS.order = 10

CLASS_TFCERBERUS = CLASS.index

function CLASS:CanSwitchTo(client)
	return true
end