require('packer').startup(function(use)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
  }

  -- Colorschema
  use 'folke/tokyonight.nvim'
  use 'sainnhe/gruvbox-material'
  use 'slugbyte/lackluster.nvim'
  use 'sainnhe/everforest'

  -- LCP
  use {
    'neovim/nvim-lspconfig', -- Configuração básica de LSP
    'williamboman/mason.nvim', -- Gerenciador de LSPs, DAPs e Linters
    'williamboman/mason-lspconfig.nvim' -- Integração do Mason com o nvim-lspconfig
  }

  use {
    'hrsh7th/nvim-cmp', -- Autocompletar
    'hrsh7th/cmp-nvim-lsp', -- Fonte LSP para o nvim-cmp
    'hrsh7th/cmp-buffer', -- Fonte buffer para nvim-cmp
    'hrsh7th/cmp-path', -- Completar caminhos
    'hrsh7th/cmp-vsnip', -- Snippets
    'hrsh7th/vim-vsnip', -- Snippets engine
    'onsails/lspkind.nvim', -- Ícones no autocomplete
  }

  -- LuaSnip e snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'saadparwaiz1/cmp_luasnip' -- Integração do LuaSnip com o nvim-cmp

  -- Oil
  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })

  use 'stevearc/oil.nvim' -- Plugin Oil
  use 'nvim-tree/nvim-web-devicons' -- Ícones para arquivos e diretórios

  use 'tpope/vim-fugitive' -- Fugitive

  -- Prettier
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  -- Gitsigns
  use('lewis6991/gitsigns.nvim')

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate' -- Atualiza parsers após instalar
  }

  use {
    "windwp/nvim-ts-autotag",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require('nvim-ts-autotag').setup()
    end
  }
end)

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ts_ls"},
})
require('gitsigns').setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "javascript", "typescript", "tsx", "vue", "lua" }, -- Idiomas suportados
  highlight = { enable = true },
}
