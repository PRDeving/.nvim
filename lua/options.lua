local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.wrap = false

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.incsearch = true
opt.smartcase = true
opt.hlsearch = true

opt.undofile = true
opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

opt.termguicolors = true
opt.colorcolumn = "119"

opt.completeopt = { "menuone", "noselect" }
opt.signcolumn = "yes"

opt.list = true
opt.listchars = {
  tab = "▸ ",
  eol = "¬",
  nbsp = "⍽",
}

vim.g.bookmark_sign = "♥"
vim.g.bookmark_highlight_lines = 1

vim.cmd([[
  highlight BookmarkSign ctermbg=NONE ctermfg=160
  highlight BookmarkLine ctermbg=194 ctermfg=NONE
]])
