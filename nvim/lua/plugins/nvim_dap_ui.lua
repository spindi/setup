return {
  {
    "rcarriga/nvim-dap-ui",

    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
    },

    opts = {
      layouts = {
        {
          elements = {
            "stacks",
            "scopes",
            "breakpoints",
            "watches",
          },
          size = 0.25,
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 0.25,
          position = "bottom",
        },
      },
    },
  },
}
