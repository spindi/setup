return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- we want to use `ruff` instead of `black`
        python = { fallback_lsp = "prefer" }
      }
    },
  },
}
