vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<CR>') -- Recarregar configuração

-- KeyMap Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep For > ") })
end, { desc = "Buscar por uma string com Telescope" })
vim.keymap.set('n', '<leader>pS', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- KeyMap Fugitive
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" }) -- Status do Git
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git Commit" }) -- Fazer commit
vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", { desc = "Git Add All" }) -- Fazer add
vim.keymap.set("n", "<leader>gps", ":Git push<CR>", { desc = "Git Push" }) -- Fazer push
vim.keymap.set("n", "<leader>gpl", ":Git pull<CR>", { desc = "Git Pull" }) -- Fazer pull
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git Blame" }) -- Blame
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git Diff" }) -- Diff

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<leader>]", ":vertical resize +5<CR>")
vim.keymap.set("n", "<leader>[", ":vertical resize -5<CR>")

vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "<leader>tp", ":TailwindToolsPreview<CR>", { desc = "Mostrar preview da classe Tailwind" })
