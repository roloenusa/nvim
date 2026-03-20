return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000,
  config = function()
    require('tiny-inline-diagnostic').setup()
    -- Disable native virtual_text since tiny-inline handles it
    vim.diagnostic.config({ virtual_text = false })
  end
}
