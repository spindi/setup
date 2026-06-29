return {
  {
    "nvim-mini/mini.files",
    opts = function(_, opts)
      opts.mappings = opts.mappings or {}
      opts.mappings.go_in = "<Right>"
      -- opts.mappings.go_in_plus = "<Down>"
      opts.mappings.go_out = "<Left>"
      -- opts.mappings.go_out_plus = "<Up>"

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id

          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
          end

          map("gs", function()
            local MiniFiles = require("mini.files")
            local target = MiniFiles.get_explorer_state().target_window
            if target == nil then
              return
            end
            vim.api.nvim_win_call(target, function()
              vim.cmd("belowright split")
            end)
            MiniFiles.set_target_window(vim.api.nvim_get_current_win())
          end, "Split below")

          map("gv", function()
            local MiniFiles = require("mini.files")
            local target = MiniFiles.get_explorer_state().target_window
            if target == nil then
              return
            end
            vim.api.nvim_win_call(target, function()
              vim.cmd("vsplit")
            end)
            MiniFiles.set_target_window(vim.api.nvim_get_current_win())
          end, "Split right")

          map("gc", function()
            local MiniFiles = require("mini.files")
            local entry = MiniFiles.get_fs_entry()
            if entry == nil then
              return
            end
            local dir = vim.fs.dirname(entry.path)
            if dir then
              vim.fn.chdir(dir)
            else
              vim.fn.chdir(vim.fs.dirname(dir))
            end
          end, "Set cwd")

          map("g.", function()
            local MiniFiles = require("mini.files")
            local state = vim.b.minifiles_show_dotfiles
            vim.b.minifiles_show_dotfiles = not state
            MiniFiles.refresh()
          end, "Toggle dotfiles")
        end,
      })
    end,
  },
}
