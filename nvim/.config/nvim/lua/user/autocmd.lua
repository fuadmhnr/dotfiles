local api = vim.api

local general_settings_group = api.nvim_create_augroup("_general_settings", { clear = true })

api.nvim_create_autocmd("TextYankPost", {
  group = general_settings_group, -- Gunakan ID grup, bukan string
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "Visual",
      timeout = 300
    }) -- Beri highlight pada teks yang baru disalin
  end
})

api.nvim_create_autocmd("FileType", {
  group = general_settings_group,
  pattern = "qf",
  command = "set nobuflisted", -- Arrange buffer so it's not registered on buffer list
})

-- Git configuration
local git_settings = api.nvim_create_augroup("_git", { clear = true })

api.nvim_create_autocmd("FileType", {
  group = git_settings,
  pattern = "gitcommit",
  command = "setlocal wrap spell", -- set wrap and spellcheck for git commited files
})


-- Markdown configuration
local md_settings = api.nvim_create_augroup("_markdown", { clear = true })

api.nvim_create_autocmd("FileType", {
  group = md_settings,
  pattern = "markdown",
  command = "setlocal wrap spell",
})


-- Autoresize configuration
local autoresize_settings = api.nvim_create_augroup("_auto_resize", { clear = true })

api.nvim_create_autocmd("VimResized", {
  group = autoresize_settings,
  command = "tabdo wincmd =", -- adjust vim window when vim is resizing
})

-- Alpha configuration
local alpha_settings = api.nvim_create_augroup("_alpha", { clear = true })

api.nvim_create_autocmd("User", {
  group = alpha_settings,
  pattern = "AlphaReady",
  command = "set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2",
})

-- Terminal Configuration
local terminal_settings = api.nvim_create_augroup("neovim_terminal", { clear = true })

api.nvim_create_autocmd("TermOpen", {
	group = terminal_settings,
	command = "startinsert | set nonumber norelativenumber | nnoremap <buffer> <C-c> i<C-c>", -- Memasuki mode insert secara otomatis dan menonaktifkan nomor baris di buffer terminal
})

-- Configuration for create directory who doesn't exist on BufWrite
local function MkNonExDir(file, buf)
	if vim.fn.empty(vim.fn.getbufvar(buf, "&buftype")) == 1 and not string.match(file, "^%w+://") then
		local dir = vim.fn.fnamemodify(file, ":h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p") -- Membuat direktori jika tidak ada
		end
	end
end

local bwc_settings = api.nvim_create_augroup("BWCCreateDir", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
	group = bwc_settings,
	callback = function(_)
		MkNonExDir(vim.fn.expand("<afile>"), vim.fn.expand("<abuf>")) -- Calling function for create directory who doesn't exist before
	end,
})
