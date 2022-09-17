-- Example config in Lua
--vim.g.tokyonight_style = "storm"
--vim.g.tokyonight_italic_functions = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }



vim.cmd [[
try
  colorscheme tokyonight  
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

vim.g.tokyonight_style = 'night'



--require("transparent").setup({
--  enable = false
--})


