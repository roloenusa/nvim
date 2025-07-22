return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  -- or                              , branch = '0.1.x',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons'
  },

  config = function()
    local actions = require('telescope.actions')
    require('telescope').setup({
      defaults = {
        mappings = {
          i = { -- Insert mode mappings
            ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
          },
          n = { -- Normal mode mappings
            ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
          },
        },
      }
    })

    -- [[ Telescope bindings ]]
    -- See `:help telescope.builtin`
    local builtin = require('telescope.builtin')


    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]iles' })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find files tracked by git' })
    vim.keymap.set('n', '<leader>pb', ':Telescope buffers<CR>', { desc = '[P]roject [B]uffers', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = '[P]roject [R]esume telesccope' })
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end,
      { desc = '[P]roject [S]earch via grep'})
  end
}

