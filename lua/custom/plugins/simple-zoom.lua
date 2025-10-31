return {
  'fasterius/simple-zoom.nvim',
  opts = {
    hide_tabline = false,
  },
  -- Add this 'keys' table
  keys = {
    { '<leader>z', ':SimpleZoomToggle<CR>', mode = 'n', desc = 'Toggle [Z]oom' },
  },
}
