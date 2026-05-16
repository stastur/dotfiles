return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },

    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),

        callback = function(event)
          local nmap = function(keys, func, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
          end

          local builtin = require('telescope.builtin')
          nmap('gi', builtin.lsp_implementations, '[G]oto [I]mplementation')
          nmap('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
          nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')

          nmap('<leader>f', vim.lsp.buf.format, '[F]ormat')
          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          nmap('<leader>ca', function()
            vim.lsp.buf.code_action {
              context = {
                only = { 'quickfix', 'refactor', 'source' },
              }
            }
          end, '[C]ode [A]ction')
          nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
          nmap('H', vim.lsp.buf.signature_help, 'Signature Documentation')

          nmap('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
          nmap(']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')
          nmap('<leader>dm', vim.diagnostic.open_float, 'Open floating diagnostic message')
          nmap('<leader>dl', vim.diagnostic.setloclist, 'Open diagnostics list')
        end,
      })

      local servers = {
        ts_ls = {},

        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = {
                  vim.fn.expand("$VIMRUNTIME/lua"),
                  vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
                },
              },
              hint = { enable = true },
            },
          },
        },
      }

      require('mason').setup()
      require('mason-lspconfig').setup({ ensure_installed = vim.tbl_keys(servers) })

      for name, config in pairs(servers) do
        vim.lsp.config(name, config)
      end
    end
  }
}
