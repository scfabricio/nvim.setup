require('packer').startup(function(use)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
  }

  -- Colorschema
  use 'folke/tokyonight.nvim'
  use 'sainnhe/gruvbox-material'
  use 'slugbyte/lackluster.nvim'
  use 'sainnhe/everforest'
  use "blazkowolf/gruber-darker.nvim"

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

  use 'MunifTanjim/eslint.nvim'

  use 'eandrju/cellular-automaton.nvim'

  -- LuaSnip e snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'saadparwaiz1/cmp_luasnip' -- Integração do LuaSnip com o nvim-cmp

  -- Oil
  use 'stevearc/oil.nvim'

  use 'stevearc/oil.nvim' -- Plugin Oil
  use 'nvim-tree/nvim-web-devicons' -- Ícones para arquivos e diretórios

  use 'tpope/vim-fugitive' -- Fugitive

  -- Prettier
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  -- Gitsigns
  use('lewis6991/gitsigns.nvim')

  -- Prisma highlight
  use { "pantharshit00/vim-prisma", ft = "prisma" }

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

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end
  }


  use {
    "windwp/nvim-ts-autotag",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require('nvim-ts-autotag').setup()
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    requires = 'nvim-treesitter/nvim-treesitter', -- Treesitter é obrigatório
    config = function()
      require'treesitter-context'.setup{
        enable = true, -- Habilita o contexto
        max_lines = 3, -- Número máximo de linhas fixas
        trim_scope = 'outer', -- Remove excesso de contexto se ultrapassar o limite
      }
    end
  }

  use({
    "laytan/tailwind-tools.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("tailwind-tools").setup({
        -- Configurações personalizadas
        color_preview = "background", -- "foreground" ou "background"
        mappings = {
          hover = "K", -- Tecla para visualizar as cores
        },
      })
    end
  })
end)

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ts_ls", "tailwindcss", "cssls" },
})
require('gitsigns').setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "javascript", "typescript", "tsx", "vue", "lua" }, -- Idiomas suportados
  highlight = { enable = true },
}
