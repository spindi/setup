return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        black = {
          extra_args = { "--config", "black.toml" },
        },
      },
    },
  },
}
