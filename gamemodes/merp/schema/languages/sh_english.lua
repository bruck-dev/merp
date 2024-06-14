
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
	optObserverESP = "ESP - Show",
	optdObserverESP = "Shows the names and locations of each player in the server.",
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
	opt24hourTime = "Use 24-hour time",
	optd24hourTime = "Show timestamps in 24-hour time, rather than 12-hour time (AM/PM).",
	optChatNotices = "Show notices in chat",
	optdChatNotices = "Puts all notices that appear in the top-right into the chat instead.",
	optChatTimestamps = "Show timestamps in chat",
	optdChatTimestamps = "Prepends the time to each message in the chatbox.",
	optAlwaysShowBars = "Always show info bars",
	optdAlwaysShowBars = "Draws the information bars in the top-left, regardless if it should be hidden or not.",
	optAltLower = "Hide hands when lowered", -- @todo remove me
	optdAltLower = "Hides your hands when they are by your side.", -- @todo remove me
	optThirdpersonEnabled = "Enable third person",
	optdThirdpersonEnabled = "Moves the camera behind you. This can also be enabled with the \"ix_togglethirdperson\" console command.",
	optThirdpersonClassic = "Enable classic third person camera",
	optdThirdpersonClassic = "Moves your character's view with your mouse.",
	optThirdpersonVertical = "Camera height",
	optdThirdpersonVertical = "How high up the camera should be.",
	optThirdpersonHorizontal = "Camera offset",
	optdThirdpersonHorizontal = "How far left or right the camera should be.",
	optThirdpersonDistance = "Camera distance",
	optdThirdpersonDistance = "How far away the camera should be.",
	optThirdpersonCrouchOffset = "Camera crouch height",
	optdThirdpersonCrouchOffset = "How high up the camera should be while crouched.",
	optDisableAnimations = "Disable animations",
	optdDisableAnimations = "Stops animations from playing to provide instant transitions.",
	optAnimationScale = "Animation scale",
	optdAnimationScale = "How much faster or slower the animations should play.",
	optLanguage = "Language",
	optdLanguage = "The language shown in the Helix UI.",
	optMinimalTooltips = "Minimal HUD tooltips",
	optdMinimalTooltips = "Changes the HUD tooltip style to take up less space.",
	optNoticeDuration = "Notice duration",
	optdNoticeDuration = "How long to show notices for (in seconds).",
	optNoticeMax = "Maximum notices",
	optdNoticeMax = "The amount of notices shown before excess previous ones are removed.",
	optChatFontScale = "Chat font scale",
	optdChatFontScale = "How much bigger or smaller the chat font should be.",
	optChatOutline = "Outline chat text",
	optdChatOutline = "Draws an outline around the chat text, rather than a drop shadow. Enable this if you are having trouble reading text.",
}
