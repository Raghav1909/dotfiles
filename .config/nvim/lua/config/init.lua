-- highlight when yanking (copying) text'
-- Try it with 'yap' in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highligh-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- -- Function to set highlights to transparent
-- local function set_transparent_highlights()
-- 	local highlights = {
-- 		"Normal",
-- 		"NormalNC",
-- 		"LineNr",
-- 		"CursorLineNr",
-- 		"SignColumn",
-- 		"VertSplit",
-- 		"StatusLine",
-- 		"StatusLineNC",
-- 		"WinSeparator",
-- 		"EndOfBuffer",
-- 		"NvimTreeNormal",
-- 		"NvimTreeNormalNC",
-- 		"NvimTreeEndOfBuffer",
-- 		"TabLineFill",
-- 		"TabLine",
-- 		"TabLineSel",
-- 	}
--
-- 	for _, group in ipairs(highlights) do
-- 		vim.api.nvim_set_hl(0, group, { bg = "NONE" })
-- 	end
-- end
--
-- -- Call the function to set the highlights
-- set_transparent_highlights()

-- Autocommand to ensure highlights are set after colorscheme loads
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	callback = function()
-- 		set_transparent_highlights()
-- 	end,
-- })

-- Call the function once initially to set highlights
-- set_transparent_highlights()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.keymaps")
require("config.options")

local plugins = "plugins"

local opts = {
	defaults = {
		lazy = true,
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrw",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		notify = false,
	},
}

require("lazy").setup(plugins, opts)
