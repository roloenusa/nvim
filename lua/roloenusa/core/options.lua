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
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
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
vim.opt.colorcolumn = "80,120"

-- Tree browser
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Cursor line
vim.opt.cursorline = true

-- Remove trailing whitespace on save while keeping cursor position
local trim_whitespace_group = vim.api.nvim_create_augroup('TrimWhitespace', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = trim_whitespace_group,
  pattern = '*',
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
  end,
})

-- -- Ensure there is an empty line at the end of every file
-- function newline()
--     local current_line = vim.api.nvim_buf_get_lines(0, -2, -1, false)[1]
--     if current_line ~= '' then
--       vim.api.nvim_buf_set_lines(0, -1, -1, false, {''})
--     end
-- end
--
-- vim.cmd([[
--   augroup jd_new_line
--     autocmd!
--     autocmd BufWritePre * lua newline()
--   augroup END
-- ]])

-- Ensure file ends with exactly one newline
function _G.ensure_final_newline()
  local lastline = vim.api.nvim_buf_line_count(0)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Remove all trailing blank lines
  while lastline > 1 and lines[lastline] == '' do
    table.remove(lines, lastline)
    lastline = lastline - 1
  end

  -- Set the cleaned lines
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

  -- Ensure endofline is set (this adds the final \n)
  vim.bo.endofline = true
  vim.bo.fixendofline = true
end

local final_newline_group = vim.api.nvim_create_augroup('jd_final_newline', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = final_newline_group,
  pattern = '*',
  callback = ensure_final_newline,
})

-- Add a visual indicator below the last line if it ends with newline
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "EofIndicator", { fg = "#526294" })
  end,
})

-- Cache namespace creation outside autocmd
local eof_ns = vim.api.nvim_create_namespace("eof_indicator")

-- Shared function to draw EOF indicator
local function draw_eof_indicator()
  -- Don't draw if in insert mode
  if vim.fn.mode():match('[iR]') then
    return
  end

  local buf = vim.api.nvim_get_current_buf()

  -- Clear existing indicators
  vim.api.nvim_buf_clear_namespace(buf, eof_ns, 0, -1)

  -- Check if the buffer actually ends with a newline
  if not vim.bo[buf].eol then
    return
  end

  local last_line = vim.api.nvim_buf_line_count(buf)
  local win = vim.api.nvim_get_current_win()
  local win_width = vim.api.nvim_win_get_width(win)

  local text = "[ NL EOF ✓ ]"
  local start_char = "└"
  local end_char = "┘"
  local content_length = vim.fn.strdisplaywidth(start_char .. text .. end_char)
  local total_padding = win_width - content_length
  local left_padding = math.floor(total_padding / 2)
  local right_padding = total_padding - left_padding

  -- Add a visual line indicator below the last line
  vim.api.nvim_buf_set_extmark(buf, eof_ns, last_line - 1, 0, {
    virt_lines = { { {
      start_char ..
      string.rep("─", left_padding) ..
      text ..
      string.rep("─", right_padding) ..
      end_char,
      "EofIndicator"
    } } },
    virt_lines_above = false,
  })
end

-- Single autocmd for multiple events
vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "BufWritePost", "TextChanged", "InsertLeave" }, {
  callback = draw_eof_indicator
})

-- Debounced resize handler
local resize_timer = nil
vim.api.nvim_create_autocmd("WinResized", {
  callback = function()
    if resize_timer then
      vim.fn.timer_stop(resize_timer)
    end
    resize_timer = vim.fn.timer_start(50, draw_eof_indicator)
  end,
})

-- Hide indicator when entering insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.api.nvim_buf_clear_namespace(vim.api.nvim_get_current_buf(), eof_ns, 0, -1)
  end,
})
