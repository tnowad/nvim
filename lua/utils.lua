local M = {}

---comment
---@param tbl any
---@param vals string|string[]
---@return any
function M.list_insert_unique(tbl, vals)
  if not tbl then
    tbl = {}
  end
  if type(vals) ~= "table" then
    vals = { vals }
  end
  for _, val in ipairs(vals) do
    if not vim.tbl_contains(tbl, val) then
      table.insert(tbl, val)
    end
  end

  return tbl
end

return M
