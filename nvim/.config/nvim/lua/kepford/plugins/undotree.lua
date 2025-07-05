return {
	"mbbill/undotree",
	lazy = false, -- load immediately
	config = function()
		vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle UndoTree" })
	end,
}
