require("config.lazy")

-- Replace status line with command line when active
vim.o.cmdheight = 0

-- Visual mode: Move selected lines up or down
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

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
vim.opt.tabstop = 2 -- A tab counts for 2 spaces
vim.opt.softtabstop = 2 -- When hitting <Tab>, insert 2 spaces

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

vim.keymap.set('n', '<leader>q', function()
  vim.diagnostic.setqflist({ open = true })
end, { desc = "Open diagnostics in quickfix list" })


-- Configure the "ty" language server for python
vim.lsp.config('ty', {
  cmd = { "ty",  "server" },
  filetypes = { "python" },
  root_markers = { ".git", "pyproject.toml", "setup.py", "requirements.txt" },
  settings = {
    ty = {
      -- any ty-specific settings go here
    }
  }
})
