return {
  'sethen/line-number-change-mode.nvim',
  config = function()
    local colors = {
      -- StatusLine background color.
      color0 = '#2c3043',

      -- Mode colors.
      color1 = '#82aaff',
      color2 = '#21c7a8',
      color3 = '#ae81ff',
      color4 = '#ecc48d',
      color5 = '#ff5874',

      -- Mode text color.
      color6 = '#092236',

      -- StatusLineNC foreground.
      color7 = '#a1aab8',

      -- Normal text color.
      color8 = '#c3ccdc',
    }

    require("line-number-change-mode").setup({
      mode = {
        i = {
          bg = colors.color2,
          fg = colors.color6,
          bold = true,
        },
        n = {
          bg = colors.color6,
          fg = colors.color1,
          bold = true,
        },
        R = {
          bg = colors.color5,
          fg = colors.color6,
          bold = true,
        },
        v = {
          bg = colors.color3,
          fg = colors.color6,
          bold = true,
        },
        V = {
          bg = colors.color3,
          fg = colors.color6,
          bold = true,
        },
      }
    })
  end
}

