return {
	"rmagatti/goto-preview",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("goto-preview").setup({
			default_mappings = true,
		})
	end,
}
