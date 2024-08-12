-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})


-- Disable autoformat for lua files
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "cpp", "c" },
--   callback = function()
--     vim.b.autoformat = true
--   end,
-- })
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     -- group = "FormatAutogroup",
--     callback = function()
--         vim.lsp.buf.format()
--         -- Files handled by `lsp-format`
--         if (ft ~= "c") and (ft ~= "cpp") and (ft ~= "racket") then
--             -- vim.lsp.buf.format()
--             -- vim.cmd("FormatWrite")
--             -- else
--             --     vim.lsp.buf.format()
--             -- vim.lsp.buf.format()
--         end
--     end,
-- })
