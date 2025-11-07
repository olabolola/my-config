require("config.lazy")

-- Replace status line with command line when active
vim.o.cmdheight = 0

-- search is only case sensitive if I include an uppercase letter in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- share the clipboard between nvim and system
vim.opt.clipboard="unnamedplus"
vim.opt.termguicolors = true

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Global default for all filetypes
-- Use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

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

-- Enable ty LSP for Python
vim.lsp.enable('ty')

-- Enable LSP features when a language server attaches
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-config', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    
    -- Enable completion as you type
    if client and client.supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})
