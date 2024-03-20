vim.g.mapleader = " "

-- switching between panes
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})

-- Risize windows with arrows
vim.api.nvim_set_keymap('n', '<C-Right>', '<CMD>vertical resize +1<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Left>', '<CMD>vertical resize -1<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Up>', '<CMD>resize -1<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Down>', '<CMD>resize +1<CR>', {noremap = true})

-- Move current line/block with Alt-j/k a la vscode (rsrsrsrsrsrs microsoft everywhere)
-- normal mode
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', {noremap = true})
-- insert mode
vim.api.nvim_set_keymap('i', '<A-j>', '<ESC>:m .+1<CR>==gi', {noremap = true})
vim.api.nvim_set_keymap('i', '<A-k>', '<ESC>:m .-2<CR>==gi', {noremap = true})
-- visual block mode
vim.api.nvim_set_keymap('x', '<A-k>', ":m '<-2<CR>gv-gv", {noremap = true})
vim.api.nvim_set_keymap('x', '<A-j>', ":m '>+1<CR>gv-gv", {noremap = true})

