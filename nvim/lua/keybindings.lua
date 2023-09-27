local map = vim.api.nvim_set_keymap
--vim.g.mapleader = "<,>"
vim.keymap.set('n', 'fo', require('ufo').openAllFolds)
vim.keymap.set('n', 'fc', require('ufo').closeAllFolds)
map('n', 'n', [[:NvimTreeToggle<CR>]], { silent = true})
map('n', 'bf', ':lua require"telescope.builtin".current_buffer_fuzzy_find()<CR>', { silent = true })
map('n', 't', ':TroubleToggle<CR>', { silent = true })
map('n', 'D', ':Dashboard<CR>', { silent = true })
map('n', 'w', ':w<CR>',{})
map('n', 's', ':source%<CR>',{ silent = true })
map('n', 'r', ':Jaq<CR>',{ silent = true })
map('n', 'Q', ':bd<CR>',{ silent = true })
map('n', 'fd', ':lua require"telescope.builtin".find_files({hidden=true})<CR>', { silent = true })
map('n', 'la', ':Lspsaga code_action<CR>', { silent = true })
