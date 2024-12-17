return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
    opts = {
      suggestion = { enabled = true, auto_trigger = true },
      panel = { enabled = true, auto_refresh = true },
    },
  },
}
