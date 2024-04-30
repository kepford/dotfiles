-- set leader key to space
vim.g.mapleader = " "
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
vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({'n', 'v'}, '<leader>d', [["_d]])

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Explore
vim.keymap.set('n', "<Leader>e", ":Explore<CR>")

-- Disable Q
vim.keymap.set('n', "Q", "<nop>")

-- Source file with leader leader.
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Disable arrow keys.
vim.keymap.set('n', '<Up>', '<nop>')
vim.keymap.set('n', '<Down>', '<nop>')
vim.keymap.set('n', '<Left>', '<nop>')
vim.keymap.set('n', '<Right>', '<nop>')

-- Make arrowkey resize viewports
-- To resize the split by 1 use Left,Right,Up,Down

vim.keymap.set('n', '<Left>', ':vertical resize +1<CR>')
vim.keymap.set('n', '<Right>', ':vertical resize -1<CR>')
vim.keymap.set("n", '<Up>', ':resize +1<CR>')
vim.keymap.set("n", "<Down>", ':resize -1<CR>')

-- Copy current buffer file name and full path to system clipboard.
-- nnoremap <Leader>pp :let @+ = expand("%:p")<CR>
vim.keymap.set('n', '<Leader>pp', 'vim.cmd.let @+ = expand("%:p")')
--
--
-- " <Leader>p -- Show the path of the current file (mnemonic: path; useful when
-- " you have a lot of splits and the status line gets truncated).
-- nnoremap <Leader>p :echo expand('%')<CR>
-- 
-- " Copy current buffer file name and full path to system clipboard.
-- nnoremap <Leader>pp :let @+ = expand("%:p")<CR>

vim.keymap.set("n", "<leader>c", "<cmd>:r !gcalcli --nocolor agenda 7am 5pm --nodeclined --no-military --calendar=bkepford@redhat.com | sed '/^$/d' | cut -c 13- | sed 's/^/* /'<CR>");

-- :r !gcalcli --nocolor agenda 7am 5pm --nodeclined --no-military --calendar=bkepford@redhat.com | sed '/^$/d' | cut -c 13- | sed 's/^/* /'<CR>
--

