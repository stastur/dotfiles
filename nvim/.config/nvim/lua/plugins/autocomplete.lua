return {
  'saghen/blink.cmp',
  version = '1.*',
  config = function()
    require('blink.cmp').setup {
      keymap = {
        preset = 'enter',
      },

      completion = {
        documentation = {
          auto_show = true
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false
          }
        },
        menu = {
          draw = {
            columns = {
              { "label", "source_name", gap = 1 }
            }
          }
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets' },
      },

      fuzzy = { implementation = 'prefer_rust_with_warning' },

      signature = { enabled = true },
    }
  end
}
