PLUGIN.name = "Admin Enhancers"
PLUGIN.author = "ZeMysticalTaco, Gary Tate, bruck"
PLUGIN.description = "Adds scoreboard options, context menu options, and chat for admins."

CAMI.RegisterPrivilege({
	Name = "Helix - MERP",
	MinAccess = "admin"
})

-- CHAT --
CAMI.RegisterPrivilege({
	Name = "Helix - Admin Chat",
	MinAccess = "admin"
})

ix.chat.Register("adminchat", {
	prefix = "/a",
	description = "Send a message in admin-only chat.",
	format = "whocares",
	OnGetColor = function(self, speaker, text)
		return Color(0, 196, 255)
	end,
	OnCanHear = function(self, speaker, listener)
		if(CAMI.PlayerHasAccess(listener, "Helix - Admin Chat", nil)) then
			return true
		end

		return false
	end,
	OnCanSay = function(self, speaker, text)
		if(CAMI.PlayerHasAccess(speaker, "Helix - Admin Chat", nil)) then
			speaker:Notify("You aren't an admin. Use '@' to create a ticket.")

			return false
		end

		return true
	end,
	OnChatAdd = function(self, speaker, text)
		icon = Material(hook.Run("GetPlayerIcon", speaker) or icon)

		if(CAMI.PlayerHasAccess(LocalPlayer(), "Helix - Admin Chat", nil) and CAMI.PlayerHasAccess(speaker, "Helix - Admin Chat", nil)) then
			chat.AddText(icon, Color(65, 129, 129), "@staff - ", Color(225,225,225), speaker:SteamName(), ": ", Color(200, 200, 200), text)
		end
	end
})


-- CONTEXT MENU --
CAMI.RegisterPrivilege({
	Name = "Helix - Admin Context Options",
	MinAccess = "admin"
})

if (SERVER) then
	ix.log.AddType("contextMenuAdmin", function(client, ...)
		local arg = {...}
		return string.format("%s has used context menu option '%s' on player %s (%s)", client:SteamName().." ("..client:SteamID()..")", arg[1], arg[2], arg[3])
	end)
end

properties.Add("ixViewPlayerProperty", {
	MenuLabel = "#View Player",
	Order = 1,
	MenuIcon = "icon16/user.png",
	Format = "%s | %s\nHealth: %s\nArmor: %s",
	Filter = function(self, entity, client)
		return CAMI.PlayerHasAccess(client, "Helix - Admin Context Options", nil) and entity:IsPlayer()
	end,
	Action = function(self, entity)
		self:MsgStart()
			net.WriteEntity(entity)
		self:MsgEnd()
	end,
	Receive = function(self, length, client)
		if (CAMI.PlayerHasAccess(client, "Helix - Admin Context Options", nil)) then
			local entity = net.ReadEntity()
			client:NotifyLocalized(string.format(self.Format, entity:Nick(), entity:SteamID(), entity:Health(), entity:Armor()))
		end
	end
})

properties.Add("ixSetHealthProperty", {
	MenuLabel = "#Health",
	Order = 2,
	MenuIcon = "icon16/heart.png",
	Filter = function(self, entity, client)
		return CAMI.PlayerHasAccess(client, "Helix - Admin Context Options", nil) and entity:IsPlayer()
	end,
	MenuOpen = function( self, option, ent, tr )
		local submenu = option:AddSubMenu()
		local hpchoices = {100,75,50,25,1,0}

		for i,v in ipairs(hpchoices) do
			submenu:AddOption(v, function() self:SetHealth( ent, v ) end )
		end
	end,
	SetHealth = function(self, target, health)
		self:MsgStart()
			net.WriteEntity(target)
			net.WriteUInt(health, 8)
		self:MsgEnd()
	end,
	Receive = function(self, length, client)
		if (CAMI.PlayerHasAccess(client, "Helix - Admin Context Options", nil)) then
			local entity = net.ReadEntity()
			local health = net.ReadUInt(8)

			entity:SetHealth(health)
			if (entity:Health() == 0) then entity:Kill() end
			
			ix.log.Add(client, "contextMenuAdmin", "SetHealth", entity:Name(), "HP->"..health)
		end
	end
})

properties.Add("ixSetArmorProperty", {
	MenuLabel = "#Armor",
	Order = 3,
	MenuIcon = "icon16/shield.png",
	Filter = function(self, entity, client)
		return CAMI.PlayerHasAccess(client, "Helix - Admin Context Options", nil) and entity:IsPlayer()
	end,
	MenuOpen = function( self, option, ent, tr )
		local submenu = option:AddSubMenu()

		for i = 100, 0, -25 do
			submenu:AddOption(i, function() self:SetArmor( ent, i ) end )
		end
	end,
	SetArmor = function(self, target, armor)
		self:MsgStart()
			net.WriteEntity(target)
			net.WriteUInt(armor, 8)
		self:MsgEnd()
	end,
	Receive = function(self, length, client)
		if (CAMI.PlayerHasAccess(client, "Helix - Admin Context Options", nil)) then
			local entity = net.ReadEntity()
			local armor = net.ReadUInt(8)

			entity:SetArmor(armor)
			
			ix.log.Add(client, "contextMenuAdmin", "SetArmor", entity:Name(), "Armor->"..armor)
			
		end
	end
})

properties.Add("ixSetDescriptionProperty", {
	MenuLabel = "#Edit Description",
	Order = 4,
	MenuIcon = "icon16/book_edit.png",

	Filter = function(self, entity, client)
		return CAMI.PlayerHasAccess(client, "Helix - Admin Context Options", nil) and entity:IsPlayer()
	end,

	Action = function(self, entity)
		self:MsgStart()
			net.WriteEntity(entity)
		self:MsgEnd()
	end,

	Receive = function(self, length, client)
		if (CAMI.PlayerHasAccess(client, "Helix - Admin Context Options", nil)) then
			local entity = net.ReadEntity()
			client:RequestString("Set the character's description.", "New Description", function(text)
				entity:GetCharacter():SetDescription(text)
				ix.log.Add(client, "contextMenuAdmin", "SetDescription", entity:Name(), text)
			end, entity:GetCharacter():GetDescription())	
		end
	end
})


-- SCOREBOARD --
hook.Add("PopulateScoreboardPlayerMenu", "ixAdmin", function(client, menu)
	local options = {}

	if(LocalPlayer():IsAdmin()) then
		options["Give Whitelist"] = {
			function()
				if LocalPlayer():IsAdmin() == false then ix.util.Notify("This function is only available for admins.") return end
				local menu = vgui.Create("DFrame")
				menu:SetSize(ScrW() / 6, ScrH() / 3)
				menu:MakePopup()
				menu:Center()
				menu:SetTitle("Player Whitelist Menu")

				local panel = menu:Add("DScrollPanel")
				panel:Dock(FILL)

				for k, v in SortedPairs(ix.faction.indices) do
					local button = vgui.Create("DButton", panel)
					button:Dock(TOP)
					button:SetSize(20,30)
					button:SetText(L(v.name))
					button:SetFont("ixSmallFont")
					button:DockMargin(4,4,4,4)

					function button:DoClick()
						ix.command.Send("PlyWhitelist", client:Name(), v.name)
						button:Remove()
					end

					function button.Paint(w, h)
						local factionColor = v.color
						factionColor.a = 50

						derma.SkinFunc("PaintCategoryPanel", button, "", factionColor)

						surface.SetTextColor(Color(255,255,255,255))
						surface.SetTextPos(4, 4)
					end

					if(client:HasWhitelist(v.index)) then
						button:Remove()
					end
				end
			end
		}

		options["Give Flag"] = {
			function()
				if LocalPlayer():IsAdmin() == false then ix.util.Notify("This function is only available for admins.") return end
				local menu = vgui.Create("DFrame")
				menu:SetSize(ScrW() / 6, ScrH() / 3)
				menu:MakePopup()
				menu:Center()
				menu:SetTitle("Character Flag Menu")

				local panel = menu:Add("DScrollPanel")
				panel:Dock(FILL)

				for k, v in SortedPairs(ix.flag.list) do
					local button = vgui.Create("DButton", panel)
					button:Dock(TOP)
					button:SetSize(20,30)
					button:SetText(L(k) .. " - " .. v.description)
					button:SetFont("ixSmallFont")
					button:DockMargin(4,4,4,4)

					function button:DoClick()
						ix.command.Send("CharGiveFlag", client:Name(), k)
						button:Remove()
					end

					function button.Paint(w, h)
						derma.SkinFunc("PaintCategoryPanel", button, "", Color(0,0,0,100))

						surface.SetTextColor(Color(255,255,255,255))
						surface.SetTextPos(4, 4)
					end

					if(client:GetCharacter():HasFlags(k)) then
						button:Remove()
					end
				end
			end
		}

		options["Set Name"] = {
			function()
				if LocalPlayer():IsAdmin() == false then ix.util.Notify("This function is only available for admins.") return end
				if (IsValid(client) and LocalPlayer():IsAdmin()) then
					Derma_StringRequest("Change Character Name", "What do you want to change this character's name to?", client:Name(), function(text)
						ix.command.Send("CharSetName", client:Name(), text)
					end, nil, "Change", "Cancel")
				end
			end
		}

		-- options["Set Custom Class"] = {
		-- 	function()
		-- 		if LocalPlayer():IsAdmin() == false then ix.util.Notify("This function is only available for admins.") return end
		-- 		if (IsValid(client) and LocalPlayer():IsAdmin()) then
		-- 			Derma_StringRequest("Change Character Class", "What do you want to change this character's name to?", client:GetCharacter():GetCustomClass(), function(text)
		-- 				ix.command.Send("CharSetCustomClass", client:Name(), text)
		-- 			end, nil, "Change", "Cancel")
		-- 		end
		-- 	end
		-- }

		-- options["Clear Custom Class"] = {
		-- 	function()
		-- 		if LocalPlayer():IsAdmin() == false then ix.util.Notify("This function is only available for admins.") return end
		-- 		if (IsValid(client) and LocalPlayer():IsAdmin()) then
		-- 			ix.command.Send("CharTakeCustomClass", client:Name())
		-- 		end
		-- 	end
		-- }

		options["Change Model"] = {
			function()
				if LocalPlayer():IsAdmin() == false then ix.util.Notify("This function is only available for admins.") return end
				if (IsValid(client) and LocalPlayer():IsAdmin()) then
					Derma_StringRequest("Change Character Model", "What do you want to change this character's model to?", client:GetModel(), function(text)
						ix.command.Send("CharSetModel", client:Name(), text)
					end, nil, "Change", "Cancel")
				end
			end
		}
		
		options["Give Item"] = {
		function()
			if LocalPlayer():IsAdmin() == false then ix.util.Notify("This function is only available for admins.") return end
			local menu = vgui.Create("DFrame")
			menu:SetSize(ScrW() / 6, ScrH() / 3)
			menu:MakePopup()
			menu:Center()
			menu:SetTitle("Character Item Menu")
			local panel = menu:Add("DScrollPanel")
			panel:Dock(FILL)
			local header = panel:Add("DLabel")
			header:Dock(TOP)
			header:SetText("Use the box to search for an item.")
			header:SetTextInset(3, 0)
			header:SetFont("ixMediumFont")
			header:SetTextColor(color_white)
			header:SetExpensiveShadow(1, color_black)
			header:SetTall(25)

			header.Paint = function(this, w, h)
				surface.SetDrawColor(ix.config.Get("color"))
				surface.DrawRect(0, 0, w, h)
			end
			local entry = menu:Add("DTextEntry")
			entry:Dock(TOP)
			for k, v in SortedPairs(ix.item.list) do
				local button = vgui.Create("DButton", panel)
				button:Dock(TOP)
				button:SetSize(20,30)
				button:SetText(L(v.name))
				function button:DoClick()
					ix.command.Send("CharGiveItem", client:Name(), v.uniqueID, 1)
				end
				function button.Paint()
					surface.SetDrawColor(Color(200,200,200,255))
				end
				function button:Think()
					if string.len(entry:GetText()) < 1 then self:Show() return end
					if not string.find(v.name, entry:GetText()) then
						panel:SetVerticalScrollbarEnabled(true)
						panel:ScrollToChild(self)
					else
						panel:SetVerticalScrollbarEnabled(true)
						--panel:ScrollToChild()
					end
				end
			end
		end
		}

		local MONEY_NAME = string.gsub(ix.util.ExpandCamelCase(ix.currency.plural), "%s", "")
		options["Add " .. MONEY_NAME] = {
			function()
				if LocalPlayer():IsAdmin() == false then ix.util.Notify("This function is only available for admins.") return end
				if (IsValid(client) and LocalPlayer():IsAdmin()) then
					Derma_StringRequest("Add " .. MONEY_NAME, "How much?", '0', function(amount)
						ix.command.Send("CharAdd" .. MONEY_NAME, client:Name(), amount)
					end, nil, "Add", "Cancel")
				end
			end
		}

		options["Take " .. MONEY_NAME] = {
			function()
				if LocalPlayer():IsAdmin() == false then ix.util.Notify("This function is only available for admins.") return end
				if (IsValid(client) and LocalPlayer():IsAdmin()) then
					Derma_StringRequest("Take " .. MONEY_NAME, "How much?", '0', function(amount)
						ix.command.Send("CharTake" .. MONEY_NAME, client:Name(), amount)
					end, nil, "Take", "Cancel")
				end
			end
		}
	end
	
	for k, v in pairs(options) do
		menu:AddOption(k,v[1])
	end
end)