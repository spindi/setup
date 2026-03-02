return {
  "olimorris/codecompanion.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: for autocompletion
    -- "nvim-telescope/telescope.nvim", -- Optional: for telescope
  },

  opts = {
    completers = { "codecompanion.nvim" },

    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = {
              default = "mistral:latest", -- default model
            },
            env = {
              url = "http://localhost:11434", -- hostname
            },
          },
        })
      end,
    },
    strategies = {
      cmd = {
        adapter = "ollama",
        model = "mistral:latest",
      },

      chat = {
        adapter = "ollama",
        model = "mistral:latest",
      },

      inline = {
        adapter = "ollama",
        model = "mistral:latest",
      },
    },
  },
}
