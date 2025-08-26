local M = {}

M.packs = {
  { src = 'https://github.com/Saghen/blink.cmp' },
}

M.setup = function()
  require('blink-cmp').setup({ appearance = { nerd_font_variant = "normal" } })
end

return M
