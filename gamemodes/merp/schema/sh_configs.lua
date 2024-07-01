ix.currency.symbol = ""
ix.currency.singular = "Credit"
ix.currency.plural = "Credits"

ix.config.SetDefault("maxAttributes", 10)
ix.config.SetDefault("year", 2183)
ix.config.SetDefault("music", "music/hl2_song26.mp3")

ix.config.Add("jamTranslators", false, "Whether or not 'translated' comms are disabled (standard talking, radio, etc.). Language commands still work.", nil, {
	category = "chat"
})