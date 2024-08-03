return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },

    config = function()
        vim.keymap.set('n', '<C-b>', ':Neotree filesystem reveal left<CR>', {})

		require("neo-tree").setup({
			event_handlers = {
			{
				event = "file_opened",
				handler = function(file_path)
				  	--auto close
				  	require("neo-tree.command").execute({ action = "close" })
				end,
			}
		},

		close_if_last_window = true,

		default_component_configs = {
			git_status = {
			  	symbols = {
					added = "✚",
					modified = "",
					deleted = "✘",
					ignored = "",
					untracker = "U"
			  	},
			},
		},

		filesystem = {
			filtered_items = {
			  	visible = true,
			  	hide_dotfiles = false,
			  	hide_gitignored = false,
			},
		},
	})
    end
}