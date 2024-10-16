--[[
-- provides tabs at the top of the screen. It makes navigation easier
--]]
return {
  'akinsho/bufferline.nvim',
  requires = 'nvim-tree/nvim-web-devicons', -- Optional, for file icons
  config = function()
    local bg_tab_color = "#1d3b53"
    require('bufferline').setup {
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
        numbers = "buffer_id", -- Shows buffer index and number
        diagnostics = "nvim_lsp", -- Show LSP diagnostics in the bufferline
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "slant", -- Or "thick", "thin", etc.
        always_show_bufferline = true,
      },
    }

    -- Keybindings to navigate between buffers
    -- Ommitting this for now so i can better learn the buffer navigation:
    -- :ls -- List all buffers
    -- :bp -- previous
    -- :bn -- next
    -- :b# -- jump to buffer
    -- :bd# -- delete buffer
    vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
  end
}

