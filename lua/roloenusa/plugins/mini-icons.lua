--[[
  Icon provider for all plugins (replaces nvim-web-devicons)
]]--
return {
  'echasnovski/mini.icons',
  version = false,
  lazy = false,
  config = function()
    require('mini.icons').setup()
  end
}

