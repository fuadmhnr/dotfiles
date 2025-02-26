local keymap = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

keymap("", "<Space>", "<Nop>", options)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- MODES
-- normal mode = "n"
-- insert mode = "i"
-- visual mode = "v"
-- visual block mode = "x"
-- term mode = "t"
-- command mode = "c"
-- alt key = "m"


-- universal mode
for _, mode in ipairs({"i", "v", "n", "x" }) do
  -- duplicate line
  keymap(mode, "<S-Down>", "<CMD>t.<CR>", options)
  keymap(mode, "<S-Up>", "<CMD>t -1<CR>", options)

  -- Move line
  keymap(mode, "<M-Down>", "<CMD>m+<CR>", options)
  keymap(mode, "<M-Up>", "<CMD>m-2<CR>", options)
end

-- close windows
keymap("n", "<leader>q", "<CMD>q<CR>", options)
