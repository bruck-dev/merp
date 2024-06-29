local character = ix.meta.character

function character:IsCerberus()
	local faction = self:GetFaction()
	return faction == FACTION_CERBERUS
end

function character:IsAlliance()
	local faction = self:GetFaction()
    local class = self:GetClass()
	return faction == FACTION_ALLIANCE || class == CLASS_CERBERUS_UNDERCOVER_ALLIANCE || class == CLASS_CERBERUS_UNDERCOVER_TASKFORCE
end

function character:GetClassName()
    if(self:GetClass()) then
        return ix.class.list[self:GetClass()].name
    end

    return ix.faction.indices[self:GetFaction()].name
end

function character:GetClassScoreboardPriority()
    if(self:GetClass()) then
        if(ix.class.list[self:GetClass()].order != nil) then
            return ix.class.list[self:GetClass()].order
        end
    end

    return 10
end

function character:GetClassColor()
    if(self:GetClass()) then
        return ix.class.list[self:GetClass()].color or Color(255,255,255)
    end

    return Color(150, 125, 100, 255)
end
