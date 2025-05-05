require("config.lazy")

-- Normal mode: Move current line up or down
-- vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { noremap = true, silent = true })
-- vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Visual mode: Move selected lines up or down
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.opt.ignorecase = true
vim.opt.smartcase = true -- case sensitive if I include an uppercase letter in search
-- Let pyright take care of python
-- Noticed slow startup times without this
vim.g.loaded_python3_provider = 0

vim.opt.termguicolors = true
-- share the clipboard between nvim and system
vim.opt.clipboard="unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

-- Global default for all filetypes
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2         -- A tab counts for 4 spaces
vim.opt.softtabstop = 2     -- When hitting <Tab>, insert 4 spaces

-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')


-- Clear highlights when hitting the escape key
vim.keymap.set('n', '<Esc>', '<Cmd>noh<CR><Esc>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set('n', '<leader>q', function()
  vim.diagnostic.setqflist({ open = true })
end, { desc = "Open diagnostics in quickfix list" })

