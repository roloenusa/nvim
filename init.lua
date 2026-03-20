-- Lua initialization file
-- Check Neovim version
if vim.fn.has('nvim-0.11') == 0 then
  vim.notify('Neovim 0.11+ is required for this config', vim.log.levels.ERROR)
  return
end

require("roloenusa.core")
require('roloenusa.languages')
require("roloenusa.lazy")

-- Colorscheme reload function for development/testing
function _G.ReloadColorscheme(name)
  name = name or "dessert-fox"
  -- Clear from package.loaded so changes are picked up
  package.loaded["colors." .. name] = nil
  vim.cmd("colorscheme " .. name)
  vim.cmd("Lazy reload " .. name)
  print("Reloaded colorscheme: " .. name)
end

vim.keymap.set("n", "<leader>rc", function()
  ReloadColorscheme("dessert-fox")
end, { desc = "Reload: Colorscheme (dessert-fox)" })

