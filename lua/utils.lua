local function add_unique(tbl, values)
  tbl = tbl or {}
  if type(values) ~= "table" then values = { values } end
  local seen = {}
  for _, v in ipairs(tbl) do seen[v] = true end
  for _, v in ipairs(values) do
    if not seen[v] then table.insert(tbl, v); seen[v] = true end
  end
  return tbl
end


return {
  add_unique = add_unique,
}
