--[[
    Makes commenting block and lines easy
]]--
return {
    'numToStr/Comment.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = true
}
