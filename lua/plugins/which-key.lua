return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.opt.timeoutlen
    delay = 0,
    icons = {
      mappings = true,
      keys = {},
    },

    -- Document existing key chains
    spec = {
      { '<leader>s', group = 'Search', icon = '' },
      { '<leader>t', group = 'Refactor' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}
