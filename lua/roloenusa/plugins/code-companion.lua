--[[
-- Code Companion integrates AI support for Neovim.
-- Using Claude Code via ACP (Agent Client Protocol)
-- ACP spawns the claude CLI directly - no server needed
--]]
return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "ravitemer/mcphub.nvim",
    },
    keys = {
        -- Toggle chat window
        { "<leader>ccc", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "[C]ode[C]ompanion [C]hat" },
        -- Open chat with current selection (visual mode)
        { "<leader>cci", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "[C]ode[C]ompanion [I]nsert" },
        -- Quick actions menu
        { "<leader>cca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "[C]ode[C]ompanion [A]ctions" },
        -- Inline assistant
        { "<leader>ccp", "<cmd>CodeCompanion Prompt<cr>", mode = { "n", "v" }, desc = "[C]ode[C]ompanion [P]rompt" },
    },
    opts = {
        adapters = {
            claude_code = function()
                return require("codecompanion.adapters").extend("claude_code", {
                    env = {
                        api_key = "cmd:echo ''", -- No API key needed, using CLI auth
                    },
                    schema = {
                        model = {
                            default = "claudecode-sonnet-4-5@20250929",
                        },
                    },
                })
            end,
        },
        strategies = {
            chat = {
                adapter = "claude_code",
            },
            inline = {
                adapter = "claude_code",
            },
            agent = {
                adapter = "claude_code",
            },
        },
        display = {
            chat = {
                window = {
                    layout = "vertical", -- vertical|horizontal|float
                    width = 0.35,
                    position = "right",
                },
                diff = {
                    enabled = true,
                    close_chat_at = 240,
                },
            },
            inline = {
                diff = {
                    enabled = true,
                    close_chat_at = 240,
                },
            },
        },
        opts = {
            log_level = "DEBUG", -- TRACE|DEBUG|ERROR|INFO
        },
    },
}
