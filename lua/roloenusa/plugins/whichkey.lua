-- return { -- Useful plugin to show you pending keybinds.
--   'folke/which-key.nvim',
--   event = 'VimEnter', -- Sets the loading event to 'VimEnter'
--   config = function() -- This is the function that runs, AFTER loading
--     require('which-key').setup()
--
--     -- Document existing key chains
--     require('which-key').register {
--       { "", group = "[W]orkspace" },
--       { "", desc = "", hidden = true },
--       { "", group = "[C]ode" },
--       { "", group = "[S]earch" },
--       { "", group = "[D]ocument" },
--       { "", group = "[R]ename" },
--       { "", group = "[T]oggle" },
--       { "", group = "[H]arpoon" },
--     }
--   end,
-- }
--
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
  {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    local wk = require("which-key")
    wk.add(
      { '<leader>h', group = '[H]arpoon' },
      { '<leader>p', group = '[p]roject Ops' }
    )
  end
}

