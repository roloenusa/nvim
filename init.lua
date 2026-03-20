-- Lua initialization file
require("roloenusa.core")
require('roloenusa.languages')
require("roloenusa.lazy")

function _G.ReloadColorscheme(name)
  name = name or "dessert-fox"
  -- Clear it from package.loaded so changes are picked up
  package.loaded["colors." .. name] = nil
  vim.cmd("colorscheme " .. name)
  vim.cmd("Lazy reload dessert-fox")
  print("Reloaded colorscheme: " .. name)
end

vim.keymap.set("n", "<leader>rc", function()
  ReloadColorscheme("dessert-fox")
end, { desc = "Reload colorscheme" })

