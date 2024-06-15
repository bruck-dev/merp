local MONEY_NAME = string.gsub(ix.util.ExpandCamelCase(ix.currency.plural), "%s", "")
LANGUAGE = {
	cmdMoneyTaken = "You have taken %s " .. MONEY_NAME .. " from %s.",
    cmdMoneyAdded = "You have added %s " .. MONEY_NAME .. " to %s.",
    cmdMoneyZero = "You have set the balance of %s to 0, as they had too few " .. MONEY_NAME .. " for the specified amount.",
}
