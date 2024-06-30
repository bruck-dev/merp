
FACTION.name = "Event Character"
FACTION.description = "A faction used for event characters."
FACTION.color = Color(150, 125, 80, 255)
FACTION.isDefault = false
FACTION.HideOnScoreboard = true
FACTION.models = {
	"models/player/barney.mdl",
    "models/player/alyx.mdl"
}
FACTION.npcRelations = {
    ["npc_citizen"] = D_LI,
    ["npc_vortigaunt"] = D_LI,
    ["npc_metropolice"] = D_HT,
    ["npc_combinedropship"] = D_HT,
    ["npc_combinegunship"] = D_HT,
    ["npc_combine_s"] = D_HT,
    ["npc_strider"] = D_HT,
    ["npc_combine_camera"] = D_HT,
    ["npc_turret_ceiling"] = D_HT,
    ["npc_turret_floor"] = D_HT,
    ["npc_turret_ground"] = D_HT,
    ["npc_cscanner"] = D_HT,
    ["CombineElite"] = D_HT,
    ["npc_rollermine"] = D_HT,
    ["npc_manhack"] = D_HT,
    ["npc_sniper"] = D_HT,
    ["npc_helicopter"] = D_HT,
    ["npc_turret_floor_rebel"] = D_LI,
    ["Rebel"] = D_LI,
    ["combine_mine"] = D_HT
}

FACTION_EVENT_CHAR = FACTION.index
