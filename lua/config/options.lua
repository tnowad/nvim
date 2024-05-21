-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- General settings
vim.opt.mouse = '' -- Disable mouse support
vim.opt.showmode = false -- Don't show the mode (already in status line)
vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history
vim.opt.swapfile = false -- Disable swap file
vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.smartcase = true -- Case-sensitive if capital letters present
vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time
vim.opt.splitright = true -- Open new vertical splits to the right
vim.opt.splitbelow = true -- Open new horizontal splits below

-- Display options
vim.opt.list = true -- Display certain whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Set how whitespace characters are displayed

-- Indentation
vim.opt.shiftwidth = 2 -- Number of spaces for each indentation level
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
vim.opt.smartindent = true -- Enable smart indentation
vim.opt.softtabstop = 2 -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.wrap = false -- Disable line wrapping

-- Search and substitution
vim.opt.inccommand = 'split' -- Preview substitutions live as you type
vim.opt.hlsearch = true -- Highlight search results

-- Cursor settings
vim.opt.cursorline = true -- Highlight the current line
vim.opt.cursorcolumn = true -- Highlight the current column
vim.opt.colorcolumn = '80' -- Highlight column 80

-- Scroll settings
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor

-- [[ Custom settings ]]
vim.g.have_nerd_font = false
