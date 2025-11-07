require("config.lazy")

-- Replace status line with command line when active
vim.o.cmdheight = 0

-- search is only case sensitive if I include an uppercase letter in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- share the clipboard between nvim and system
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Always show sign column to prevent screen shifting
vim.opt.signcolumn = 'yes'

-- Keep cursor away from screen edges
vim.opt.scrolloff = 8

-- Global default for all filetypes
-- Use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Clear highlights when hitting the escape key
vim.keymap.set('n', '<Esc>', '<Cmd>noh<CR><Esc>', { noremap = true, silent = true })

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Format file or selection
vim.keymap.set({'n', 'v'}, '<leader>f', function()
    require('conform').format({ async = false, lsp_fallback = true })
end, { desc = 'Format file or selection' })

-- Show signature help (function parameters) while typing
vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature help' })

-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = {
        prefix = '●',
        severity = { min = vim.diagnostic.severity.WARN },
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- Define diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- LSP keybindings
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })

-- Diagnostics navigation
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

-- quickfix list stuff
vim.keymap.set('n', '<]-q>', ':cnext<CR>', { silent = true })
vim.keymap.set('n', '<[-q>', ':cprevious<CR>', { silent = true })

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- persistent undos across sessions
vim.opt.undofile = true

vim.lsp.enable('ty')
vim.lsp.enable('ruff')
vim.lsp.enable('tsserver')
vim.lsp.enable('html')
vim.lsp.enable('cssls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('jsonls')
vim.lsp.enable('lua_ls')
