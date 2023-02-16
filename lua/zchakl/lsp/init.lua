vim.opt.signcolumn = "yes"

local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = true,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

require("lsp-format").setup {}

local on_attach = function(client)
    require("lsp-format").on_attach(client)

    -- ... custom code ...
end
require("lspconfig").gopls.setup { on_attach = on_attach }
require("lspconfig").lua_ls.setup { on_attach = on_attach }
