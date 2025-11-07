-- ABOUTME: LSP configuration for Rust
-- Get capabilities from cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml', 'rust-project.json' },
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy", -- Use clippy for better lints
            },
        }
    }
}
