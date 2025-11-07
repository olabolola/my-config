return {
    -- Mason: package manager for LSPs, formatters, linters
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    },

    -- Mason-lspconfig: bridges mason and lspconfig
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        config = function()
            require('mason-lspconfig').setup({
                -- Automatically install these LSPs
                ensure_installed = {
                    'lua_ls',
                    'rust_analyzer',
                    'tsserver',
                    'jsonls',
                    'ruff',
                    'html',
                    'cssls',
                    'bashls',
                    'yamlls',
                    'dockerls',
                    'taplo',
                },
            })
        end,
    },
}
