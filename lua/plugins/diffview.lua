-- diffview
	return {
  	"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	  lazy = true,
	  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
	  config = function()
	    require("diffview").setup({
	      use_icons = true, -- Set to true if your terminal supports icons
	      view = {
	        merge_tool = {
	          layout = "diff3_mixed",
	          disable_diagnostics = true,
	        },
	      },
	      hooks = {
	        diff_buf_read = function()
	          vim.opt_local.wrap = false
	          vim.opt_local.list = false
	        end,
	      },
	    })
	  end,
	}
