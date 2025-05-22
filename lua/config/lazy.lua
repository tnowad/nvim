require("config.autocmds")
require("config.keymaps")
require("config.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  spec = {
    { import = "plugins.extras.lang.fish" },
    { import = "plugins.extras.lang.markdown" },
    { import = "plugins.extras.ai.copilot" },
    { import = "plugins.extras.ai.copilot-chat" },
    { import = "plugins.extras.lang.lua" },
    { import = "plugins.extras.lang.tex" },
    { import = "plugins.extras.lang.python" },
    { import = "plugins.extras.lang.typescript" },
    { import = "plugins.extras.lang.tailwindcss" },
    { import = "plugins.extras.lang.css" },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = {
    enabled = false,
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
  ui = {
    icons = {
      enabled = false,
    },
  },
})
