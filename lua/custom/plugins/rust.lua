-- Rust development setup
-- rustaceanvim: Modern rust-analyzer integration (successor to rust-tools.nvim)
-- crates.nvim: Cargo.toml dependency management

return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    ft = { 'rust' },
    init = function()
      -- rustaceanvim doesn't use setup(), it reads from vim.g.rustaceanvim
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, bufnr)
            -- Rust-specific keymaps under <leader>c (Code group)
            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end
            map('<leader>ca', function() vim.cmd.RustLsp 'codeAction' end, 'Code Action (Rust)')
            map('<leader>cr', function() vim.cmd.RustLsp 'runnables' end, 'Runnables (Rust)')
            map('<leader>cD', function() vim.cmd.RustLsp 'renderDiagnostic' end, 'Render Diagnostic (Rust)')
            map('<leader>ce', function() vim.cmd.RustLsp 'explainError' end, 'Explain Error (Rust)')
            map('<leader>cE', function() vim.cmd.RustLsp 'openDocs' end, 'Open Docs (Rust)')
            -- Debug under <leader>d
            map('<leader>dr', function() vim.cmd.RustLsp 'debuggables' end, 'Debuggables (Rust)')
            -- Override K for Rust hover with actions
            map('K', function() vim.cmd.RustLsp { 'hover', 'actions' } end, 'Hover Actions (Rust)')
            map('J', function() vim.cmd.RustLsp 'joinLines' end, 'Join Lines (Rust)')
          end,
          default_settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = { enable = true },
              },
              checkOnSave = { command = 'clippy' },
              procMacro = {
                enable = true,
                ignored = {
                  ['async-trait'] = { 'async_trait' },
                  ['napi-derive'] = { 'napi' },
                  ['async-recursion'] = { 'async_recursion' },
                },
              },
            },
          },
        },
      }
    end,
  },

  -- Cargo.toml dependency management
  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {
      completion = {
        crates = { enabled = true },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
}
