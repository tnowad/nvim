return {
  'akinsho/nvim-toggleterm.lua',
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'horizontal',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'single',
        width = 200,
        height = 50,
        winblend = 3,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    }
  end,
}
