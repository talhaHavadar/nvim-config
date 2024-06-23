return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<C-t>]],
            terminal_mappings = false,
        })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        end

        vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
    end,
}
