-- Schema info
Schema.name = "Mass Effect Roleplay"
Schema.author = "bruck"
Schema.description = "A roleplay schema based on the Mass Effect Universe."


ix.util.Include("sh_configs.lua")
ix.util.Include("sh_commands.lua")
ix.util.Include("sh_flags.lua")

ix.util.Include("cl_schema.lua")
ix.util.Include("sv_schema.lua")

ix.util.Include("cl_hooks.lua")
ix.util.Include("sh_hooks.lua")

ix.util.Include("libs/thirdparty/sh_netstream2.lua")

-- MODEL MANAGEMENT --
ix.anim.SetModelClass("models/player/barney.mdl", "player")
ix.anim.SetModelClass("models/player/alyx.mdl", "player")

-- OMNI CHAT --
ix.chat.Register("om", {
	format = "[OMNI] %s -> %s: %s",
	color = Color(253, 162, 44, 255),
	deadCanChat = false,

	OnChatAdd = function(self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, string.format(self.format, speaker:GetName(), data.target:GetName(), text))

		if (LocalPlayer() != speaker) then
			surface.PlaySound("hl1/fvox/bell.wav")
		end
	end
})

-- CERBERUS CHANNEL --
do
	local CLASS = {}
	CLASS.color = Color(253, 162, 44, 255)
	CLASS.format = "[CERB] -> Operative %s broadcasts: \"%s\""
	CLASS.deadCanChat = false;

	function CLASS:CanHear(speaker, listener)
		return listener:GetCharacter():GetFaction() == FACTION_CERBERUS
	end

	function CLASS:OnChatAdd(speaker, text)
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("cerberus", CLASS)
end