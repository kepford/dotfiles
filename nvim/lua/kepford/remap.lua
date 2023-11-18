vim.g.mapleader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set("n", "<Leader>q", vim.cmd.quit)

-- Save files faster
vim.keymap.set("n", "<Leader>w", vim.cmd.w)

-- In visual mode move lines through the file.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place when using J to join lines.
vim.keymap.set("n", "J", "mzJ`z")

-- Keeps cursor in middle while page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keys cursor in middle when going through search terms.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- Copy current buffer file name and full path to system clipboard.
-- nnoremap <Leader>pp :let @+ = expand("%:p")<CR>
-- vim.keymap.set("n", "<Leader>pp", vim.cmd.let @+ = expand("%:p"))
--
--
--
--
--
--
--
--
--
--
--
--
-- vim
--
--
--
--
--
--
--
-- vim
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
-- vim
--
--
--
--
--
--
--
--
--
--
--
-- 
