-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- User Interface settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.signcolumn = "yes"    -- Always show sign column
vim.opt.cursorline = true     -- Highlight the current line
vim.opt.cursorcolumn = true   -- Highlight the current column
vim.opt.colorcolumn = "80"    -- Highlight column 80
vim.opt.scrolloff = 10        -- Minimum number of screen lines to keep above and below the cursor
vim.opt.wrap = false          -- Disable line wrapping
vim.opt.showmode = false      -- Do not show mode in the command line

-- Mouse settings
vim.opt.mouse = "" -- Disable mouse

-- Clipboard settings
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Indentation settings
vim.opt.shiftwidth = 2     -- Number of spaces for each step of (auto)indent
vim.opt.tabstop = 2        -- Number of spaces that a <Tab> counts for
vim.opt.softtabstop = 2    -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.smartindent = true -- Smart autoindenting when starting a new line
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.autoindent = true  -- Copy indent from current line when starting a new line
vim.opt.breakindent = true -- Wrap indent to match line start

-- Search settings
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true  -- Override ignorecase if search pattern contains upper case characters
vim.opt.hlsearch = true   -- Highlight all matches of search pattern

-- File handling
vim.opt.undofile = true  -- Save undo history to an undo file
vim.opt.swapfile = false -- Do not use swapfile

-- Performance settings
vim.opt.updatetime = 250 -- Faster completion (default is 4000 ms)
vim.opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete

-- Window splitting
vim.opt.splitright = true -- Vertical splits will automatically be to the right
vim.opt.splitbelow = true -- Horizontal splits will automatically be below

-- Display settings
vim.opt.list = true -- Show some invisible characters
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- Define characters for displaying hidden characters

-- Command-line
vim.opt.inccommand = "split" -- Live preview of substitution

-- Syntax highlighting
vim.opt.syntax = "off"  -- Enable syntax highlighting
vim.opt.synmaxcol = 240 -- Maximum column for syntax highlighting

-- Custom settings
vim.g.have_nerd_font = false      -- Custom variable for nerd fonts
vim.g.loaded_python_provider = 0  -- Disable python provider
vim.g.loaded_python3_provider = 0 -- Disable python3 provider
vim.g.loaded_ruby_provider = 0    -- Disable ruby provider
vim.g.loaded_perl_provider = 0    -- Disable perl provider
vim.g.root_spec = { "cwd" }
