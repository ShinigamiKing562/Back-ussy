--terminalconfig
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber")       -- no numbers
vim.api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column

--clipboard
vim.opt.clipboard = 'unnamedplus'

--folding requirements
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = -1
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

--NvimTree stuff
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_respect_buf_cwd = 0

--IndentMarker
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

--personal styling
vim.o.number = true
vim.o.relativenumber = true
vim.cmd[[colorscheme nord]]
vim.opt.termguicolors = true
require('nord').set()

--nord configs
vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_disable_background = true

--making plugins use nord-theme
local highlights = require("nord").bufferline.highlights({
    italic = true,
    bold = true,
})

require("bufferline").setup({
    options = {
        separator_style = "thin",
    },
    highlights = highlights,
})
--configs_lualine
require('lualine').setup({
	options = {
		theme = 'nord'
}
})
--configs-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "rust" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

