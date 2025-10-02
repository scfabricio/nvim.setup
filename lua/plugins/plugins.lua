return {
  -- 🔧 Necessário para telescope, none-ls, etc.
  { "nvim-lua/plenary.nvim" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Themes
  { "folke/tokyonight.nvim" },
  { "sainnhe/gruvbox-material" },
  { "slugbyte/lackluster.nvim" },
  { "sainnhe/everforest" },
  { "blazkowolf/gruber-darker.nvim" },

  -- Mason (deve vir primeiro)
  {
    "williamboman/mason.nvim",
    priority = 1000,
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    priority = 999,
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "tailwindcss", "cssls" },
        automatic_installation = true,
      })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    priority = 998,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local function on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        local opts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>ai', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set("i", "<C-space>", vim.lsp.buf.completion, opts)
      end

      -- Função para encontrar root directory usando a nova API ou fallback
      local function find_root_dir(patterns)
        if vim.fs.root then
          return vim.fs.root(0, patterns)
        elseif vim.fs.find then
          local found = vim.fs.find(patterns, { upward = true })
          return found[1] and vim.fs.dirname(found[1]) or nil
        else
          -- Fallback para versões mais antigas
          return vim.fn.getcwd()
        end
      end

      -- Configuração dos servidores LSP
      local servers = {
        ts_ls = {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            javascript = {
              suggest = { autoImports = true },
            },
            typescript = {
              suggest = { autoImports = true },
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayVariableTypeHints = true,
              },
            },
          },
          flags = {
            debounce_text_changes = 100,
          },
        },
        lua_ls = {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
              },
              diagnostics = {
                globals = { 'vim' },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        cssls = {
          capabilities = capabilities,
          on_attach = on_attach,
        },
        tailwindcss = {
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            print("TailwindCSS Language Server conectado!")
          end,
          filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
          root_dir = find_root_dir({ "tailwind.config.js", "tailwind.config.cjs", "postcss.config.js", ".git" }),
        }
      }

      -- Setup usando a nova API vim.lsp.config se disponível, senão fallback para lspconfig
      if vim.lsp.config then
        -- Nova API do Neovim 0.11+
        for server_name, config in pairs(servers) do
          vim.lsp.config[server_name] = config
          vim.lsp.enable(server_name)
        end
      else
        -- Fallback para versões anteriores usando lspconfig
        local lspconfig = require("lspconfig")
        for server_name, config in pairs(servers) do
          lspconfig[server_name].setup(config)
        end
      end
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
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
          ["<C-space>"] = cmp.mapping.complete(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "luasnip" },
        },
      })
    end,
  },
  { "MunifTanjim/eslint.nvim" },
  { "eandrju/cellular-automaton.nvim" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },
  { "saadparwaiz1/cmp_luasnip" },

  -- UI
  { "stevearc/oil.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "tpope/vim-fugitive" },

  -- Formatting
  { "nvimtools/none-ls.nvim" },
  { "MunifTanjim/prettier.nvim" },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "html", "javascript", "typescript", "tsx", "vue", "lua" },
        highlight = { enable = true },
      }
    end,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        toggler = {
          line = 'gcc',
          block = 'gbc',
        },
        opleader = {
          line = 'gc',
          block = 'gb',
        },
        mappings = {
          basic = true,
          extra = true,
        },
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("treesitter-context").setup {
        enable = true,
        max_lines = 3,
        trim_scope = "outer",
      }
    end,
  },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    config = function()
      require("tailwindcss-colors").setup()
    end,
  },
} 

