--[[
  DISABLED: Using auto-session instead (see sessions.lua)

  mini.sessions provides explicit, named session management but requires manual save/load.
  auto-session provides automatic per-directory sessions which better fits the workflow.

  Keeping this commented out for reference.
]]--
return {}
-- return {
--   'echasnovski/mini.sessions',
--
--   config = function()
--     -- using the mini plugins
--     require('mini.sessions').setup({
--       -- Whether to read latest session if Neovim opened without file arguments
--       autoread = false,
--       -- Whether to write current session before quitting Neovim
--       autowrite = true,
--       -- Directory where global sessions are stored (use `''` to disable)
--       directory =  '~/.local/share/nvim/sessions', --<"session" subdir of user data directory from |stdpath()|>,
--       -- File for local session (use `''` to disable)
--       file = 'Session.vim',
--
--       -- Whether to print session path after action
--       verbose = { read = true, write = true, delete = true },
--     })
--   end
-- }
