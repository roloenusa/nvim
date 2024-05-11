return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    -- or                              , branch = '0.1.x',
    
    dependencies = { 
        'nvim-lua/plenary.nvim', 
        'nvim-tree/nvim-web-devicons'
    },

    config = function()
        -- [[ Telescope bindings ]]
        -- See `:help telescope.builtin`
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]iles' })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find files tracked by git' })
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end
}
