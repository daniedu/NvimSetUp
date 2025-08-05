-- lua/core/keymaps.lua

-- General Keymaps
vim.keymap.set('n', '<C-s>', ':w<cr>', { desc = "Save file" })
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = "Find files" })
-- ... add any other keymaps here