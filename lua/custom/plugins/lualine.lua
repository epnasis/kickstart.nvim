return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  opts = {
    options = {
      theme = 'catppuccin',
      globalstatus = true,
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'snacks_dashboard' } },
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
        events = { 'WinEnter', 'BufEnter', 'BufWritePost', 'SessionLoadPost', 'FileChangedShellPost', 'VimResized', 'Filetype', 'CursorMoved', 'CursorMovedI', 'ModeChanged', 'TermClose', 'FocusGained', 'RecordingEnter', 'RecordingLeave' },
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = {
        {
          'diff',
          symbols = { added = ' ', modified = ' ', removed = ' ' },
        },
        'diagnostics',
        {
          function()
            local reg = vim.fn.reg_recording()
            if reg == '' then
              return ''
            end
            return 'Recording @' .. reg
          end,
          color = { fg = '#ff9e64' },
        },
      },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  },
}
