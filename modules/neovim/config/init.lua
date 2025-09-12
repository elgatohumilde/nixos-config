vim.loader.enable()

vim.g.have_nerd_font = true
vim.g.netrw_banner = 0
vim.o.autoindent = true
vim.o.background = "dark"
vim.o.breakindent = true
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.encoding = "UTF-8"
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.laststatus = 0
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 20
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.virtualedit = "all"
vim.o.winblend = 0
vim.o.winborder = "rounded"
vim.o.wrap = false

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.cmd.colorscheme("gruber-darker")
require("mini.icons").setup()

require("mini.notify").setup()
vim.notify = MiniNotify.make_notify()

local create_autocmd = vim.api.nvim_create_autocmd
create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local map = function(mode, lhs, rhs)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
		end

		local Snacks = require("snacks")
		map("n", "<leader>ca", vim.lsp.buf.code_action)
		map("n", "<leader>d", vim.diagnostic.open_float)
		map("n", "<leader>rn", vim.lsp.buf.rename)
		map("n", "<leader>so", Snacks.picker.lsp_symbols)
		map("n", "K", vim.lsp.buf.hover)
		map("n", "gD", Snacks.picker.lsp_declarations)
		map("n", "gd", Snacks.picker.lsp_definitions)
		map("n", "gi", Snacks.picker.lsp_implementations)
		map("n", "gr", Snacks.picker.lsp_references)
		map("n", "gt", Snacks.picker.lsp_type_definitions)
	end,
})

---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
})

vim.diagnostic.config({ virtual_text = true })
vim.lsp.enable({ "clangd", "lua_ls", "tinymist", "verible", "bashls", "nil_ls", "gopls" })

require("blink-cmp").setup({
	signature = { enabled = true },
	completion = { documentation = { auto_show = true } },
})

local create_command = vim.api.nvim_create_user_command
create_command("LspInfo", ":checkhealth vim.lsp", {})

require("snacks").setup()
vim.ui.select = Snacks.picker.select
local map = vim.keymap.set

map("n", "/", Snacks.picker.lines)
map("n", "<A-z>", ":b#<CR>")
map("n", "<C-s>", ":Ex<CR>")
map("n", "<Esc>", ":nohl<CR>")
map("n", "<F1>", Snacks.picker.help)
map("n", "<leader>-", ":sp<CR>")
map("n", "<leader>/", "/")
map("n", "<leader><leader>", Snacks.picker.buffers)
map("n", "<leader>Q", Snacks.bufdelete.other)
map("n", "<leader>n", ":e ~/.dotfiles/modules/neovim<CR>")
map("n", "<leader>q", Snacks.bufdelete.delete)
map("n", "<leader>sd", Snacks.picker.diagnostics)
map("n", "<leader>sf", Snacks.picker.files)
map("n", "<leader>sg", Snacks.picker.grep)
map("n", "<leader>ut", ":UndotreeToggle<CR>")
map("n", "<leader>|", ":vs<CR>")
map("n", "U", "<C-r>")
map("n", "\\", Snacks.picker.zoxide)
map("n", "q:", "<nop>")
map("o", "ie", ":<C-u>normal! mzggVG<CR>`z")
map("t", "<Esc><Esc>", "<C-\\><C-n>")
map("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>')
map("x", "<leader>p", '"_dP')
map("x", "ie", ":<C-u>normal! ggVG<CR>")
map({ "n", "v" }, "gL", "g$")
map({ "n", "v" }, "gh", "^")
map({ "n", "v" }, "gl", "$")

require("gitsigns").setup()
require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("tmux").setup()

local Conform = require("conform")
Conform.setup({ format_on_save = { lsp_format = "fallback" } })
Conform.formatters_by_ft.lua = { "stylua" }
Conform.formatters_by_ft.nix = { "nixfmt" }
Conform.formatters_by_ft.sh = { "shfmt" }
Conform.formatters_by_ft.typst = { "typstyle" }
