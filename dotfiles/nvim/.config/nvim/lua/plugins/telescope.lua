return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { { 'nvim-telescope/telescope-fzf-native.nvim', build='make' }, 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = {
          "poetry.lock", "node_modules", "uv.lock", ".venv", ".git"
        }
      }
    }
    local builtin = require("telescope.builtin")

    local function get_git_root()
      local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      if vim.v.shell_error == 0 then
        print(root)
        return root
      else
        return vim.loop.cwd()
      end
    end

    -- Find files
    vim.keymap.set("n", "<leader>ff", function()
      builtin.find_files({ cwd = get_git_root(), hidden=true })
    end)

    -- Find contents inside files
    vim.keymap.set("n", "<leader>fg", function()
      builtin.live_grep({ cwd = get_git_root(), hidden=true })
    end)

    -- Search for the word underneath the cursor
    vim.keymap.set("n", "<leader>fw", function()
      builtin.grep_string({ cwd = get_git_root(), hidden=true })
    end)

    -- Search contents of current file
    vim.keymap.set("n", "<leader>fs", function()
      builtin.live_grep({ search_dirs = { vim.fn.expand("%:p") } })
    end)

    vim.keymap.set("n", "<leader>fc", function()
      builtin.find_files({ cwd =  vim.fn.expand("~/my-config"), hidden=true, no_ignore=false, file_ignore_patterns={".git/"} })
    end)
  end
}

