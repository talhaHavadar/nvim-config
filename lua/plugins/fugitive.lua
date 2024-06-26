return {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
        vim.keymap.set("n", "<C-g>s", "<cmd>Git <cr>")
    end,
}
