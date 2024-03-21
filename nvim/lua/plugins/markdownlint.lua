-- disable specific errors when linting
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          args = { "--disable", "MD013", "--" },
        },
      },
    },
  },
}
