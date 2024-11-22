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
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)       -- Exibir documentação
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts) -- Renomear
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- Ações de código
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

-- Cliente para autocompleta
local cmp = require'cmp'

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
	mapping = cmp.mapping.preset.insert({
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
	}),
})
