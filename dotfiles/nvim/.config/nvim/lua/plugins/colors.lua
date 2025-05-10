local function is_dark_mode()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  return result:match("Dark") ~= nil
end

return {
  "catppuccin/nvim",
  name="catppuccin",
  priority=1000,
  config = function()
    local is_dark = is_dark_mode()
    local flavour = is_dark and "mocha" or "latte"
    require("catppuccin").setup({
      flavour=flavour -- latte, frappe, macchiato, mocha
    })
  vim.cmd.colorscheme("catppuccin")
  end,
}
