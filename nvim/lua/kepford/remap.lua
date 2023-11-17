vim.g.mapleader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set("n", "<Leader>q", vim.cmd.quit)

-- Save files faster
vim.keymap.set("n", "<Leader>w", vim.cmd.w)


-- Copy current buffer file name and full path to system clipboard.
-- nnoremap <Leader>pp :let @+ = expand("%:p")<CR>
-- vim.keymap.set("n", "<Leader>pp", vim.cmd.let @+ = expand("%:p"))
