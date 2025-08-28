local function add_unique(tbl, values)
  if tbl == nil then
    tbl = {}
  end
  if type(values) ~= "table" then
    values = { values }
  end
  local seen = {}
  for _, v in ipairs(tbl) do
    seen[v] = true
  end
  for _, value in ipairs(values) do
    if not seen[value] then
      table.insert(tbl, value)
      seen[value] = true
    end
  end
  return tbl
end

return {
  add_unique = add_unique,
}
