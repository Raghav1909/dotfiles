local config = function()
	-- Load the lualine theme
	local theme = require("lualine.themes.auto")

	-- Function to safely set background transparency
	-- local function set_bg_transparent(mode)
	-- 	if theme[mode] and theme[mode].c then
	-- 		theme[mode].c.bg = "NONE"
	-- 	end
	-- end
	--
	-- -- Set background transparency in all modes, safely
	-- set_bg_transparent("normal")
	-- set_bg_transparent("insert")
	-- set_bg_transparent("visual")
	-- set_bg_transparent("replace")
	-- set_bg_transparent("command")

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		tabline = {}, -- Remove the tabline or leave it empty
	})

	-- -- Ensure transparency by setting highlights explicitly
	-- local highlight_groups = {
	-- 	"lualine_c_normal",
	-- 	"lualine_c_insert",
	-- 	"lualine_c_visual",
	-- 	"lualine_c_replace",
	-- 	"lualine_c_command",
	-- }
	--
	-- for _, group in ipairs(highlight_groups) do
	-- 	vim.api.nvim_set_hl(0, group, { bg = "NONE" })
	-- end
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
