return {
  "David-Kunz/gen.nvim",
  opts = {
    model = "qwen3:8b",
    show_prompt = true,
    show_model = true,

  },
  keys = {
    { "<leader>a", nil, desc = "ai" },
    { "<leader>ag", "<cmd>Gen<cr>", desc = "Gen", mode = { "n", "v" } },
  },
}
