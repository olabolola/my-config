-- ABOUTME: LSP configuration for ty (Astral's Python language server)
-- ABOUTME: Provides type checking and Python language support

return {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
  settings = {
    ty = {
      -- ty language server settings go here
    }
  }
}
