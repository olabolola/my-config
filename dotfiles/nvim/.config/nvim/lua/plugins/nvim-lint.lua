return {
  {
    'mfussenegger/nvim-lint',
    -- load when editing or saving buffers (optional, but speeds up startup)
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
      local lint = require('lint')

      -- Tell nvim-lint to use ruff for python files
      lint.linters_by_ft = {
        python = {'ruff'},
      }  -- :contentReference[oaicite:0]{index=0} :contentReference[oaicite:1]{index=1}

      -- Run lint on these events for _any_ filetype that has linters configured:
      vim.api.nvim_create_autocmd(
        { "BufWritePost", "BufReadPost", "InsertLeave" },
        {
          callback = function() lint.try_lint() end,
        }
      )
    end,
  },
}

