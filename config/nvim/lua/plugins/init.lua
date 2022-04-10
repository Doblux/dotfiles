return require'packer'.startup(function()
    use("wbthomason/packer.nvim") --> packer plugin manager

    
    use 'tanvirtin/monokai.nvim' --> Colorscheme
    use 'kyazdani42/nvim-tree.lua' --> NerdTree
    use 'kyazdani42/nvim-web-devicons' --> Icons for NerdTree

    -- AUTOCOMPLETION && LSP
    use 'neovim/nvim-lspconfig' --> LSP config
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'onsails/lspkind-nvim' -- para que se vea lindo como vscode algunas cosas

    -- Status Bar
    use 'nvim-lualine/lualine.nvim'

    -- multiple window bar
    use 'romgrk/barbar.nvim'

    -- Tree Sitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    
    -- Tree Sitter Refactor
    use 'nvim-treesitter/nvim-treesitter-refactor'
    
    -- auto pairs
    use 'windwp/nvim-autopairs'
    --linea para indicar tabulacion
    use 'lukas-reineke/indent-blankline.nvim'

    -- Fuzzy finder
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
end)
