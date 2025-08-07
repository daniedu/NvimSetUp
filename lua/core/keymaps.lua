-- lua/core/keymaps.lua

-- ====================
-- General Keymaps
-- ====================

-- Save the current file
vim.keymap.set('n', '<C-s>', ':w<cr>', { desc = "Save file" })

-- Quit Neovim (using a common mapping, 'leader' + 'q')
vim.keymap.set('n', '<leader>q', ':qa<cr>', { desc = "Quit all buffers" })
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Clear search highlights
vim.keymap.set('n', '<leader>nh', ':nohl<cr>', { desc = "Clear search highlights" })

-- Make a window or split fullscreen
vim.keymap.set('n', '<leader>z', ':MaximizerToggle<cr>', { desc = "Toggle maximize window" })

-- ====================
-- Movement and Window Management
-- ====================

-- Half-page movement
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = "Scroll half a page down" })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = "Scroll half a page up" })

-- Keep cursor in the center
vim.keymap.set('n', 'n', 'nzzzv', { desc = "Next search match, center view" })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Previous search match, center view" })

-- Window navigation (using Ctrl + h,j,k,l)
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Go to left window" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Go to lower window" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Go to upper window" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Go to right window" })

-- ====================
-- Telescope Mappings
-- ====================

local builtin = require('telescope.builtin')

-- Find files (your existing keymap)
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })

-- Custom Grep
vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep >") })
end, { desc = "Find files" })

-- Live Grep (search for a string in all files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })

-- Find files that are tracked by Git
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Find Git files" })

-- Show Git status
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Show Git status" })

-- Find recently opened files
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Find recent files" })

-- Switch between open buffers
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find open buffers" })

-- Search help tags
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Search help tags" })

-- ====================
-- Other common plugins
-- ====================

-- Toggle comment for a line
vim.keymap.set('n', '<leader>/', '<Plug>(comment_toggle_linewise_normal)', { desc = "Toggle line comment" })
vim.keymap.set('x', '<leader>/', '<Plug>(comment_toggle_linewise_visual)', { desc = "Toggle visual comment" })

-- Terminal toggle
vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<cr>', { desc = "Toggle Terminal" })

-- =========================================================
-- Harpoon Mappings
-- =========================================================
-- This section defines all keymaps for Harpoon actions.

-- Add a file to the Harpoon list
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })

-- Toggle the quick menu
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon quick menu" })

-- Jump to files in the list
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon select 1" })
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Harpoon select 2" })
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Harpoon select 3" })
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Harpoon select 4" })

-- Navigate the Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon previous" })
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon next" })
