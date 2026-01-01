-- Debug Adapter Protocol (DAP) configuration
-- Configured for Python and Rust debugging
-- F-keys aligned with VS Code conventions

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Beautiful debugger UI
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',

    -- Mason integration for installing debug adapters
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  keys = {
    -- VS Code style F-keys
    { '<F5>', function() require('dap').continue() end, desc = 'Debug: Continue' },
    { '<S-F5>', function() require('dap').terminate() end, desc = 'Debug: Stop' },
    { '<F9>', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle Breakpoint' },
    { '<F10>', function() require('dap').step_over() end, desc = 'Debug: Step Over' },
    { '<F11>', function() require('dap').step_into() end, desc = 'Debug: Step Into' },
    { '<S-F11>', function() require('dap').step_out() end, desc = 'Debug: Step Out' },
    -- <leader>d Debug group
    { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
    { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Conditional Breakpoint' },
    { '<leader>dc', function() require('dap').continue() end, desc = 'Continue' },
    { '<leader>di', function() require('dap').step_into() end, desc = 'Step Into' },
    { '<leader>do', function() require('dap').step_over() end, desc = 'Step Over' },
    { '<leader>dO', function() require('dap').step_out() end, desc = 'Step Out' },
    { '<leader>dl', function() require('dap').run_last() end, desc = 'Run Last' },
    { '<leader>dp', function() require('dap').pause() end, desc = 'Pause' },
    { '<leader>dt', function() require('dap').terminate() end, desc = 'Terminate' },
    { '<leader>du', function() require('dapui').toggle() end, desc = 'Toggle UI' },
    { '<leader>de', function() require('dapui').eval() end, desc = 'Eval', mode = { 'n', 'v' } },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        'codelldb', -- Rust/C/C++
        'debugpy', -- Python
      },
    }

    -- DAP UI setup
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Automatically open/close DAP UI
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}
