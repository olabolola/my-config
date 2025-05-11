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
        diffview = true,
      },
    })

    vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", {desc = "Open Neogit"})
    vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", {desc = "Open diff view"})
    vim.keymap.set("n", "<leader>gl", ":Neogit log<CR>", {desc = "Open Neogit log"})
    vim.keymap.set("n", "<leader>gp", ":Neogit push<CR>", {desc = "Neogit push"})

    -- View git log for selected lines
    vim.keymap.set("v", "<leader>gl", function()
      local file = vim.fn.expand("%")
      vim.cmd([[execute "normal! \<ESC>"]])
      local line_start = vim.fn.getpos("'<")[2]
      local line_end = vim.fn.getpos("'>")[2]
      require("neogit").action("log", "log_current", { "-L" .. line_start .. "," .. line_end .. ":" .. file })()
    end, { desc = "Neogit Log for this range"})
  end,
}
