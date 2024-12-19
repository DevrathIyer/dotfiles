local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require('telescope.actions').close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format('%s %s', 'edit', j.path))
      end
    end
  else
    require('telescope.actions').select_default(prompt_bufnr)
  end
end

require('telescope').setup({
    defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            i = {
                ['<CR>'] = select_one_or_multi,
              }
        },
    },
    extensions = {
        file_browser = {
            initial_mode = "normal",
            hijack_netrw = true,
        },
    },
	pickers = {
		find_files = {
			-- search for hidden files but ignore files in .git folder
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
		},
        buffers = {
            ignore_current_buffer = true,
            initial_mode = "normal",
            sort_mru = true,
        },
	},
})
vim.keymap.set("n", "<leader>f", ":Telescope file_browser<CR>", {desc = "File Browser"})
vim.keymap.set("n", "<leader>d", require('telescope.builtin').find_files, {desc = "File Grep"})
vim.keymap.set("n", "<Leader>g", require('telescope.builtin').live_grep, {desc = "Workdir Live Grep"})
vim.keymap.set("n", "<Leader>j", require('telescope.builtin').buffers, {desc = "Open Buffers"})
vim.keymap.set("n", "<Leader>k", require('telescope.builtin').quickfix, {desc = "Quickfix Menu"})

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require("telescope").load_extension("ui-select")
