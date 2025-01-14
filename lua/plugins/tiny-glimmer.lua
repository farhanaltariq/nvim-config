return {
	"rachartier/tiny-glimmer.nvim",
	event = "TextYankPost",
	config = function()
		require('tiny-glimmer').setup({
			enabled = true,
			default_animation = "pulse",
			refresh_interval_ms = 6,
		})
	end
}
