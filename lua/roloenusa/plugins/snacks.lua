return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- bigfile = { enabled = true },
    -- dashboard = { enabled = true },
    -- explorer = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    -- picker = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },

    bufdelete = {
      enabled = true,
      -- close the buffer when the last window is closed
      close_on_last_window = true,
      -- close the buffer when the last window is closed, but only if there are no other buffers open
      close_on_last_buffer = true,
    },

    explorer = {
      -- your explorer configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      enabled = true,
      show_hidden = true,
      show_dotfiles = true,
      show_git_ignored = true,
      show_git_status = true,
      show_icons = true,
      -- show_file_sizes = true,
      show_file_types = true,
      replace_netrw = true,
    }
  },

  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },

      -- Delete the buffer, but keep the window layout
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
  }
}

