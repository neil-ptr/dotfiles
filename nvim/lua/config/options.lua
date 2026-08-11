-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Spell check everywhere. LazyVim only enables it for text/markdown/gitcommit,
-- and already sets spelllang = { "en" }.
vim.opt.spell = true
-- Split CamelCase and snake_case into separate words so identifiers in comments
-- don't get flagged wholesale.
vim.opt.spelloptions:append("camel")
