-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Terraform: https://www.mukeshsharma.dev/2022/02/08/neovim-workflow-for-terraform.html
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function(args)
    if args.data.bufname:match("%.tfvars$") then
      vim.bo.filetype = "terraform"
    elseif args.data.bufname:match("%.terraformrc$") then
      vim.bo.filetype = "hcl"
    elseif args.data.bufname:match("terraform%.rc$") then
      vim.bo.filetype = "hcl"
    elseif args.data.bufname:match("%.tfstate$") then
      vim.bo.filetype = "json"
    end
  end,
})
