local Registry = { store = {}, listeners = {} }

function Registry.provide(key, values)
  if type(values) == "string" then
    values = { values }
  end
  if not Registry.store[key] then
    Registry.store[key] = {}
  end
  vim.list_extend(Registry.store[key], values)
end

function Registry.get(key)
  local vals = Registry.store[key] or {}
  local seen, result = {}, {}
  for _, v in ipairs(vals) do
    if not seen[v] then
      table.insert(result, v)
      seen[v] = true
    end
  end
  return result
end

function Registry.emit(event, payload)
  if Registry.listeners[event] then
    for _, cb in ipairs(Registry.listeners[event]) do
      cb(payload)
    end
  end
end

function Registry.on(event, cb)
  if not Registry.listeners[event] then
    Registry.listeners[event] = {}
  end
  table.insert(Registry.listeners[event], cb)
end

return Registry
