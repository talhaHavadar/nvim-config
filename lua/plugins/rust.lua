return {
	{
		"saecki/crates.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
        tag = 'stable',
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show()
		end,
	},
}
