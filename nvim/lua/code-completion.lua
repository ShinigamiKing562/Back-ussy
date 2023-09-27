-- completeopt is used to manage code suggestions
-- menuone: show popup even when there is only one suggestion
-- noinsert: Only insert text when selection is confirmed
-- noselect: force us to select one from the suggestions
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert', 'preview'}
-- shortmess is used to avoid excessive messages
vim.opt.shortmess = vim.opt.shortmess + { c = true}

local cmp = require'cmp'
cmp.setup({
  -- Required by vsnip
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  -- Add Mappings to control the code suggestions
  mapping = {
    -- Up arrow to go to the Previous Suggested item
    ['<Up>'] = cmp.mapping.select_prev_item(),
    -- Down arrow  to go to the next suggestion
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    -- CTRL+SHIFT+f to scroll backwards in description
    ['<Left>'] = cmp.mapping.scroll_docs(-4),
    -- CTRL+F to scroll forwards in the description
    ['<Right>'] = cmp.mapping.scroll_docs(4),
    -- CTRL+SPACE to bring up completion at current Cursor location
    ['<C-Space>'] = cmp.mapping.complete(),
    -- CTRL+e to exit suggestion and close it
    ['<C-e>'] = cmp.mapping.close(),
    -- CR (enter or return) to CONFIRM the currently selection suggestion
    -- We set the ConfirmBehavior to insert the Selected suggestion
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
},

  -- sources are the installed sources that can be used for code suggestions
  sources = {
      { name = 'path' },
      { name = 'nvim_lsp', keyword_length = 3 },
      { name = 'nvim_lsp_signature_help'},
      { name = 'nvim_lua', keyword_length = 2},
      { name = 'buffer', keyword_length = 2 },
      { name = 'vsnip', keyword_length = 2 },
  },
  -- Add borders to the windows
   window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  -- add formating of the different sources
    formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'l',
              vsnip = 'v',
              buffer = 'b',
              path = 'p'
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = require('cmp_nvim_lsp').on_attach
--lua
require'lspconfig'.lua_ls.setup {
	cmd = { "lua-language-server" },
  	filetypes = { "lua" },
  	settings = {
    	Lua = {
      		runtime = { version = 'LuaJIT',},
      		diagnostics = { globals = {'vim'},},
      		workspace = {library = vim.api.nvim_get_runtime_file("", true),},
      		telemetry = {enable = false,},
    	},
	    },
	capabilities =capabilities,
	on_attach = on_attach
}
--html
require'lspconfig'.html.setup {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true},
		provideFormatter = true},
	single_file_support = true ,
	capabilities = capabilities,
	on_attach = on_attach
}
--css
require'lspconfig'.cssls.setup {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	settings = {
  		css = {validate = true},
  		less = {validate = true},
		scss = {validate = true},},
	single_file_support = true ,
	capabilities = capabilities,
	on_attach = on_attach
}

--C
require'lspconfig'.clangd.setup {
	cmd = { "clangd" },
	filetypes =  { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	single_file_support = true,
	capabilities = capabilities,
	on_attach = on_attach
}
--python
require'lspconfig'.pyright.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "pyright-langserver", "--stdio" },
	filetypes ={ "python" },
	--root_dir = function () return vim.loop.cwd() end,
	single_file_support = true,
	settings = {
        	pyright = {
            		disableOrganizeImports = false,
            		analysis = {
                	useLibraryCodeForTypes = true,
                	autoSearchPaths = true,
                	autoImportCompletions = true,
			typeCheckingMode = 'on'
		},
        },
    },
}
