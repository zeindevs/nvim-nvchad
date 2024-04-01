--type conform.options
local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		javascriptreact = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		html = { "prettier" },
		python = { "black" },
		go = { "gofmt" },
		rust = { "rustfmt" },
		-- c = { "clang-format" },
		-- cpp = { "clang-format" },

		sh = { "shfmt" },
	},

	-- adding same formatter for multiple filetypes can look too much work for some
	-- instead of the above code you could just use a loop! the config is just a table after all!

	format_on_save = {
		--   -- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

require("conform").setup(options)
