return {
  'projekt0n/github-nvim-theme',

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    lazy = false,
    config = function()
      require('rose-pine').setup {
        styles = {
          italic = false
        }
      }
      vim.cmd.colorscheme('rose-pine-moon')
    end
  }
}
