-- ~/.config/nvim/lua/lsp.lua
-- Neovim 0.11+: usa vim.lsp.config + vim.lsp.enable (sin require('lspconfig'))

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(_, bufnr)
  local map = vim.keymap.set
  local opts = { buffer = bufnr }

  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "<leader>rn", vim.lsp.buf.rename, opts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Configura (extiende) servers
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("ts_ls", { -- antes tsserver
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("pyright", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("gopls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Activa autostart
vim.lsp.enable({ "lua_ls", "ts_ls", "pyright", "gopls" })

