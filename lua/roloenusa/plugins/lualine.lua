--[[
  Status line with mode, branch, file, and LSP breadcrumbs
]]--
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'echasnovski/mini.icons', 'SmiteshP/nvim-navic' },
  config = function()
    require('nvim-navic').setup({
      lsp = {
        auto_attach = true,
      },
      highlight = true,
      separator = "  ",
      depth_limit = 0,
      depth_limit_indicator = "..",
      safe_output = true,
      click = true,
    })

    require('lualine').setup({
      options = { theme = "nightfly" },
      winbar = {
        lualine_c = {
          {
            "navic",
            color_correction = nil,
            navic_opts = nil
          }
        }
      }
    })

    vim.o.winbar = '%f%='
  end
}
