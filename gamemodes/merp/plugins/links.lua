local PLUGIN = PLUGIN
PLUGIN.name = "Link Commands"
PLUGIN.author = "Ayreborne"
PLUGIN.description = "Adds links to the various content"

PLUGIN.urls = {
	["Discord"] = "https://discord.gg/De4A25U6vY",
	["Content"] = "https://steamcommunity.com/sharedfiles/filedetails?id=3265880265",
}

-- Adding commands for URLs.
for k,v in pairs(PLUGIN.urls) do
	ix.command.Add(k, {
		description = "Directs you to our Server " .. k .. ".",
		OnRun = function(self, client)
			local lua = "gui.OpenURL('" .. v .. "')"
			client:SendLua(lua)
		end
	})
end