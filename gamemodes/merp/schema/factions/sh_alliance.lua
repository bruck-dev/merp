FACTION.name = "Alliance"
FACTION.description = "A member of the Alliance Military."
FACTION.isDefault = false
FACTION.color = Color(49, 136, 215, 255)
FACTION_ALLIANCE = FACTION.index

FACTION.models = {
	"models/player/barney.mdl",
    "models/player/alyx.mdl"
}

function FACTION:OnTransferred(target)
    target:SetClass(CLASS_ALLIANCE); 	
    target:SetCustomClass(nil);	
end