--[[
  Colorscheme configuration

  Multiple colorschemes available for testing
  Active: nightfly (uncomment others to switch)
]]--

-- Nightfly options (set before colorscheme loads)
vim.g.nightflyNormalFloat = true

-- Custom highlights for floating windows
local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "nightfly",
  callback = function()
    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#417aa8', bg = '#011627' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#02121f'})
  end,
  group = custom_highlight,
})

return {
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nightfly")
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("catppuccin")
    -- end
  },
  {
    dir = "~/projects/personal/colorgen-nvim/onedarker",
    name = "onedarker",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("onedarker")
    -- end
  },
  {
    dir = "~/projects/personal/colorgen-nvim/dessert-fox",
    name = "dessert-fox",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("dessert-fox")
    -- end
  },
}
