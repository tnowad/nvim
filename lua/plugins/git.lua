pcall(function()
  require("gitsigns").setup({
    signs = {
      add={text='+'},
      change={text='~'},
      delete={text='_'},
      topdelete={text='‾'},
      changedelete={text='~'},
    },

    on_attach=function(bufnr)
      local gs = package.loaded.gitsigns
      local map=function(m,l,r,d)
        vim.keymap.set(m,l,r,{buffer=bufnr,desc=d})
      end

      map('n',']c',gs.next_hunk,'next change')
      map('n','[c',gs.prev_hunk,'previous change')

      map({'n','v'},'<leader>gsh',gs.stage_hunk,'git stage hunk')
      map('n','<leader>gsb',gs.stage_buffer,'git stage buffer')

      map({'n','v'},'<leader>grh',gs.reset_hunk,'git reset hunk')
      map('n','<leader>grb',gs.reset_buffer,'git reset buffer')

      map('n','<leader>gph',gs.preview_hunk,'git preview hunk')

      map('n','<leader>gbl',function()
        gs.blame_line({full=true})
      end,'git blame line')

      map('n','<leader>gdf',gs.diffthis,'git diff file')
      map('n','<leader>gdh',function()
        gs.diffthis('~')
      end,'git diff head')

      map('n','<leader>gtb',gs.toggle_current_line_blame,'toggle blame')
      map('n','<leader>gtd',gs.toggle_deleted,'toggle deleted')

      map('n','<leader>guh',gs.undo_stage_hunk,'undo stage')
    end
  })
end)
