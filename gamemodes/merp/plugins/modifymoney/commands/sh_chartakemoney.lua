ix.command.Add("CharTake".. string.gsub(ix.util.ExpandCamelCase(ix.currency.plural), "%s", ""), {
	alias = {"CharTakeMoney"},
	description = "Removes currency from a player's current balance.",
	superAdminOnly = true,
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

		if (target:GetMoney() < amount) then
			target:SetMoney(0)
			client:NotifyLocalized("cmdMoneyZero", target:GetName())
		else
			target:TakeMoney(amount)
			client:NotifyLocalized("cmdMoneyTaken", ix.currency.Get(amount), target:GetName())
		end
		
		
	end
})