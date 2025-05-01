return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  config = function()
    local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
    parser_config.gherkin = {
      install_info = {
        url = "https://github.com/tonycsoka/tree-sitter-gherkin", -- community grammar
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "feature",
    }

    require('nvim-treesitter.configs').setup({
      ensure_installed = { "lua", "python", "go", "javascript" , "groovy", "terraform", "sql", "gherkin" },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          node_decremental = "grm",
        },
      },
      textobjects = {
        select = {
          enable=true,
          lookahead=true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
          },
        },
      },
    })
  end
}

