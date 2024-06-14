--[[
	© 2020 TERRANOVA do not share, re-distribute or modify
	without permission of its author.
--]]

PLUGIN.name = "Languages";
PLUGIN.description = "Dynamically creates language commands for various languages.";
PLUGIN.author = "Adolphus, modified for yell/whisper compatibility by bruck";

ix.util.IncludeDir(PLUGIN.folder .. "/meta", true);
ix.util.IncludeDir(PLUGIN.folder .. "/commands", true);
ix.util.Include("sh_languages.lua")
ix.util.Include("sv_hooks.lua")