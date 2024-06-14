local PLUGIN = PLUGIN
PLUGIN.name = "No Business"
PLUGIN.author = "bruck"
PLUGIN.description = "Disables the business menu."

function PLUGIN:CanPlayerUseBusiness(client)
    return false
  end