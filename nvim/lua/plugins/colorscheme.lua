return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      on_highlights = function(hl, c)
        -- Override main editor background
        hl.Normal = { bg = "#101010" } -- Your hex color
        -- Override float/popup backgrounds
        -- hl.NormalFloat = { bg = "#1a1b26" }
        -- hl.FloatBorder = { bg = "#1a1b26" }
      end,
    },
  },
}
