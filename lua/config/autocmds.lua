vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Create directory before writing file",
  pattern = "*",
  group = vim.api.nvim_create_augroup("create-dir", { clear = true }),
  callback = function()
    local filepath = vim.fn.expand("<afile>:p")
    local dir = vim.fn.fnamemodify(filepath, ":h")

    if dir == "" or vim.fn.isdirectory(dir) == 1 then
      return
    end

    local choice = vim.fn.input("Directory '" .. dir .. "' does not exist. Create? (y/n): ")
    if choice:lower() == "y" then
      if vim.fn.mkdir(dir, "p") == 1 then
        print("\nCreated directory: " .. dir)
      else
        print("\nError: Failed to create directory: " .. dir)
        return
      end
    else
      print("\nAborted: Directory not created.")
      vim.cmd("echohl ErrorMsg | echom 'Write aborted' | echohl None")
      vim.cmd("silent! undo")
    end
  end,
})
