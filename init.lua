---@diagnostic disable: undefined-global
-- problems
-- eslint warns import error because modules are in docker container.
-- treesitter and vue is not working well


require('plugins')
require('plugin_lsp')
require('plugin_color')
require('plugin_ui')
require('keymaps')
require('autocmd')
