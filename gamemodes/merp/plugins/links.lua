local PLUGIN = PLUGIN
PLUGIN.name = "Link Commands"
PLUGIN.author = "Ayreborne"
PLUGIN.description = "Adds links to the various content"

PLUGIN.urls = {
	["Discord"] = "PLACEHOLDER",
	["Content"] = "PLACEHOLDER",
}

-- Adding commands for URLs.
for k,v in pairs(PLUGIN.urls) do
	ix.command.Add(k, {
		description = "Directs you to our " .. k .. ".",
		OnRun = function(self, client)
			local lua = "gui.OpenURL('" .. v .. "')"
			client:SendLua(lua)
		end
	})
end