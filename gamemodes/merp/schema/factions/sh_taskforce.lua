FACTION.name = "Task Force"
FACTION.description = "A member of the Task Force."
FACTION.isDefault = true
FACTION.color = Color(255, 255, 255, 255)
FACTION_TASKFORCE = FACTION.index

FACTION.models = {
	"models/player/barney.mdl",
    "models/player/alyx.mdl"
}

function FACTION:OnTransferred(target)
    target:SetClass(CLASS_TASKFORCE); 	
    -- target:SetCustomClass(nil);	
end