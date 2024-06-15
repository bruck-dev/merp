
-- Here is where you can define your own phrases to use with the language system. You can define phrases in different languages
-- by creating a file called sh_<language name>.lua (e.g sh_french.lua) in the languages/ folder.

-- You are encouraged to avoid using hardcoded strings when displaying any sort of text on the client. You should instead define
-- these phrases here, and use the L() function to return the text in the proper language. For example, L("serverWelcome") would
-- return a string with the text "Welcome to the server, <name>!" as defined below.

-- You can also use formatted strings in phrases. This will make the phrase require additional parameters to display correctly.
-- In the case of serverWelcome, it requires another string which should be the character's name. An example:
-- L("serverWelcome", "John Lua") would return a string with the text "Welcome to the server, John Lua!".

LANGUAGE = {
	serverWelcome = "Welcome to the server, %s!",
	optObserverShowItemESP = "ESP - Items",
	optdObserverShowItemESP = "Shows the names and locations of each item on the server",
	optObserverShowVendor = "ESP - Vendors",
	optdObserverShowVendor = "Shows the names and locations of each vendor on the server",
	optObserverHideLiterature = "ESP - Notepads & Paper",
	optdObserverHideLiterature = "Shows the names and locations of each notepad/paper item on the server",
	optFactionNameColor = "Show name as class color",
	optdFactionNameColor = "A character's name will use its class color.",
	optToggleAmbientFadeout = "Ambient Music Fadeout",
	optdToggleAmbientFadeout = "Blends ambient music into idle music.",
	optToggleAmbientMusic = "Ambient Music",
	optdToggleAmbientMusic = "Enables ambient music.",
	optToggleInventorySound = "Play inventory move sounds",
	optdToggleInventorySound = "Toggles the inventory item moving sounds.",
	radioNotOn = "Your radio isn't on!",
	radioRequired = "You need a radio to do this.",
	radioAlreadyOn = "You already have a radio that is turned on!",
}
