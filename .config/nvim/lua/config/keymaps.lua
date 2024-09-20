local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- NOTE: General
keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { noremap = true, silent = true })


-- Disable the space key's default behavior in visual mode
keymap.set("v", "<leader>", "<Nop>", opts)


-- Paste without losing buffer text
keymap.set("n", "<leader>p", "\"_dP", opts)
keymap.set("v", "<leader>p", "\"_dP", opts)


-- Direction Navigation
keymap.set("n", "<leader>n", "<cmd>NvimTreeFocus<CR>", { noremap = true, silent = true, desc = "Focus tree" })
keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle tree" })


-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right


-- Window Management
keymap.set("n", "<leader>q", "<cmd>q<CR>", { noremap = true, silent = true, desc = "Close Window" })
keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { noremap = true, silent = true, desc = "Split Vertically" })
keymap.set("n", "<leader>sh", "<cmd>split<CR>", { noremap = true, silent = true, desc = "Split Horizontally" })


-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")


-- Comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false, silent = true })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false, silent = true })


-- Diagnostics
vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, { noremap = true, silent = true, buffer = bufnr })

function YankDiagnosticError()
  vim.diagnostic.open_float()
  vim.diagnostic.open_float()
  local win_id = vim.fn.win_getid()    -- get the window ID of the floating window
  vim.cmd("normal! j")                 -- move down one row
  vim.cmd("normal! VG")                -- select everything from that row down
  vim.cmd("normal! y")                 -- yank selected text
  vim.api.nvim_win_close(win_id, true) -- close the floating window by its ID
end

vim.keymap.set("n", "<leader>ey", ":lua YankDiagnosticError()<CR>", { noremap = true, silent = true, buffer = bufnr })
