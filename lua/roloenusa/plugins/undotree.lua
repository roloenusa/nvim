return {
  'mbbill/undotree',

  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Open [u]ndo tree' })

    -- Setup the specific undotree directory to be in config for nvim.
    vim.opt.undodir = vim.fn.expand('~/.local/share/nvim/undodir')
  end
}

