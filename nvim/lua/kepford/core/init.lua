require("kepford.core.keymaps")
require("kepford.core.options")

vim.g.netrw_liststyle = 3
-- Disable Netrw banner
vim.g.netrw_banner = 0
-- Keep the current directory and the browsing directory synced. This helps you
-- avoid the move files error.
vim.g.netrw_keepdir = 0
-- Change the size of the Netrw window when it creates a split. I think 30% is fine.
vim.g.netrw_winsize = 30
