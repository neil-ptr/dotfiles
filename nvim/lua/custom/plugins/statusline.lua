-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
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
