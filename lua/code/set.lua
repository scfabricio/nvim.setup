-- Setting up leader key
vim.g.mapleader = ' ';
vim.cmd("syntax on");
vim.opt.guicursor = "" -- Deixar o cursor sempre em formato de bloco

local set = vim.opt;

set.background = "dark";
set.clipboard = "unnamedplus";
set.completeopt = "noinsert,menuone,noselect"
set.mouse = ""
set.cursorline = true
set.expandtab = true
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldmethod = "manual"
set.hidden = true
set.inccommand = "split"
set.number = true
set.relativenumber = true
set.shiftwidth = 2
set.scrolloff = 5
set.smarttab = true
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.tabstop = 2
set.termguicolors = true
set.title = true
set.ttimeoutlen = 0
set.updatetime = 250
set.wildmenu = true
set.wrap = true
set.hlsearch = false
