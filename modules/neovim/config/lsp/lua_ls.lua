local runtime_files = vim.api.nvim_get_runtime_file("", true)
table.insert(runtime_files, "${3rd}/luv/library")

return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	settings = {
		Lua = {
			telemetry = { enable = false },
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = runtime_files,
			},
		},
	},
}
