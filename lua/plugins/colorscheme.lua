return {
  "Mofiqul/adwaita.nvim",
  priority = 1000,
  config = function()
    vim.g.adwaita_darker = true
    vim.g.adwaita_disable_cursorline = true
    vim.g.adwaita_transparent = true
    vim.cmd("colorscheme adwaita")
  end,
}
