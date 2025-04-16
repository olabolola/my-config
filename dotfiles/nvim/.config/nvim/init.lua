require("config.lazy")
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Global default for all filetypes
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.shiftwidth = 4      -- Indent by 4 spaces
vim.opt.tabstop = 4         -- A tab counts for 4 spaces
vim.opt.softtabstop = 4     -- When hitting <Tab>, insert 4 spaces

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
