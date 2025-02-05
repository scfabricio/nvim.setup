local lspconfig = require('lspconfig')

-- Configuração básica para o Lua Language Server
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }, -- Reconhecer o objeto `vim` como global
			},
		},
	},
})

-- Exemplo para o TypeScript/JavaScript (ts_ls)
lspconfig.ts_ls.setup({
	on_attach = function(client, bufnr)
		-- Desativar o formatador interno (usaremos outro como prettier)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		-- Atalhos LSP
		local bufopts = { noremap=true, silent=true, buffer=bufnr }
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- Ir para definição
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) -- Ir para referêcia
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)       -- Exibir documentação
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts) -- Renomear
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- Ações de código
    vim.keymap.set('n', '<leader>ai', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', bufopts)
    vim.keymap.set('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', bufopts)
    vim.keymap.set("i", "<C-space>", vim.lsp.buf.completion, bufopts)
	end,

	settings = {
		-- Configurações específicas do TypeScript/JavaScript
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayVariableTypeHints = true,
			},
		},
	},
})

-- css
lspconfig.cssls.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Ativa autocompletar avançado
  on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)             -- Mostrar documentação
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)       -- Ir para definição
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)   -- Renomear variável
  end,
})

lspconfig.tailwindcss.setup({
    on_attach = function(client, bufnr)
        -- Configurações opcionais, como mapeamentos
        print("TailwindCSS Language Server conectado!")
    end,
    filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = require("lspconfig").util.root_pattern("tailwind.config.js", "tailwind.config.cjs", "postcss.config.js", ".git"),
})


lspconfig.prismals.setup {}

-- Cliente para autocompleta
local cmp = require'cmp'
local luasnip = require("luasnip")

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
    { name = "luasnip" },  -- Fonte para snippets
	},
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Usar LuaSnip como motor de snippets
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-space>"] = cmp.mapping.complete(), -- Ativa sugestões manualmente
  }),
})
