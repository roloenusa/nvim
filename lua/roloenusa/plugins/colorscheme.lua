-- Colorscheme configuration
--
-- Nightfly options set before the actual colorscheme is loaded
-- Documentation can be found here:
-- https://github.com/bluz71/vim-nightfly-colors

-- Better contrast for float windows. Default is false
vim.g.nightflyNormalFloat = true

-- Custom highlights to apply after the colorscheme is loaded
-- This provides a better border and background for floating windows
local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "nightfly",
  callback = function()
    ----
    -- This is an example. If you wanted to change the function colors
    --
    -- vim.api.nvim_set_hl(0, "Function", { fg = "#FF0000", bold = true })
    ----
    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#417aa8', bg = '#011627' }) -- Border for floating windows
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#02121f'}) -- Body for selection in floats
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
      vim.cmd([[colorscheme nightfly]])
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    -- config = function()
    --     vim.cmd([[colorscheme catppuccin]])
    -- end
  },
}


