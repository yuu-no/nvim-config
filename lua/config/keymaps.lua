-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = function (...)
  local args = {...}
  if #args == 3 then
    table.insert(args, { noremap = true });
  end
  LazyVim.safe_keymap_set(unpack(args))
end

local del = vim.keymap.del

map("t", "<Esc>", "<C-\\><C-n><Plug>(term-esc)")
map("n", "<Plug>(term-esc)<Esc>", "i<Esc>")

-- unmap LazyVim line move
del({ "n", "i" }, "<A-j>")
del({ "n", "i" }, "<A-k>")
