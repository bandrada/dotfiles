return {
    -- add themes 
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    { "folke/tokyonight.nvim", name = "tokyonight", priority = 1000 },
    -- Configure LazyVim to load theme 
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
            --colorscheme = "tokyonight",
        },
    },
}
