-- local colorscheme = "darkplus"
-- local colorscheme = "vscode"
-- local colorscheme = "material"
-- local colorscheme = "tokyonight-night"
-- local colorscheme = "tokyonight-moon"
-- local colorscheme = "tokyonight-day"
-- local colorscheme = "onedarker"

-- local colorscheme = "material"
-- local colorscheme = "vscode"
-- local colorscheme = "tokyonight-day"
-- local colorscheme = "solarized"
local colorscheme = "catppuccin"

-- vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

vim.g.material_style = "oceanic"

vim.g.onedarker_italic_keywords = true

vim.g.onedarker_italic_functions = false

vim.g.onedarker_italic_comments = true

vim.g.onedarker_italic_loops = false

vim.g.onedarker_italic_conditionals = false

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  -- vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
