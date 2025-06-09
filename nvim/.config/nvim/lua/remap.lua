vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<C-q>', '<C-w>q', { desc = 'Close current window' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })

vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>zz', { desc = 'Next quickfix entry' })
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>zz', { desc = 'Prev quickfix entry' })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
