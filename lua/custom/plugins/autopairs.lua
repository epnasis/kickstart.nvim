-- Auto pairs for brackets, quotes, etc.
-- Integrates with blink.cmp for better completion experience

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    check_ts = true, -- Use treesitter to check for pairs
    ts_config = {
      lua = { 'string' }, -- Don't add pairs in lua string treesitter nodes
      python = { 'string' },
      rust = { 'string', 'raw_string_literal' },
    },
    fast_wrap = {
      map = '<M-e>', -- Alt+e to fast wrap
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = '$',
      before_key = 'h',
      after_key = 'l',
      cursor_pos_before = true,
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      manual_position = true,
      highlight = 'Search',
      highlight_grey = 'Comment',
    },
    disable_filetype = { 'TelescopePrompt', 'snacks_picker_input', 'vim' },
  },
}
