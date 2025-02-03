---@type LazyPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  keys = {
    {
      "<leader>sh",
      "<cmd>lua require('telescope.builtin').help_tags()<CR>",
      desc = "Telescope: Show Help Tags",
    },
    {
      "<leader>sk",
      "<cmd>lua require('telescope.builtin').keymaps()<CR>",
      desc = "Telescope: List Keymaps",
    },
    {
      "<leader>sf",
      "<cmd>lua require('telescope.builtin').find_files()<CR>",
      desc = "Telescope: Find Files",
    },
    {
      "<leader>ss",
      "<cmd>lua require('telescope.builtin').builtin()<CR>",
      desc = "Telescope: List Pickers",
    },
    {
      "<leader>sw",
      "<cmd>lua require('telescope.builtin').grep_string()<CR>",
      desc = "Telescope: Grep Current Word",
    },
    {
      "<leader>sg",
      "<cmd>lua require('telescope.builtin').live_grep()<CR>",
      desc = "Telescope: Live Grep Search",
    },
    {
      "<leader>sd",
      "<cmd>lua require('telescope.builtin').diagnostics()<CR>",
      desc = "Telescope: Show Diagnostics",
    },
    {
      "<leader>sr",
      "<cmd>lua require('telescope.builtin').resume()<CR>",
      desc = "Telescope: Resume Last Picker",
    },
    {
      "<leader>s.",
      "<cmd>lua require('telescope.builtin').oldfiles()<CR>",
      desc = "Telescope: Recent Files",
    },
    {
      "<leader><leader>",
      "<cmd>lua require('telescope.builtin').buffers()<CR>",
      desc = "Telescope: Open Buffers",
    },
    {
      "<leader>sn",
      "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })<CR>",
      desc = "Telescope: Neovim Config Files",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
  end,
}
