local modules_config = require("config.modules")

vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/chomosuke/typst-preview.nvim' },
  { src = 'https://github.com/echasnovski/mini.pick' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/Saghen/blink.cmp' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
})

require("mini.pick").setup()
require("oil").setup()
require("mason").setup()
require('blink-cmp').setup({ appearance = { nerd_font_variant = "normal" } })

local mason_tools = {}

for _, mod_conf in ipairs(modules_config) do
  if mod_conf.enable then
    local mod = require(mod_conf.import)
    if mod.mason_tools then
      vim.list_extend(mason_tools, mod.mason_tools)
    end
    if mod.setup then
      mod.setup()
    end
  end
end

require("mason-tool-installer").setup({
  ensure_installed = mason_tools,
  auto_update = true,
  run_on_start = true,
})
