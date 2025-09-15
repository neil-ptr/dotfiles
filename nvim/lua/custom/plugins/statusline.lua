local xcodedark = require 'custom.plugins.xcodedark.colors'
local colors = xcodedark.colors

local theme = {
  normal = {
    a = { fg = colors.base6, bg = colors.base3 },
    b = { fg = colors.base6, bg = colors.surface1 },
    c = { fg = colors.base6, bg = colors.surface1 },
  },

  insert = { a = { fg = colors.base6, bg = colors.deep_purple } },
  visual = { a = { fg = colors.base6, bg = colors.deep_teal } },
  replace = { a = { fg = colors.base6, bg = colors.deep_red } },

  inactive = {
    a = { fg = colors.base5, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      theme = theme,
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { { 'mode', icon = '\u{e62b}' } },
      lualine_b = { { 'branch', icon = '' }, 'diff', 'filename' },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { 'diagnostics', 'filetype', { 'progress', icon = '󰈙' } },
      lualine_z = {
        { 'location', icon = '' },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  },
}
