local home = vim.env.HOME

local function get_jdtls_workspace_dir()
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	return home .. "/.cache/jdtls/workspace/" .. project_name
end

local config = {
	cmd = {
		"jdtls",
		"--jvm-arg=-javaagent:" .. vim.env.LOMBOK_JAR,
		"-data",
		get_jdtls_workspace_dir(),
	},
	root_dir = vim.fs.root(0, {
		".git",
		"pom.xml",
		"build.sc",
		"build.mill",
		"build.gradle",
		"build.gradle.kts",
	}),
}

require("jdtls").start_or_attach(config)
