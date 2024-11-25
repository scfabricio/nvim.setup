local luasnip = require("luasnip")

-- Carregar snippets do friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Atalhos para navegação nos snippets
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { desc = "Expandir ou pular snippet" })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { desc = "Voltar no snippet" })

vim.keymap.set("i", "<C-l>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, { desc = "Alternar entre escolhas no snippet" })

-- Configuração opcional: habilitar atalhos para recarregar snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/init.lua<CR>", { desc = "Recarregar configuração" })
