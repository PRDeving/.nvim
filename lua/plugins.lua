-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- UI
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "",
        },
        tabline = {
          lualine_a = { "buffers" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },

  -- Files
  {
    "preservim/nerdtree",
    cmd = { "NERDTreeToggle", "NERDTreeFocus" },
  },
  {
    "MattesGroeger/vim-bookmarks",
    lazy = false,
  },


  -- Fuzzy
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Git
  { "tpope/vim-fugitive" },

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },

  -- Treesitter (syntax moderna)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Comments
  { "numToStr/Comment.nvim", config = true },

  -- Multiple cursors
  { "mg979/vim-visual-multi" },

  -- Github Copilot
  {
      "github/copilot.vim",
      lazy = false
  },

  {
    dir = vim.fn.stdpath("config") .. "/local/codexterm.nvim",
    name = "codexterm.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
      require("codexterm").setup()
    end,
  },

})

