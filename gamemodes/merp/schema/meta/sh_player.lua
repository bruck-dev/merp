local playerMeta = FindMetaTable("Player")

function playerMeta:IsCerberus()
	local faction = self:Team()
	return faction == FACTION_CERBERUS
end

function playerMeta:IsAlliance()
	local faction = self:Team()
    local class = self:GetCharacter():GetClass()
	return faction == FACTION_ALLIANCE || class == CLASS_CERBERUS_UNDERCOVER
end