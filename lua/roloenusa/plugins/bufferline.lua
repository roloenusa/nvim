--[[
  Buffer tabs at the top of the screen for easier navigation
]]--
return {
  'akinsho/bufferline.nvim',
  dependencies = 'echasnovski/mini.icons',
  config = function()
    local bg_tab_color = "#1d3b53"
    require('bufferline').setup({
      highlights = {
        buffer_selected = {
          fg = '#ecc48d',
          bold = false,
        },
        separator = {
          fg = bg_tab_color,
        },
        separator_selected = {
          fg = bg_tab_color,
        },
      },
      options = {
        numbers = "buffer_id",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "slant",
        always_show_bufferline = true,
      },
    })

    -- Buffer navigation
    vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
  end
}

