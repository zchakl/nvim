local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("zchakl.lsp.lsp-installer")
require("zchakl.lsp.handlers").setup()
require("zchakl.lsp.null-ls")
require("zchakl.lsp.lsp-format")

require("lsp_extensions").inlay_hints({
	highlight = "Comment",
	prefix = " > ",
	aligned = false,
	only_current_line = false,
	enabled = { "ChainingHint", "TypeHint", "ParameterHint" },
})
