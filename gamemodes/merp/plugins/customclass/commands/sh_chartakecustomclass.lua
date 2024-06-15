ix.command.Add("CharTakeCustomClass", {
	description = "Remove a character's custom class.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.string
	},
    OnRun = function(self, client, target)
        target:SetCustomClass(nil);

        client:Notify(string.format("You have taken the custom class from %s.", target:GetName()))
	end
})