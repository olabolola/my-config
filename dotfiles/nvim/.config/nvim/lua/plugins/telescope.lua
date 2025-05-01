return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  config = function()
    local builtin = require("telescope.builtin")

    local function get_git_root()
      local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      if vim.v.shell_error == 0 then
        return root
      else
        return vim.loop.cwd()
      end
    end

    vim.keymap.set("n", "<leader>ff", function()
      builtin.find_files({ cwd = get_git_root() })
    end)

    vim.keymap.set("n", "<leader>fg", function()
      builtin.live_grep({ cwd = get_git_root() })
    end)
  end
}

