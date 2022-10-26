require("sidebar-nvim").setup({
	disable_default_keybindings = 0,
	bindings = nil,
	open = false,
	side = "left",
	initial_width = 35,
	hide_statusline = false,
	update_interval = 1000,
	sections = { "git", "diagnostics", "symbols", "buffers", "files", "todos" },
	section_separator = { "", "-----", "" },
	section_title_separator = { "" },
	containers = {
		attach_shell = "/bin/zsh",
		show_all = true,
		interval = 5000,
	},
	datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
	todos = {
		ignored_paths = { "~" },
		initially_closed = false,
	},
	["git"] = {
		icon = "",
	},
	["diagnostics"] = {
		icon = "",
	},
	buffers = {
		icon = "",
		ignored_buffers = {}, -- ignore buffers by regex
		sorting = "id", -- alternatively set it to "name" to sort by buffer name instead of buf id
		show_numbers = true, -- whether to also show the buffer numbers
		ignore_not_loaded = false, -- whether to ignore not loaded buffers
		ignore_terminal = true, -- whether to show terminal buffers in the list
	},
	files = {
		icon = "",
		show_hidden = false,
		ignored_paths = { "%.git$" },
	},
	symbols = {
		icon = "ƒ",
	},
})
