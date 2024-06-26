return {
    {
        "tpope/vim-surround",
        version = "*",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = {
            --map_bs = false,
        },
    },
}
