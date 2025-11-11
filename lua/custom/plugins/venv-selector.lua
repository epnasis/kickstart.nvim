return {
  'linux-cultist/venv-selector.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  ft = 'python', -- Load when opening Python files
  opts = {
    -- A list of venv directory names to look for
    name = { '.venv', 'venv' },
    -- Command to create the virtual environment if none is found
    search = {}, -- if you add your own searches, they go here.
    options = {}, -- if you add plugin options, they go here.
  },
  keys = {
    { '<leader>pv', '<cmd>VenvSelect<cr>', desc = '[P]ython select [V]env' },
  },
  config = function(_, opts)
    require('venv-selector').setup(opts)
  end,
}
