--[[
-- Provides indentation guides.
-- Added color coding to the guides to make them easier to follow.
--]]
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    local highlight = {
      "Level1",
      "Level2",
      "Level3",
      "Level4",
      "Level5",
      "Level6",
    }

    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "Level1", { fg = "#011627" })
      vim.api.nvim_set_hl(0, "Level2", { fg = "#1D3B53" })
      vim.api.nvim_set_hl(0, "Level3", { fg = "#024D4B" })
      vim.api.nvim_set_hl(0, "Level4", { fg = "#665E3D" })
      vim.api.nvim_set_hl(0, "Level5", { fg = "#623D0F" })
      vim.api.nvim_set_hl(0, "Level6", { fg = "#591111" })
    end)

    require("ibl").setup({
      indent = {
        highlight = highlight,
      },
      scope = {
        enabled = false
      }
    })



  end
}

