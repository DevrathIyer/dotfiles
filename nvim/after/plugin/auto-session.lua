require("auto-session").setup({
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
    pre_save_cmds = {
        function()
          local status_ok, api = pcall(require, "nvim-tree.api")
          if not status_ok then
            return
          end
          api.tree.close()
        end,
      },

      post_save_cmds = {
        function()
          local status_ok, api = pcall(require, "nvim-tree.api")
          if not status_ok then
            return
          end
          api.tree.toggle { focus = false, find_file = true }
        end,
      },

      post_restore_cmds = {
        function()
          local status_ok, api = pcall(require, "nvim-tree.api")
          if not status_ok then
            return
          end
          api.tree.toggle { focus = false, find_file = true }
        end,
      },
})
