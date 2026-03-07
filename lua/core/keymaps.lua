-- ====================
-- General Keymaps
-- ====================

vim.keymap.set("n", "<C-s>", ":w<cr>", { desc = "Save file" })

vim.keymap.set("n", "<leader>qa", ":qa<cr>", { desc = "Quit all buffers" })
vim.keymap.set("n", "<leader>qq", ":q<cr>", { desc = "Quit current buffers" })

-- Clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<cr>", { desc = "Clear search highlights" })

-- ====================
-- Movement and Window Management
-- ====================

-- Half-page movement
vim.keymap.set("n", "<C-j>", "<C-d>zz", { desc = "Scroll half a page down" })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { desc = "Scroll half a page up" })

-- Keep cursor in the center
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search match, center view" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search match, center view" })

-- ====================
-- Other common plugins
-- ====================

-- Toggle comment for a line
-- vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_normal)", { desc = "Toggle line comment" })
-- vim.keymap.set("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle visual comment" })

-- =========================================================
-- Harpoon Mappings
-- =========================================================

-- Add a file to the Harpoon list
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })

-- Toggle the quick menu
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon quick menu" })

-- Jump to files in the list
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon select 1" })
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Harpoon select 2" })
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Harpoon select 3" })
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Harpoon select 4" })

-- Navigate the Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon previous" })
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon next" })

-- ====================
-- Fzf-lua Mappings
-- ====================
--
local fzf = require("fzf-lua")

-- Files & Buffers
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Fzf Files" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Fzf Buffers" })
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Fzf Help" })
vim.keymap.set("n", "<leader>fp", fzf.oldfiles, { desc = "Fzf Recent Files" })

-- Search/Grep
vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "Fzf Word under cursor" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Fzf Live Grep" })
vim.keymap.set("n", "<leader>fz", fzf.blines, { desc = "Fzf Current Buffer Lines" })
