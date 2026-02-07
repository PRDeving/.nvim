-- Leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("options")
require("keymaps")
require("plugins")
require("lsp")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("NERDTree")
    end
  end,
})

vim.cmd("colorscheme catppuccin")
