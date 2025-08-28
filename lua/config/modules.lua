return {
  -- Core editor infra
  { name = "mini",       import = "modules.core.mini",            enable = true },
  { name = "oil",        import = "modules.core.oil",             enable = true },
  { name = "blink",      import = "modules.core.blink",           enable = true },
  { name = "mason",      import = "modules.core.mason",           enable = true },
  { name = "lsp",        import = "modules.core.lsp",             enable = true },

  -- Language modules
  { name = "json",       import = "modules.languages.json",       enable = true },
  { name = "lua",        import = "modules.languages.lua",        enable = true },
  { name = "typescript", import = "modules.languages.typescript", enable = true },

  -- Extras / AI
  { name = "copilot",    import = "modules.ai.copilot",           enable = true },
}
