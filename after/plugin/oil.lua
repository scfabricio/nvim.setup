require('oil').setup({
  columns = { "icon" }, -- Mostra ícones dos arquivos
  default_file_explorer = true, -- Substitui netrw
  restore_win_options = true, -- Restaura as opções da janela ao sair do Oil
  skip_confirm_for_simple_edits = false, -- Confirmação antes de edições simples
  view_options = {
    show_hidden = false, -- Ocultar arquivos/diretórios ocultos por padrão
  },
  keymaps = {
    ["<C-p>"] = "actions.preview", -- Atalhos de teclado personalizados
    ["<C-s>"] = "actions.select_vsplit",
    ["<C-t>"] = "actions.select_tab",
    ["<C-h>"] = "actions.toggle_hidden",
  },
});


-- Atalho para abrir Oil no diretório atual
vim.keymap.set("n", "<leader>o", ":Oil<CR>", { desc = "Abrir Oil no diretório atual" })

-- Atalho para abrir Oil em um diretório específico
vim.keymap.set("n", "<leader>O", ":Oil ~/caminho/para/diretorio<CR>", { desc = "Abrir Oil em um diretório específico" })

require("nvim-web-devicons").setup();
