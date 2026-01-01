return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'folke/snacks.nvim',
  },
  ft = 'python',
  keys = {
    { '<leader>pv', '<cmd>VenvSelect<cr>', desc = '[P]ython select [V]env' },
  },
  opts = {
    settings = {
      options = {
        notify_user_on_venv_activation = true,
      },
    },
  },
}

