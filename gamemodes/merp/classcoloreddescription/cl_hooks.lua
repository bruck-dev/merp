function PLUGIN:PopulateImportantCharacterInfo(client, character, container)
	local color = character.GetClassColor()
	container:SetArrowColor(color)

	-- name
	local name = container:AddRow("name")
	name:SetImportant()
	name:SetText(hookRun("GetCharacterName", client) or character:GetName())
	name:SetBackgroundColor(color)
	name:SizeToContents()

	-- injured text
	local injureText, injureTextColor = hookRun("GetInjuredText", client)

	if (injureText) then
		local injure = container:AddRow("injureText")

		injure:SetText(L(injureText))
		injure:SetBackgroundColor(injureTextColor)
		injure:SizeToContents()
	end
end