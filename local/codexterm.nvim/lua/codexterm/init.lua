local M = {}

local defaults = {
  cmd = "codex",
  direction = "vertical",
  size = 80,
  keys = {
    switchFocus = "<leader>cc",
    kill = "<leader>cq",
  },
  close_on_exit = true,
}

local codex_term

local function startinsert_later()
  vim.schedule(function()
    pcall(vim.cmd, "startinsert!")
  end)
end

local function focus_or_open()
  if not codex_term then
    return
  end

  if codex_term.bufnr and vim.api.nvim_buf_is_valid(codex_term.bufnr) then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == codex_term.bufnr then
        vim.api.nvim_set_current_win(win)
        startinsert_later()
        return
      end
    end
  end

  codex_term:open()
  pcall(vim.cmd, "vertical resize 80")
  startinsert_later()
end

local function kill()
  if codex_term and codex_term.bufnr and vim.api.nvim_buf_is_valid(codex_term.bufnr) then
    codex_term:shutdown()
  end
end

function M.setup(opts)
  opts = vim.tbl_deep_extend("force", defaults, opts or {})

  local Terminal = require("toggleterm.terminal").Terminal

  codex_term = Terminal:new({
    cmd = opts.cmd,
    hidden = true,
    size = opts.size,
    direction = opts.direction,
    close_on_exit = opts.close_on_exit,
    on_open = function()
      startinsert_later()
    end,
  })

  if opts.keys and opts.keys.switchFocus then
    vim.keymap.set("n", opts.keys.switchFocus, focus_or_open, {
      desc = "Codex: open/focus (terminal)",
    })
  end

  if opts.keys and opts.keys.switchFocus then
    vim.keymap.set("t", opts.keys.switchFocus, [[<C-\><C-n><C-w>p]], {
      desc = "Codex: back to editor",
    })
  end

  if opts.keys and opts.keys.kill then
    vim.keymap.set("n", opts.keys.kill, kill, { desc = "Codex: close (kill)" })
  end

  if opts.keys and opts.keys.kill then
    vim.keymap.set("t", opts.keys.kill, function()
      vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true),
        "n",
        false
      )
      kill()
    end, { desc = "Codex: close (kill)" })
  end
end

function M.open()
  focus_or_open()
end

function M.kill()
  kill()
end

return M
