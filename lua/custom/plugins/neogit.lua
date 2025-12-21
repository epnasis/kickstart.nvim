return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed.
    'ibhagwan/fzf-lua', -- optional
    'nvim-mini/mini.pick', -- optional
    'folke/snacks.nvim', -- optional
  },
  keys = {
    { '<leader>gs', ':Neogit<CR>', mode = 'n', desc = 'Neogit open' },
    { '<leader>gc', ':Neogit commit<CR>', mode = 'n', desc = 'Neogit commit' },
    { '<leader>gp', ':Neogit pull<CR>', mode = 'n', desc = 'Neogit pull' },
    { '<leader>gP', ':Neogit push<CR>', mode = 'n', desc = 'Neogit Push' },
  },
}
