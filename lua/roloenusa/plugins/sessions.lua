--[[
  ACTIVE SESSION MANAGER

  auto-session provides automatic per-directory session management.
  Sessions are saved/restored automatically based on cwd.

  Alternative: mini.sessions (see mini-sessions.lua - currently disabled)
]]--

return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/tmp" },
    })
  end
}

