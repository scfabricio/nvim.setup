return require('packer').startup(function()
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    
    -- Plugin LSP    
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- Plugin para autocompletar
    use "hrsh7th/nvim-cmp"           
    use "hrsh7th/cmp-nvim-lsp"      
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
end)

