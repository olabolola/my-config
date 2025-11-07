return {
    'stevearc/conform.nvim',
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                python = { 'ruff_format' },
                html = { 'prettierd', 'prettier', stop_after_first = true },
                css = { 'prettierd', 'prettier', stop_after_first = true },
                scss = { 'prettierd', 'prettier', stop_after_first = true },
                javascript = { 'prettierd', 'prettier', stop_after_first = true },
                javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
                typescript = { 'prettierd', 'prettier', stop_after_first = true },
                typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
                json = { 'prettierd', 'prettier', stop_after_first = true },
            },
        })
    end,
}
