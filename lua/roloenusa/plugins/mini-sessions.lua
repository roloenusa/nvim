return {
  'echasnovski/mini.sessions',

  config = function()
    -- using the mini plugins
    require('mini.sessions').setup({
      -- Whether to read latest session if Neovim opened without file arguments
      autoread = false,
      -- Whether to write current session before quitting Neovim
      autowrite = true,
      -- Directory where global sessions are stored (use `''` to disable)
      directory =  '~/.local/share/nvim/sessions', --<"session" subdir of user data directory from |stdpath()|>,
      -- File for local session (use `''` to disable)
      file = 'Session.vim',

      -- Whether to print session path after action
      verbose = { read = true, write = true, delete = true },
    })

    local function is_in_session()
      -- Get the session directory and session name
      local session_name = vim.v.this_session

      -- If session_name is not empty, we are in a session
      if session_name and session_name ~= "" then
        print("You are currently in a session: " .. session_name)
        return true
      else
        return false
      end
    end

    vim.keymap.set('n', '<C-S><C-S>', function()
      local is_session = is_in_session()

      if is_session then
        return
      end

      -- vim.ui.input({
      --   prompt = 'Enter the session name',
      --   position = 'center',
      --   callback = function(input)
      --     print('----------- ' .. input)
      --     if input and input ~= '' then
      --       require('mini.sessions').new(input)
      --     end
      --   end
      -- })
      local input = vim.fn.input("Enter the session name: ")
      if input and input ~= '' then
        require('mini.sessions').write(input)
      end
    end, { desc = '[S]ession [S]ave' })
  end
}

