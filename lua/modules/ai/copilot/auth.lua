local M = {}

---@param bufnr integer
---@param client vim.lsp.Client
function M.sign_in(bufnr, client)
  client:request('signIn', vim.empty_dict(), function(err, result)
    if err then return vim.notify(err.message, vim.log.levels.ERROR) end
    if result.command then
      vim.fn.setreg('+', result.userCode)
      vim.fn.setreg('*', result.userCode)
      if vim.fn.confirm('Copied code. Open browser?', '&Yes\n&No') == 1 then
        client:exec_cmd(result.command, { bufnr = bufnr }, function(cmd_err, cmd_result)
          if cmd_err then return vim.notify(cmd_err.message, vim.log.levels.ERROR) end
          if cmd_result.status == 'OK' then
            vim.notify('Signed in as ' .. cmd_result.user .. '.')
          end
        end)
      end
    elseif result.status == 'PromptUserDeviceFlow' then
      vim.notify('Enter code ' .. result.userCode .. ' in ' .. result.verificationUri)
    elseif result.status == 'AlreadySignedIn' then
      vim.notify('Already signed in as ' .. result.user .. '.')
    end
  end)
end

---@param client vim.lsp.Client
function M.sign_out(_, client)
  client:request('signOut', vim.empty_dict(), function(err, result)
    if err then return vim.notify(err.message, vim.log.levels.ERROR) end
    if result.status == 'NotSignedIn' then vim.notify('Not signed in.') end
  end)
end

return M
