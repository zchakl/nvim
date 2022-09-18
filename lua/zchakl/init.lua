require("zchakl.options")
require("zchakl.keymap")
require("zchakl.packer")
require("zchakl.colorscheme")
require("zchakl.bufferline")
require("zchakl.lualine")
require("zchakl.autocommands")
require("zchakl.impatient")
require("zchakl.indentline")
require("zchakl.registers")
require("zchakl.notify")
require("zchakl.icons")
require("zchakl.lsp")
require("zchakl.dap")

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
