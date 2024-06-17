FACTION.name = "Cerberus"
FACTION.description = "A member of the Cerberus paramilitary organization."
FACTION.isDefault = false
FACTION.color = Color(253, 162, 44, 255)
FACTION_CERBERUS = FACTION.index

FACTION.canSeeWaypoints = true
FACTION.canAddWaypoints = true
FACTION.canRemoveWaypoints = true
FACTION.canUpdateWaypoints = true

FACTION.models = {
	"models/player/barney.mdl",
    "models/player/alyx.mdl"
}

function FACTION:OnTransferred(target)
    target:SetClass(CLASS_CERBERUS); 	
    target:SetCustomClass(nil);	
end