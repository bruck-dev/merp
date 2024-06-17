ix.command.Add("CharAdd".. string.gsub(ix.util.ExpandCamelCase(ix.currency.plural), "%s", ""), {
	alias = {"CharAddMoney"},
	description = "Add currency to a player's current balance.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.number
	},
	OnRun = function(self, client, target, amount)
		if (type(amount) != "number") then
			amount = tonumber(amount)
		end

		amount = math.Round(amount)

		if (amount <= 0) then
			return "@invalidArg", 1
		end

		target:GiveMoney(amount)
		client:NotifyLocalized("cmdMoneyAdded", ix.currency.Get(amount), target:GetName())
	end
})