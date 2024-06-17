do
	local COMMAND = {}
	COMMAND.description = "Communicate over a long distance with a radio. Eavesdroppers can hear like normal."
	COMMAND.arguments = ix.type.text

	function COMMAND:OnRun(client, message)
		local character = client:GetCharacter()
		local radios = character:GetInventory():GetItemsByUniqueID("radio", true)
		local item

		for k, v in ipairs(radios) do
			if (v:GetData("enabled", false)) then
				item = v
				break
			end
		end

		if (item) then
			if (!client:IsRestricted()) then
				if message != '' then
					ix.chat.Send(client, "radio", message)
					ix.chat.Send(client, "radio_eavesdrop", message)
				else
					return "@radioEmptyMessage"
				end
			else
				return "@notNow"
			end
		elseif (#radios > 0) then
			return "@radioNotOn"
		else
			return "@radioRequired"
		end
	end
	ix.command.Add("Radio", COMMAND)
end

do
	local COMMAND = {}
	COMMAND.description = "Communicate over a long distance with a radio. Eavesdroppers can hear in a whisper range."
	COMMAND.arguments = ix.type.text

	function COMMAND:OnRun(client, message)
		local character = client:GetCharacter()
		local radios = character:GetInventory():GetItemsByUniqueID("radio", true)
		local item

		for k, v in ipairs(radios) do
			if (v:GetData("enabled", false)) then
				item = v
				break
			end
		end

		if (item) then
			if (!client:IsRestricted()) then
				if message != '' then
					ix.chat.Send(client, "radio_w", message)
					ix.chat.Send(client, "radio_eavesdrop_w", message)
				else
					return "@radioEmptyMessage"
				end
			else
				return "@notNow"
			end
		elseif (#radios > 0) then
			return "@radioNotOn"
		else
			return "@radioRequired"
		end
	end
	ix.command.Add("RadioW", COMMAND)
end

do
	local COMMAND = {}
	COMMAND.description = "Communicate over a long distance with a radio. Eavesdroppers can hear in a yell range."
	COMMAND.arguments = ix.type.text

	function COMMAND:OnRun(client, message)
		local character = client:GetCharacter()
		local radios = character:GetInventory():GetItemsByUniqueID("radio", true)
		local item

		for k, v in ipairs(radios) do
			if (v:GetData("enabled", false)) then
				item = v
				break
			end
		end

		if (item) then
			if (!client:IsRestricted()) then
				if message != '' then
					ix.chat.Send(client, "radio_y", message)
					ix.chat.Send(client, "radio_eavesdrop_y", message)
				else
					return "@radioEmptyMessage"
				end
			else
				return "@notNow"
			end
		elseif (#radios > 0) then
			return "@radioNotOn"
		else
			return "@radioRequired"
		end
	end
	ix.command.Add("RadioY", COMMAND)
end

do
	local COMMAND = {}
	COMMAND.arguments = ix.type.number

	function COMMAND:OnRun(client, frequency)
		local character = client:GetCharacter()
		local inventory = character:GetInventory()
		local itemTable = inventory:HasItem("radio")

		if (itemTable) then
			if (string.find(frequency, "^%d%d%d%.%d$")) then
				character:SetData("frequency", frequency)
				itemTable:SetData("frequency", frequency)

				client:Notify(string.format("You have set your radio frequency to %s.", frequency))
			else
				client:Notify(string.format("%s is a incorrect frequency string.", frequency))
			end
		end
	end

	ix.command.Add("SetFreq", COMMAND)
end