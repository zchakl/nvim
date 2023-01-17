require("zchakl.options")
require("zchakl.keymap")
require("zchakl.packer")
require("zchakl.colorscheme")
require("zchakl.autocommands")
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
