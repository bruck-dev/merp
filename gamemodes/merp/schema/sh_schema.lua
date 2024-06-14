
-- Schema info
Schema.name = "Mass Effect Roleplay"
Schema.author = "bruck"
Schema.description = "A roleplay schema based on the Mass Effect Universe."


ix.util.Include("sh_configs.lua")
ix.util.Include("sh_commands.lua")

ix.util.Include("cl_schema.lua")
ix.util.Include("sv_schema.lua")

ix.util.Include("cl_hooks.lua")
ix.util.Include("sh_hooks.lua")
ix.util.Include("sv_hooks.lua")

ix.util.Include("libs/thirdparty/sh_netstream2.lua")

-- MODEL MANAGEMENT --
ix.anim.SetModelClass("models/player/barney.mdl", "player")
ix.anim.SetModelClass("models/player/alyx.mdl", "player")

ix.anim.SetModelClass("models/police.mdl", "metrocop")
ix.anim.SetModelClass("models/combine_super_soldier.mdl", "overwatch")
ix.anim.SetModelClass("models/combine_soldier_prisonGuard.mdl", "overwatch")
ix.anim.SetModelClass("models/combine_soldier.mdl", "overwatch")
ix.anim.SetModelClass("models/vortigaunt.mdl", "vortigaunt")
ix.anim.SetModelClass("models/vortigaunt_blue.mdl", "vortigaunt")
ix.anim.SetModelClass("models/vortigaunt_doctor.mdl", "vortigaunt")
ix.anim.SetModelClass("models/vortigaunt_slave.mdl", "vortigaunt")