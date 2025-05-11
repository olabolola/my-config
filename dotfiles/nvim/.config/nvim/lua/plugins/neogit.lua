return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
  require("neogit").setup({
    integrations = {
      diffview = True,
    },
  })

  vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", {desc = "Open Neogit"})
  vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", {desc = "Open diff view"})
  vim.keymap.set("n", "<leader>gl", ":Neogit log<CR>", {desc = "Open Neogit log"})
  vim.keymap.set("n", "<leader>gp", ":Neogit push<CR>", {desc = "Neogit push"})
end,
}
