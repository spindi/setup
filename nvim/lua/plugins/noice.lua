-- Description: Configuration for noice.nvim
-- This shows the LSP hover window
-- K also prompts
return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
}
