return {
  "olimorris/codecompanion.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: for autocompletion
    "nvim-telescope/telescope.nvim", -- Optional: for telescope
  },

  opts = {
    completers = { "codecompanion.nvim" },
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = {
              default = "qwen3:8b", -- default model
            },
            env = {
              url = "http://localhost:11434/v1", -- hostname
            },
          },
        })
      end,
    },
    display = {
      action_palette = {
        width = 95,
        height = 10,
        prompt = "Prompt ",
        provider = "default",
        opts = {
          show_preset_actions = true,
          show_preset_prompts = true,
          title = "CodeCompanion Actions",
        },
      },
    },
    strategies = {
      cmd = {
        adapter = "ollama",
        model = "qwen3:8b",
      },

      chat = {
        adapter = "ollama",
        model = "qwen3:8b",
      },

      inline = {
        adapter = "ollama",
        model = "qwen3:8b",
      },
    },
    mcp = {
      servers = {
        ["docker-mcp"] = {
          cmd = { "docker", "run", "-i", "--rm", "mcp/mcp-python-refactoring" },
        },
      },
    },
  },
  keys = {
    { "<leader>a", nil, desc = "ai" },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "Actions", mode = { "n", "v" } },
    { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "Inline", mode = { "n", "v" } },
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat", mode = { "n", "v" } },
  },
}
