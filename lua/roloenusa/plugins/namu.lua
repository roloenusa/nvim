return {
  "bassamsdata/namu.nvim",
  config = function()
    require("namu").setup({
      namu_symbols = {
        enable = true,
        options = {
          movement = {
            next = { "<C-j>", "<DOWN>" },
            previous = { "<C-k>", "<UP>" },
            close = { "<ESC>" },
            select = { "<CR>" },
            delete_word = {},
            clear_line = {},
          },
          AllowKinds = {
            typescript = {
              "Method",
              "Class",
              "Module",
              "Enum",
              "Interface",
              "Field",
            }
          },
        },
      },
      ui_select = { enable = false },
      colorscheme = { enable = false },
    })

    vim.keymap.set("n", "<leader>ss", ":Namu symbols<cr>", {
      desc = "Search: LSP symbols",
      silent = true,
    })
  end,
}
