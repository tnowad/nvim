local M = {}

--- Insert unique values into a table
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

--- Merge tables and ensure unique values in list fields
---@param extra any
---@return function
function M.merge_with_unique_lists(extra)
  return function(_, target)
    local merged = vim.tbl_deep_extend("force", {}, target or {}, extra or {})

    for key, value in pairs(target or {}) do
      if type(value) == "table" and #value > 0 and type(extra[key]) == "table" and #extra[key] > 0 then
        merged[key] = M.list_insert_unique(vim.deepcopy(value), extra[key])
      end
    end

    return merged
  end
end

return M
