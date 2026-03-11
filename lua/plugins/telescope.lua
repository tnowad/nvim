local ok_tel,telescope = pcall(require,"telescope")

if ok_tel then
  telescope.setup({
    defaults = {
      mappings = { i = { ["<C-u>"]=false,["<C-d>"]=false } }
    },
    extensions = {
      fzf = {
        fuzzy=true,
        override_generic_sorter=true,
        override_file_sorter=true,
        case_mode="smart_case"
      }
    }
  })

  pcall(telescope.load_extension,"fzf")

  local map = vim.keymap.set
  local builtin = require("telescope.builtin")

  map('n','<leader>ff',builtin.find_files,{desc='find files'})
  map('n','<leader>fb',builtin.buffers,{desc='find buffers'})
  map('n','<leader>fr',builtin.oldfiles,{desc='find recent'})
  map('n','<leader>fs',builtin.lsp_document_symbols,{desc='find symbols'})
  map('n','<leader>fS',builtin.lsp_workspace_symbols,{desc='find workspace symbols'})

  map('n','<leader>ss',builtin.live_grep,{desc='search project'})
  map('n','<leader>sw',builtin.grep_string,{desc='search word'})
  map('n','<leader>sb',builtin.current_buffer_fuzzy_find,{desc='search buffer'})
  map('n','<leader>sd',builtin.diagnostics,{desc='search diagnostics'})
  map('n','<leader>sr',builtin.resume,{desc='resume search'})
end
