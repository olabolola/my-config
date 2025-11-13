-- ABOUTME: LSP configuration for Dockerfiles
local capabilities = require('cmp_nvim_lsp').default_capabilities()
return {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    root_markers = { 'compile_commands.json', '.git', 'compile_flags.txt', '.clangd' },
    capabilities = capabilities,
    settings = {
    },
}
