vim.api.nvim_set_keymap("n", "<leader>w", ":<C-u>w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":<C-u>bd<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>j", "10j", { noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>k", "10k", { noremap = true })
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { silent = true })
vim.api.nvim_set_keymap("n", "<ESC><ESC>", ":nohlsearch<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<S-h>", "0", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-l>", "$", { noremap = true })

vim.api.nvim_set_keymap("n", '"""', 'ciw""<Esc>P', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "'''", "ciw''<Esc>P", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>s'", "ciw''<Esc>P", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "```", "ciw``<Esc>P", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "(((", "ciw()<Esc>P", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "{{{", "ciw{}<Esc>P", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[[[", "ciw[]<Esc>P", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<<<", "ciw<><Esc>P", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-j>", ":bprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":bnext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>sv", "<C-w>v") -- ウィンドウを垂直方向に分割する
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- ウィンドウを水平に分割する
vim.keymap.set("n", "<leader>se", "<C-w>=") -- ウィンドウの幅を等分にする
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- 現在、カーソルがいるウィンドウを閉じる
vim.keymap.set("n", "<leader>sw", "<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>") -- ウィンドウの幅を少し広げる
vim.keymap.set(
  "n",
  "<leader>sww",
  "<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>"
) -- ウィンドウの幅を大きく広げる
vim.keymap.set("n", "<leader>st", "<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><") -- ウィンドウの幅を少し狭める
vim.keymap.set(
  "n",
  "<leader>stt",
  "<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><"
) -- ウィンドウの幅を大きく狭める

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
-- auto tag
vim.api.nvim_set_keymap("i", "(", "()<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "{", "{}<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "[", "[]<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<", "<><Left>", { noremap = true, silent = true })

vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-l>", '<cmd>lua require("luasnip").jump(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-b>", '<cmd>lua require("luasnip").jump(-1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-l>", '<cmd>lua require("luasnip").jump(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-b>", '<cmd>lua require("luasnip").jump(-1)<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "lg", ":LazyGit<CR>", { noremap = true, silent = true })
