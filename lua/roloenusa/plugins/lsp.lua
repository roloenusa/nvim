return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    "onsails/lspkind.nvim",
  },

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>rs", function()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients == 0 then
        vim.notify("No LSP clients attached", vim.log.levels.WARN)
        return
      end

      for _, client in ipairs(clients) do
        vim.notify("Stopping LSP client: " .. client.name)
        vim.lsp.stop_client(client.id, true)
      end

      vim.defer_fn(function()
        vim.cmd("edit") -- reload buffer to trigger LSP reattach
        vim.notify("LSP restarted", vim.log.levels.INFO)
      end, 300)
    end, { desc = "Restart current buffer’s LSP", silent = true })


    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
        keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

        -- opts.desc = "Restart LSP"
        -- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

        opts = { buffer = ev.buf }
        keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)

        -- Enable inlay hints if supported
        if vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
          opts.desc = "Toggle inlay hints"
          keymap.set('n', '<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
          end, opts)
        end
      end,
    })
    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    -- Enhanced snippet support
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = { 'documentation', 'detail', 'additionalTextEdits' }
    }

    -- Configure fidget for LSP progress notifications
    require("fidget").setup({
      notification = {
        override_vim_notify = false,
      },
    })

    -- Configure better diagnostics
    vim.diagnostic.config({
      virtual_text = {
        source = "if_many",  -- Show source if multiple diagnostics
        prefix = '●',        -- Could be '■', '▎', etc.
      },
      signs = true,
      underline = true,
      update_in_insert = false,  -- Don't update while typing
      severity_sort = true,      -- Show errors first
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
        format = function(diagnostic)
          return string.format("%s: %s", diagnostic.source or "LSP", diagnostic.message)
        end,
      },
    })

    -- Modern sign configuration
    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    require("mason").setup({})
    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "html",
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "typescript-language-server",
        "eslint-lsp",
      }
    })
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,

        -- TypeScript/JavaScript LSP
        ["ts_ls"] = function()
          require("lspconfig").ts_ls.setup({
            capabilities = capabilities,
            settings = {
              typescript = {
                preferences = {
                  importModuleSpecifierPreference = "relative",
                  importModuleSpecifierEnding = "minimal",
                }
              },
              javascript = {
                preferences = {
                  importModuleSpecifierPreference = "relative",
                  importModuleSpecifierEnding = "minimal",
                }
              }
            },
            init_options = {
              preferences = {
                importModuleSpecifierPreference = "relative",
                importModuleSpecifierEnding = "minimal",
              }
            }
          })
        end,

        -- Lua LSP
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                },
              }
            }
          })
        end,

        -- Rust LSP
        ["rust_analyzer"] = function()
          require("lspconfig").rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                cargo = {
                  allFeatures = true,
                },
                checkOnSave = {
                  command = "clippy",
                },
              }
            }
          })
        end,
      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local lspkind = require('lspkind')

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources(
        {
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        }
      ),

      -- Format the box for the snippets
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',  -- Show both icon and text
          maxwidth = 50,         -- Truncate if too wide
          ellipsis_char = '...', -- Ellipsis for long items
          show_labelDetails = true,
        })
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    -- Display the border to make text a bit more readable.
    local original_open_floating_preview = vim.lsp.util.open_floating_preview
    vim.lsp.util.open_floating_preview = function(contents, syntax, opts)
      opts = opts or {}
      opts.border = "rounded"
      opts.max_width = opts.max_width or 80
      opts.max_height = opts.max_height or 20
      return original_open_floating_preview(contents, syntax, opts)
    end

  end
}
