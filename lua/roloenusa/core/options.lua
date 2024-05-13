--[[
  Configure options
--]]

-- Set number lines
vim.opt.number = true

-- allow using the mouse to set cursor position, highlight, etc.
vim.o.mouse = 'a'

-- Enable nerd font
vim.g.have_nerd_font = true

-- Sync clipboard between OS and Neovim
-- See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Sets how newvim will display certain whitespace character in the editor.
-- See `:help 'list'`
-- and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·' }

-- Show which line your cursor is on
-- vim.opt.cursorline = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Indentation configurations
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Highlight searches
vim.opt.hlsearch = false

-- Highlight incremental search
vim.opt.incsearch = true

-- Terminal colors
vim.opt.termguicolors = true

-- Limit the number of lines that it will scroll on the screen
-- This helps readability as the cursor reaches the bottom of the screen.
vim.opt.scrolloff = 8

-- Allow to mark the columns with signs.
vim.opt.signcolumn = "yes"

-- Color the columns at a certain length.
vim.opt.colorcolumn = "80"

-- Tree browser
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Cursor line
vim.opt.cursorline = true

-- Remove trailing whitespace on save while keeping cursor position
vim.cmd[[
  autocmd BufWritePre * let save_cursor = getpos('.')
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd BufWritePost * call setpos('.', save_cursor)
]]

