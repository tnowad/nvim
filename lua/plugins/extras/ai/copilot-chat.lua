vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "copilot-chat",
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
  end,
})

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken",
    branch = "main",
    cmd = "CopilotChat",
    opts = {
      window = { width = 0.4 },
    },
    keys = {
      { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt" },
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<leader>aa",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle",
      },
      {
        "<leader>ax",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Clear",
      },
      {
        "<leader>aq",
        function()
          vim.ui.input({ prompt = "Quick Chat: " }, function(input)
            if input ~= "" then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        desc = "Quick Chat",
      },
      {
        "<leader>ap",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "Prompt Actions",
      },
    },
  },
}
