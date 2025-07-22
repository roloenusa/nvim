--[[
  Map Keybinds Configure keybinds
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Return to the file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[P]roject [V]iew tree'})

-- Set 'jk' as alternative escape mode
vim.keymap.set('i', 'jj', '<Esc>')

-- Move text when higlighted
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Keep the cursor in the middle of the screen when jumping half screen
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Jump half-screen down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Jump half-screen up' })

-- Keep the cursor in the middle of the screen when jumping between terms
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next term' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous term' })

-- Keep the original buffer when paste
vim.keymap.set('x', '<leader>p', "\"_dP", { desc = 'Paste but keep original buffer' })
vim.keymap.set('n', '<leader>d', "\"_d", { desc = 'Delete but keep original buffer' })
vim.keymap.set('v', '<leader>d', "\"_d", { desc = 'Delete but keep original buffer' })

-- Replace in place for the highlighted word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Highlight and replace interactive' })

-- Splits navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

