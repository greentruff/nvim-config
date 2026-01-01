-- Collection of various small independent plugins/modules
-- docs: https://github.com/echasnovski/mini.nvim
return {
  'echasnovski/mini.nvim',
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
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require('mini.statusline')
    statusline.setup({ use_icons = true })

    statusline.section_location = function()
      return '%2l:%-2v (%2P)'
    end
  end,
}
