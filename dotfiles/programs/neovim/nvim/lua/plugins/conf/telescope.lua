local telescope = require('telescope')
telescope.setup({
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = { width = 0.9, height = 0.9 },
        },
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key",
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    },
})
telescope.load_extension("fzf") -- nvim-telescope/telescope-fzf-native.nvim
-- Other extensions I use include:
-- neorg-telescope
-- telescope-zoxide
--
-- (see respective configs)

-- TO CONSIDER
-- perhaps AckslD/nvim-neoclip.lua
-- stevearc/dressing.nvim or telescope-ui-select.nvim?
--
-- nvim-telescope/telescope-media-files.nvim if they add ueberzugpp support
-- (see https://github.com/nvim-telescope/telescope-media-files.nvim/issues/34)

local function nmap(shortcut, command)
    vim.keymap.set("n", shortcut, command)
end

-- find_files in...
nmap("<c-t>.","<cmd>Telescope find_files<cr>") -- current directory
nmap("<c-t>~","<cmd>Telescope find_files search_dirs={'$HOME'}<cr>") -- home directory
nmap("<c-t>v","<cmd>Telescope find_files search_dirs={'$HOME/.config/nvim'}<cr>") -- neovim config
nmap("<c-t>g","<cmd>Telescope find_files search_dirs={'$HOME/Desktop/git'}<cr>") -- local git repos
nmap("<c-t>m","<cmd>Telescope find_files search_dirs={'$HOME/Desktop/git/gross'}<cr>") -- nix config
nmap("<c-t>l","<cmd>Telescope find_files search_dirs={'$HOME/Documents/latex'}<cr>") -- latex documents
-- See respective extensions for their bindings
-- HINT: <c-t> is usually used for those too, e.g. <c-t>n for neorg-telescope, <c-t>z for telescope-zoxide, etc.
