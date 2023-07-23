require('telescope').setup({
	defaults = {
		vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		find_files = {
			-- search for hidden files but ignore files in .git folder 
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
		},
	},
})

require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")
