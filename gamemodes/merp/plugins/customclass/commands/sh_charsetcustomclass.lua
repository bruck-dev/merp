ix.command.Add("CharSetCustomClass", {
	description = "Sets a character's custom class.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.string
	},
    OnRun = function(self, client, target, text)
		if string.lower(text) == "null" or string.lower(text) == "nil" or string.lower(text) == "none" or text == '' then
			target:SetCustomClass(nil);
		else
        	target:SetCustomClass(text);
		end

        client:Notify(string.format("You have set the custom class of %s to %s.", target:GetName(), text))
	end
})