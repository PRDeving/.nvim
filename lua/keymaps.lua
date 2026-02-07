local map = vim.keymap.set

-- Files
map("n", "tt", "<CMD>NERDTreeToggle<CR>")
map("n", "tf", "<CMD>NERDTreeFind<CR>")
map("n", ";", "<CMD>Telescope find_files<CR>")
map("n", "open", "<CMD>Telescope find_files<CR>")

-- Bookmarks
vim.keymap.set("n", "mm", "<Plug>BookmarkToggle")
vim.keymap.set("n", "mn", "<Plug>BookmarkNext")
vim.keymap.set("n", "mp", "<Plug>BookmarkPrev")
vim.keymap.set("n", "ma", "<Plug>BookmarkShowAll")

-- Buffers
map("n", "<C-j>", "<CMD>bnext<CR>")
map("n", "<C-k>", "<CMD>bprev<CR>")
map("n", "<leader>d", "<CMD>bdelete<CR>")

-- Windows
map("n", "<leader>s", "<C-w>s<C-w>j")
map("n", "<leader>v", "<C-w>v<C-w>l")
map("n", "<leader>c", "<CMD>close<CR>")

-- Misc
map("n", "Q", "<nop>")
map("n", "<leader>p", '"+p')
