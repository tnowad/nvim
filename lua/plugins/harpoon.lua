return {
  "ThePrimeagen/harpoon",

  setup = function()
    require("harpoon").setup({})
  end,
  config = function()
    local map = function(mode, key, cmd, desc)
      vim.api.nvim_set_keymap(mode, key, cmd, { noremap = true, silent = true, desc = desc })
    end

    map("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "Harpoon goto 1")
    map("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "Harpoon goto 2")
    map("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "Harpoon goto 3")
    map("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "Harpoon goto 4")
    map("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", "Harpoon goto 5")

    map("n", "<leader>ho", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoon open")
    map("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file(vim.api.nvim_buf_get_name(0))<CR>", "Harpoon add")
    map(
      "n",
      "<leader>hr",
      "<cmd>lua require('harpoon.mark').rm_file(vim.api.nvim_buf_get_name(0))<CR>",
      "Harpoon remove"
    )
    map("n", "<leader>hc", "<cmd>lua require('harpoon.mark').clear_all()<CR>", "Harpoon clear")
    map("n", "<leader>ht", "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>", "Harpoon terminal 1")
  end,
}
