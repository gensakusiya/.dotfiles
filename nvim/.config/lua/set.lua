local exec = vim.api.nvim_exec
local set = vim.opt
local cmd = vim.cmd

local g = vim.g

require("tokyonight").setup(
	{
		transparent = false 
	}
)
cmd("autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=grey")
cmd("colorscheme tokyonight")
set.guifont = "DroidSansMono Nerd Font 11"

set.termguicolors = true

set.undofile = true
set.undodir = vim.fn.stdpath("config") .. "/undo"

set.number = true
set.relativenumber = true
set.cursorline = true

set.hlsearch = true
set.incsearch = true
set.smartcase = true

set.scrolloff = 6
set.updatetime = 50

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.smarttab = true

set.colorcolumn = "80"

set.mouse = "a"

set.shell = "zsh"

-- highlight on yank
exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500, on_visual=true}
  augroup end
]],
  false
)

-- auto source nvim
cmd([[
	augroup neovim
		autocmd!
		autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
	augroup end
]])

-- 2 spaces for selected filetypes
cmd([[ autocmd FileType xml,html,xhtml,css,scssjavascript,lua,dart setlocal shiftwidth=2 tabstop=2 ]])
-- json
cmd([[ au BufEnter *.json set ai expandtab shiftwidth=2 tabstop=2 sta fo=croql ]])

