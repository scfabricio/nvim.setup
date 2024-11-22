vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<CR>') -- Recarregar configuração

-- KeyMap Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- KeyMap Fugitive
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" }) -- Status do Git
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git Commit" }) -- Fazer commit
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git Push" }) -- Fazer push
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git Blame" }) -- Blame
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git Diff" }) -- Diff
