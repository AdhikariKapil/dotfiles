require("CopilotChat").setup({
	model = "claude-haiku-4.5",
	temperature = 0.1, -- lowered = focused, higher = creative
	trusted_tools = nil,
	-- window = {
	-- 	layout = "float",
	-- 	width = 80,
	-- 	height = 40,
	-- 	border = "rounded",
	-- 	title = "🤖 AI Assistant",
	-- 	zindex = 100, -- Ensure window stays on top
	-- },
	headers = {
		user = "👤 You",
		assistant = "🤖 Copilot",
		tool = "🔧 Tool",
	},
	separator = "━━",
	auto_fold = true, -- Automatically folds non-assistant messages

	prompts = {
		MyCustomPrompt = {
			prompt = "Explain how it works.",
			system_prompt = "You are very good at explaining stuff",
			mapping = "<leader>ccmc",
			description = "My custom prompt description",
		},
		Yarrr = {
			system_prompt = "You are fascinated by pirates, so please respond in pirate speak.",
		},
		NiceInstructions = {
			system_prompt = "You are a nice coding tutor, so please respond in a friendly and helpful manner.",
		},
	},
})

-- Disabled in start (need manual start)
vim.defer_fn(function()
	vim.cmd("Copilot disable")
end, 600)

vim.keymap.set("n", "<leader>ca", "<cmd>CopilotChatOpen<CR>", { desc = "Open Copilot chat window" })
vim.keymap.set("n", "<C-c>", "<cmd>CopilotChatStop<CR>", { desc = "Stop current output" })
vim.keymap.set("n", "<leader>sa", "<cmd>CopilotChatSave<CR>", { desc = "Save chat history" })
vim.keymap.set("n", "<leader>la", "<cmd>CopilotChatStop<CR>", { desc = "Load chat history" })
