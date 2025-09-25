return {
  'brenoprata10/nvim-highlight-colors',
  config = function()
    require('nvim-highlight-colors').setup {
      render = 'virtual', -- or 'foreground' or 'first_column'
      virtual_symbol = '■■',
      enable_named_colors = false,
      enable_virt_lines = true, -- only if nvim-0.10.0+
      virtual_symbol_position = 'eol', -- 'eol' or 'overlay' or 'right_align'
      -- Available formats: rgb, hsl, hex, hwb, cmyk, lab, lch
      -- Example: {'rgb', 'hex', 'hsl'}
      formats = { 'hex', 'rgb', 'hsl' },
      excluded_filetypes = { 'lazy', 'mason', 'toggleterm', 'TelescopePrompt' , 'Trouble', 'help' },
    }
  end
}

