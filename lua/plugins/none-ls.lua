local fgroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.prettier,
					require("none-ls.diagnostics.eslint_d"),
					--null_ls.builtins.completion.spell,
				},
				on_attach = function(client, bufnr)
					vim.api.nvim_clear_autocmds({ group = fgroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = fgroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end,
			})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
}
