return {
 {
   "zbirenbaum/copilot-cmp",
   enabled = function()
      -- do not load on personal machine
      return vim.env.MACHINE != "Conors-MacBook-Air.local"
   end,
   config = function ()
     require("copilot_cmp").setup()
   end
  },
}
