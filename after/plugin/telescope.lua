local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({follow=true, no_ignore=false}) end, {})
vim.keymap.set('n', '<leader>fGf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', function() builtin.live_grep({additional_args=function() return{"-L"} end}) end, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fGb', builtin.git_bcommits, {});
vim.keymap.set('n', '<leader>fC', builtin.colorscheme, {});
