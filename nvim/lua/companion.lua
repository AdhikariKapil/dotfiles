---- Code Companion AI ----
local function setup_codecompanion()
	-- Only setup if ollama is availabe
	local ollama_check = vim.fn.system("pgrep ollama")
	if vim.v.shell_error ~= 0 then
		vim.notify("Ollama is not running. Start with: ollama serve", vim.log.levels.WARN)
		return
	end

	require("codecompanion").setup({
		adapters = {
			ollama = function()
				return require("codecompanion.adapters").extend("ollama", {
					env = {
						url = "http://localhost:11434",
					},
					schema = {
						model = {
							default = "qwen2.5-coder:7b-instruct",
						},
					},
				})
			end,
		},
		interactions = {
			chat = {
				adapter = "ollama",
				model = "qwen2.5-coder:7b-instruct",
				opts = {
					completion_provider = "default",
				},
			},
			inline = {
				adapter = {
					name = "ollama",
					model = "qwen2.5-coder:7b-instruct",
				},
				keymaps = {
					accept_chage = {
						modes = { n = "ga" },
						description = "Accept the suggested change",
					},
					reject_change = {
						modes = { n = "gr" },
						opts = { nowait = true },
						description = "Reject the suggested change",
					},
					stop = {
						modes = { n = "q" },
						index = 4,
						callback = "keymaps.stop",
						description = "Stop request",
					},
				},
			},
		},
		display = {
			action_palette = {
				width = 95,
				height = 10,
				prompt = "Prompt",
				provider = "telescope",
				opts = {
					show_preset_actions = true,
					show_preset_prompts = true,
					title = "CodeCompanion actions",
				},
			},
			inline = {
				layout = "vertical",
			},
		},
		opts = {
			log_level = "DEBUG",
		},
	})
end

-- Run setup after plugins load
vim.defer_fn(setup_codecompanion, 100)

---- Code Companion Keymaps ----
vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat<CR>", { desc = "Open CodeCompanion Chat" })
vim.keymap.set("v", "<leader>ce", ":CodeCompanion {BUFFER}  ", { desc = "Inline Edit with AI (visual selection)" })
vim.keymap.set("v", "<leader>cf", ":'<,'>CodeCompanion /fix<CR>", { desc = "Fix selected code" })
