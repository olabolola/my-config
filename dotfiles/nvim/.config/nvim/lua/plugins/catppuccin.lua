return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "auto", -- default flavour
        })
        vim.cmd.colorscheme "catppuccin"
    end,
}
