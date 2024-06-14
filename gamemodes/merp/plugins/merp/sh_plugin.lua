PLUGIN.name = "MERP Plugin"
PLUGIN.author = "bruck"
PLUGIN.description = "Basic feature plugin for MERP."

-- FLAGS --
ix.flag.Add("B", "Access to biotics.")

-- OMNI PMS --
ix.command.Add("omni", {
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

ix.chat.Register("om", {
	format = "[OMNI] %s -> %s: %s",
	color = Color(253, 162, 44, 255),
	deadCanChat = true,

	OnChatAdd = function(self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, string.format(self.format, speaker:GetName(), data.target:GetName(), text))

		if (LocalPlayer() != speaker) then
			surface.PlaySound("hl1/fvox/bell.wav")
		end
	end
})