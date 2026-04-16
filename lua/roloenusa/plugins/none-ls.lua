return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")

    local eslint_config_files = {
      ".eslintrc",
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.yaml",
      ".eslintrc.yml",
      ".eslintrc.json",
      "eslint.config.js",
      "eslint.config.mjs",
      "eslint.config.cjs",
    }

    local prettier_config_files = {
      ".prettierrc",
      ".prettierrc.json",
      ".prettierrc.yml",
      ".prettierrc.yaml",
      ".prettierrc.json5",
      ".prettierrc.js",
      ".prettierrc.cjs",
      ".prettierrc.mjs",
      "prettier.config.js",
      "prettier.config.cjs",
      "prettier.config.mjs",
    }

    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),
        require("none-ls.code_actions.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),
        null_ls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file(prettier_config_files)
          end,
        }),
      },
    })
  end,
}
