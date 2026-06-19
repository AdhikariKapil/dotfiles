-- default keymaps
-- vim.keymap.set("n", "gri", vim.lsp.buf.implementation, opts) -- Goto Impementation
-- vim.keymap.set("n", "grt", vim.lsp.buf.type_defination, opts) -- Goto Type Defination
-- vim.keymap.set("n", "grr", vim.lsp.buf.references, opts) -- Find References
-- vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts) -- Rename
-- vim.keymap.set({ "n", "v" }, "gra", vim.lsp.buf.code_action, opts) -- Code Action
-- vim.keymap.set("n", "grx", vim.lsp.codelens.run, opts) -- Run CodeLens
-- vim.keymap.set("n", "gO", vim.lsp.buf.document_symbol, opts) -- Document Symbols
-- vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts) -- Signature Help
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, {desc = "Show documentation"}))

require("mason").setup()

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Local buffer" })
-- vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	-- update_in_insert = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

vim.lsp.config("ts_ls", {
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayFunctionLikeReturnTypeHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayFunctionLikeReturnTypeHints = true,
			},
		},
	},
})

vim.lsp.config("eslint", {})
vim.lsp.config("jsonls", {})

vim.lsp.config("tailwindcss", {
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "class:list", "ngClass" },
		},
	},
})

vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				-- Disable the noisy plugins
				pycodestyle = { enabled = false },
				pyflakes = { enabled = false },
				mccabe = { enabled = false },
				-- Keep useful ones
				jedi_completion = { enabled = true },
				jedi_definition = { enabled = true },
				jedi_hover = { enabled = true },
				jedi_references = { enabled = true },
				jedi_signature_help = { enabled = true },

				-- Pylint handle all
				pylint = {
					enabled = true,
					executable = vim.fn.expand("~/.local/share/nvim/mason/bin/pylint"),
					args = {
						"--disable=missing-module-docstring",
						"--disable=missing-function-docstring",
						"--disable=missing-class-docstring",
					},
				},
			},
		},
	},
	-- Disable incremental change tracking to fix the 0.12 bug
	flags = {
		allow_incremental_sync = false,
	},
})

vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				autoSearchPath = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "basic",
			},
		},
	},
})

vim.lsp.config("cssls", {
	settings = {
		css = {
			validate = false,
		},
	},
})

vim.lsp.enable({
	"lua_ls",
	-- "pylsp",
	"jsonls",
	"ts_ls",
	"eslint",
	"tailwindcss",
	"cssls",
	-- "pylint",
	"pyright",
})
