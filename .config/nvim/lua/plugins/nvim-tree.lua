return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = true,
			},
			view = {
				adaptive_size = true,
			},
		})

		-- Make nvim-tree transparent using Lua
		local highlight = vim.api.nvim_set_hl

		-- Set highlights for transparency
		highlight(0, "NvimTreeNormal", { bg = "NONE" })
		highlight(0, "NvimTreeNormalNC", { bg = "NONE" })
		highlight(0, "NvimTreeEndOfBuffer", { bg = "NONE" })
		highlight(0, "NvimTreeVertSplit", { bg = "NONE" })
	end,
}
