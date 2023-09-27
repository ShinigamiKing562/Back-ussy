return require('packer').startup(function(use)
 use 'wbthomason/packer.nvim'
 use 'shaunsingh/nord.nvim'
 use 'williamboman/mason.nvim'
 use 'williamboman/mason-lspconfig.nvim'
 use 'neovim/nvim-lspconfig'
 use "is0n/jaq-nvim"
 use 'folke/lsp-colors.nvim'
 use {'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
 }
 use {
  "folke/trouble.nvim",
  requires = "nvim-tree/nvim-web-devicons",
  config = function()
    require("trouble").setup {
     opts = {
          provider_selector = function(_, filetype, buftype)
         return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
         or { "treesitter", "indent" } -- if file opened, try to use treesitter if available
          end,
        }
      }
  end
}

 use {
  'kevinhwang91/nvim-ufo',
   requires = 'kevinhwang91/promise-async',
   config = function ()
     require('ufo').setup ()
   end
 }

 use {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
	require("indent_blankline").setup {
		--char = " ",
  		context_char = "▏",
		max_indent_increase = 1,
  		use_treesitter = false,
  		show_current_context = true,
  		show_current_context_start = true,
		show_trailing_blankline_indent = false,
  		buftype_exclude = {"terminal","dashboard"},
  		filetype_exclude = {"help", "terminal", "dashboard", "NvimTree"},
  		context_patterns = {
    		"class",
    		"function",
    		"method",
   		"^if",
    		"^while",
    		"^for",
    		"^object",
    		"^table",
    		"^type",
    		"^import",
    		"block",
    		"arguments"
  		},
	}
     end
    }
 use 'hrsh7th/nvim-cmp'
 use 'hrsh7th/cmp-nvim-lsp'
 use 'hrsh7th/cmp-nvim-lua'
 use 'hrsh7th/cmp-nvim-lsp-signature-help'
 use 'hrsh7th/cmp-vsnip'
 use 'hrsh7th/cmp-path'
 use 'hrsh7th/cmp-buffer'
 use 'hrsh7th/vim-vsnip'
 use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  requires = { {'nvim-lua/plenary.nvim'} }
 }
 use {'akinsho/bufferline.nvim', tag = "v3.*",
      requires = 'nvim-tree/nvim-web-devicons'
 }
 use {'is0n/fm-nvim'}
 use 'rbgrouleff/bclose.vim'
 use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
 }
 use {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
 }
 use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require("nvim-tree").setup {}
  end
}
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
    }
  end
}
 use({
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end,
    requires = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }
})
 use "equalsraf/neovim-gui-shim"
 use "akinsho/toggleterm.nvim"
end)
