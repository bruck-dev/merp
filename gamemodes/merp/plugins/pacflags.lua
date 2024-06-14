PLUGIN.name = "PAC3 Flags"
PLUGIN.author = "bruck"
PLUGIN.description = "Adds 'P' flag, which allows use of the PAC3 editor."

ix.flag.Add("P", "Access to the PAC3 editor.")

function PLUGIN:PrePACEditorOpen(ply)
   if ply:GetCharacter():HasFlags("P") then
       return true
   else
      return false
   end
end