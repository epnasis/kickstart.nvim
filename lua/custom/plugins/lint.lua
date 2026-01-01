-- Linting configuration
-- Complements LSP diagnostics with additional linters

return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      python = { 'ruff' },
      markdown = { 'markdownlint' },
      dockerfile = { 'hadolint' },
      yaml = { 'yamllint' },
      json = { 'jsonlint' },
      -- Rust uses clippy via rust-analyzer, no need for separate linter
    }

    -- Create autocommand for linting
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        -- Only lint modifiable buffers
        if vim.bo.modifiable then
          lint.try_lint()
        end
      end,
    })

    -- Keymap to manually trigger linting
    vim.keymap.set('n', '<leader>ll', function()
      lint.try_lint()
    end, { desc = 'Trigger linting' })
  end,
}
