--- @class Registry
--- @field store table<string, string[]> Registry store of values
--- @field listeners table<string, fun(payload:any)[]> Event listeners
local Registry = { store = {}, listeners = {} }

--- Provide one or more values under a given key.
--- Values are appended and deduplicated when retrieved.
--- @param key string
--- @param values string|string[]
function Registry.provide(key, values)
  if type(values) == "string" then
    values = { values }
  end
  if not Registry.store[key] then
    Registry.store[key] = {}
  end
  vim.list_extend(Registry.store[key], values)
end

--- Get all unique values registered under a key.
--- Order is preserved.
--- @param key string
--- @return string[]
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

--- Emit an event to all listeners.
--- @param event string
--- @param payload any
function Registry.emit(event, payload)
  if Registry.listeners[event] then
    for _, cb in ipairs(Registry.listeners[event]) do
      cb(payload)
    end
  end
end

--- Emit an event to all listeners asynchronously.
--- @param event string
--- @param payload any
function Registry.emit_async(event, payload)
  if Registry.listeners[event] then
    for _, cb in ipairs(Registry.listeners[event]) do
      vim.schedule(function()
        cb(payload)
      end)
    end
  end
end

--- Subscribe a callback to an event.
--- @param event string
--- @param cb fun(payload:any)
function Registry.on(event, cb)
  if not Registry.listeners[event] then
    Registry.listeners[event] = {}
  end
  table.insert(Registry.listeners[event], cb)
end

return Registry
