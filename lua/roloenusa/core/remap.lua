--[[
  Map Keybinds Configure keybinds
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Return to the file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Set 'jk' as alternative escape mode
vim.keymap.set('i', 'jk', '<Esc>')

-- Move text when higlighted
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep the cursor in the middle of the screen when jumping half screen
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep the cursor in the middle of the screen when jumping between terms
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Keep the original buffer when paste
vim.keymap.set('x', '<leader>p', "\"_dP")
vim.keymap.set('n', '<leader>d', "\"_d")
vim.keymap.set('v', '<leader>d', "\"_d")

-- Replace in place for the highlighted word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
