--[[
-- The bottom status bar.
-- Indicators for the current mode, branch, file, etc.
--]]
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'SmiteshP/nvim-navic' },
  config = function()
    require('nvim-navic').setup({
      -- icons = {
      --   File          = "󰈙 ",
      --   Module        = " ",
      --   Namespace     = "󰌗 ",
      --   Package       = " ",
      --   Class         = "󰌗 ",
      --   Method        = "󰆧 ",
      --   Property      = " ",
      --   Field         = " ",
      --   Constructor   = " ",
      --   Enum          = "󰕘",
      --   Interface     = "󰕘",
      --   Function      = "󰊕 ",
      --   Variable      = "󰆧 ",
      --   Constant      = "󰏿 ",
      --   String        = "󰀬 ",
      --   Number        = "󰎠 ",
      --   Boolean       = "◩ ",
      --   Array         = "󰅪 ",
      --   Object        = "󰅩 ",
      --   Key           = "󰌋 ",
      --   Null          = "󰟢 ",
      --   EnumMember    = " ",
      --   Struct        = "󰌗 ",
      --   Event         = " ",
      --   Operator      = "󰆕 ",
      --   TypeParameter = "󰊄 ",
      -- },
      lsp = {
        auto_attach = true,
        preference = nil,
      },
      highlight = true,
      separator = "  ",
      depth_limit = 0,
      depth_limit_indicator = "..",
      safe_output = true,
      lazy_update_context = false,
      click = true,
      -- format_text = function(text)
      --   return text
      -- end,
    })

    require('lualine').setup({
      options = { theme = "nightfly" },

      -- sections = {
      --   lualine_c = {
      --     {
      --       "navic",
      --
      --       -- Component specific options
      --       color_correction = nil, -- Can be nil, "static" or "dynamic". This option is useful only when you have highlights enabled.
      --       -- Many colorschemes don't define same backgroud for nvim-navic as their lualine statusline backgroud.
      --       -- Setting it to "static" will perform a adjustment once when the component is being setup. This should
      --       --   be enough when the lualine section isn't changing colors based on the mode.
      --       -- Setting it to "dynamic" will keep updating the highlights according to the current modes colors for
      --       --   the current section.
      --
      --       navic_opts = nil  -- lua table with same format as setup's option. All options except "lsp" options take effect when set here.
      --     }
      --   }

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

