return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function ()
        local telescope = require('telescope')
        local te_builtin = require("telescope.builtin")

        telescope.setup {
            pickers = { find_files = { hidden = true } }
        }

        vim.keymap.set('n', '<C-p>', te_builtin.find_files, {})
        vim.keymap.set('n', '<C-f>', te_builtin.live_grep, {})
    end
}
