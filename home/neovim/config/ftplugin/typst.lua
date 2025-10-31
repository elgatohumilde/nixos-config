require("typst-preview").setup({
	invert_colors = "auto",
	dependencies_bin = { ["tinymist"] = "tinymist" },
})

local map = vim.keymap.set
map("n", "<leader>tp", ":TypstPreviewToggle<CR>", { buffer = 0 })
