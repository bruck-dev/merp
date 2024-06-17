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

-- Broadcast on Cerberus Network --
do
	local COMMAND = {}
	COMMAND.description = "Broadcast over the secure Cerberus network."
	COMMAND.arguments = ix.type.text

	function COMMAND:OnRun(client, message)
		local character = client:GetCharacter()
		local item

		if (character:GetFaction() == FACTION_CERBERUS) then
			if (!client:IsRestricted()) then
				if message != '' then
					ix.chat.Send(client, "cerberus", message)
				else
					return "@cerberusEmptyMessageEmptyMessage"
				end
			else
				return "@notNow"
			end
		else
			return "@cerberusNoAccess"
		end
	end
	ix.command.Add("Cerberus", COMMAND)
end