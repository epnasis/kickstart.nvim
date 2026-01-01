-- Python debugging support via debugpy
-- Works with the venv-selector plugin to use the active virtual environment

return {
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    -- Try to use debugpy from Mason, fallback to system python
    local mason_path = vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/bin/python'
    if vim.fn.executable(mason_path) == 1 then
      require('dap-python').setup(mason_path)
    else
      require('dap-python').setup 'python'
    end
  end,
  keys = {
    -- Python-specific debug under <leader>p (Python group)
    { '<leader>pt', function() require('dap-python').test_method() end, desc = 'Debug Test Method', ft = 'python' },
    { '<leader>pc', function() require('dap-python').test_class() end, desc = 'Debug Test Class', ft = 'python' },
    { '<leader>ps', function() require('dap-python').debug_selection() end, desc = 'Debug Selection', mode = 'v', ft = 'python' },
  },
}
