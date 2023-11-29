local builtin = require('telescope.builtin')

-- Fuzzy find files
vim.keymap.set('n', '<leader>o', builtin.find_files, {})

-- Fuzzy find git files
vim.keymap.set('n', '<leader>g', builtin.git_files, {})

-- Fuzzy find buffers
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

-- Search with grep
vim.keymap.set('n', '<leader>a', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
