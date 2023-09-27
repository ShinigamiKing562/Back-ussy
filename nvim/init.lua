--Loading modules
require('plugins')
require('mason-config')
require('code-completion')
require('jaq-config')
require('settings')
require('keybindings')
vim.api.nvim_create_autocmd( "UIEnter", {
    once = true,
    callback = function() require "ginit" end
  } )
