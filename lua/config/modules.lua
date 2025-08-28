return {
  -- Core editor infra
  { name = "pick",      import = "modules.core.pick",      enable = true },
  { name = "oil",       import = "modules.core.oil",       enable = true },
  { name = "blink",     import = "modules.core.blink",     enable = true },
  { name = "mason",     import = "modules.core.mason",     enable = true },
  { name = "lsp",       import = "modules.core.lsp",       enable = true },

  -- Language modules
  { name = "lua",        import = "modules.languages.lua",        enable = true },
  { name = "typescript", import = "modules.languages.typescript", enable = true },

  -- Extras / AI
  { name = "copilot",    import = "modules.ai.copilot",           enable = true },
}
