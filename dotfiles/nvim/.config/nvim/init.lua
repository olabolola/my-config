require("config.lazy")

vim.opt.termguicolors = true
-- share the clipboard between nvim and system
vim.opt.clipboard="unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

-- Global default for all filetypes
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.shiftwidth = 4      -- Indent by 4 spaces
vim.opt.tabstop = 4         -- A tab counts for 4 spaces
vim.opt.softtabstop = 4     -- When hitting <Tab>, insert 4 spaces

-- NvimTree Keymaps
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = "Toggle NvimTree" })
vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>', { desc = "Refresh NvimTree" })
vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', { desc = "Focus NvimTree" })

-- Clear highlights when hitting the escape key
vim.keymap.set('n', '<Esc>', '<Cmd>noh<CR><Esc>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
