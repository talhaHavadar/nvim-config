return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter_config = require("nvim-treesitter.configs")
		treesitter_config.setup({
			ensure_installed = {
				"lua",
				"javascript",
				"yaml",
				"c",
				"html",
				"rust",
				"bash",
				"css",
				"go",
				"make",
				"markdown",
				"perl",
				"python",
				"svelte",
				"toml",
			},
			highlight = { enable = true },
			indent = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
		vim.cmd("set nofoldenable")
	end,
}
