return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  opts = {
    options = {
      theme = 'catppuccin', -- Match your colorscheme
      component_separators = '|',
      section_separators = '',
      globalstatus = true, -- One statusline for all windows (cleaner)
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        'branch',
        {
          'diff',
          symbols = { added = ' ', modified = ' ', removed = ' ' }, -- Nice Nerd Font icons
        },
        'diagnostics',
      },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
  },
}
