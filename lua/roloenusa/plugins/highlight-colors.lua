--[[
  Color highlighting for hex/rgb/hsl values
]]--
return {
  'brenoprata10/nvim-highlight-colors',
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require('nvim-highlight-colors').setup({
      render = 'virtual',
      virtual_symbol = '■■',
      enable_named_colors = false,
      virtual_symbol_position = 'eol',
      formats = { 'hex', 'rgb', 'hsl' },
      excluded_filetypes = { 'lazy', 'mason', 'toggleterm', 'TelescopePrompt', 'Trouble', 'help' },
    })
  end
}

