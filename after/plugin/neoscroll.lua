local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  return
end

local easing = "sine"
local zz_time_ms = 250


local centering_function = function()
  local defer_time_ms = 10
  -- The `defer_fn` is a bit of a hack.
  -- We use it so that `neoscroll.init.scroll` will be false when we call `neoscroll.zz`
  -- As long as we don't input another neoscroll mapping in the timeout,
  -- we should be able to center the cursor.
  vim.defer_fn(function()
    neoscroll.zz(zz_time_ms, easing)
  end, defer_time_ms)
end

neoscroll.setup {
  -- All these keys will be mapped to their corresponding default scrolling animation
  mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
  hide_cursor = true, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
  respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing_function = 'quadratic', -- Default easing function
  pre_hook = nil, -- Function to run before the scrolling animation starts
  post_hook = function(info)
    if info ~= "center" then
      return
    end

    centering_function()
  end, -- Function to run after the scrolling animation ends
}

local t    = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '250', 'sine', "'center'" } }
t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '250', 'sine', "'center'" } }
t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450' } }
t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450' } }
t['<C-y>'] = { 'scroll', { '-0.10', 'false', '100' } }
t['<C-e>'] = { 'scroll', { '0.10', 'false', '100' } }
t['zt']    = { 'zt', { '250' } }
t['zz']    = { 'zz', { '250' } }
t['zb']    = { 'zb', { '250' } }

require('neoscroll.config').set_mappings(t)
