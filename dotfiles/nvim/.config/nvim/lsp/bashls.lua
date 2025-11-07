-- ABOUTME: LSP configuration for Bash/Shell scripts
local capabilities = require('cmp_nvim_lsp').default_capabilities()
return {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'sh', 'bash' },
    root_markers = { '.git' },
    capabilities = capabilities,
    settings = {
        bashIde = {
            -- Enable shellcheck integration for additional diagnostics
            shellcheckPath = 'shellcheck',
            -- Glob pattern for finding shell script files
            globPattern = '*@(.sh|.inc|.bash|.command)',
        }
    }
}
