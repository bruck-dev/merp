--[[
	© 2020 TERRANOVA do not share, re-distribute or modify
	without permission of its author.
--]]

ix.command.Add("AdminSpawnMenu", {
	description = "Opens an interface for spawning scripted items.",
    adminOnly = true,
	OnRun = function(self, client)
		net.Start("adminSpawnMenu")
		net.Send(client)
	end
})