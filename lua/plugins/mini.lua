-- docs: https://github.com/echasnovski/mini.nvim
return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.comment').setup()

    require('mini.move').setup({
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = 'H',
        right = 'L',
        down = 'J',
        up = 'K',

        -- Move current line in Normal mode
        line_left = '',
        line_right = '',
        line_down = '',
        line_up = '',
      },
    })

    require('mini.pairs').setup()

    -- Simple and easy statusline.
    local statusline = require('mini.statusline')
    statusline.setup({ use_icons = true })

    statusline.section_location = function()
      return '%2l:%-2v (%2P)'
    end
  end,
}
