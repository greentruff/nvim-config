return {
  'neovim/nvim-lspconfig',
  version = '*',
  lazy = true,
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'saghen/blink.cmp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        map(
          '<leader>o',
          require('telescope.builtin').lsp_dynamic_workspace_symbols,
          'Workspace Symbols'
        )
        -- map('<leader>ot', require('telescope.builtin').lsp_type_definitions, '[T]ype Definition')

        map('gr', vim.lsp.buf.rename, 'Refactor: [R]ename')
        map('ga', vim.lsp.buf.code_action, 'Refactor: Code [A]ction', { 'n', 'x' })
      end,
    })

    local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
    local diagnostic_signs = {}
    for type, icon in pairs(signs) do
      diagnostic_signs[vim.diagnostic.severity[type]] = icon
    end
    vim.diagnostic.config({ signs = { text = diagnostic_signs } })

    vim.lsp.config('lua_lsp', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'client' },
          },
        },
      },
    })

    vim.lsp.enable('lua_lsp')
    vim.lsp.enable('gopls')
    vim.lsp.enable('rust_analyzer')
  end,
}
