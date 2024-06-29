local CHAR = ix.meta.character

function CHAR:IsCerberus()
	local faction = self:GetFaction()
	return faction == FACTION_CERBERUS
end

function CHAR:IsAlliance()
	local faction = self:GetFaction()
    local class = self:GetClass()
	return faction == FACTION_ALLIANCE || class == CLASS_CERBERUS_UNDERCOVER
end
