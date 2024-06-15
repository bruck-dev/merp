-- Radio
do
	local COMMAND = {}
	COMMAND.description = "Communicate over a long distance with a radio."
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
				ix.chat.Send(client, "radio", message)
				ix.chat.Send(client, "radio_eavesdrop", message)
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

-- Private omni messages between players, in-character.
ix.command.Add("Omni", {
	description = "Communicate with another player via Omnitool.",
	arguments = {
		ix.type.player,
		ix.type.text
	},
	OnRun = function(self, client, target, message)
		local voiceMail = target:GetData("vm")

		if (voiceMail and voiceMail:find("%S")) then
			return target:GetName()..": "..voiceMail
		end

		if ((client.ixNextPM or 0) < CurTime()) then
			ix.chat.Send(client, "om", message, false, {client, target}, {target = target})

			client.ixNextPM = CurTime() + 0.5
			target.ixLastPM = client
		end
	end
})

-- Reply to last omni message received
ix.command.Add("OmniReply", {
	description = "Communicate with the last player messaged via Omnitool.",
	arguments = ix.type.text,
	OnRun = function(self, client, message)
		local target = client.ixLastPM

		if (IsValid(target) and (client.ixNextPM or 0) < CurTime()) then
			ix.chat.Send(client, "om", message, false, {client, target}, {target = target})
			client.ixNextPM = CurTime() + 0.5
		end
	end
})