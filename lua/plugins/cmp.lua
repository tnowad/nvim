return {
  "saghen/blink.cmp",
  dependencies = {
    "mikavilpas/blink-ripgrep.nvim",
  },
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },

    signature = { enabled = true },

    completion = {
      documentation = { auto_show = true },
      menu = {
        draw = {
          columns = {
            { "label", "label_description" },
            { "kind_icon" },
          },
        },
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer", "ripgrep" },
      providers = {
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          ---@module "blink-ripgrep"
          ---@type blink-ripgrep.Options
          opts = {
            prefix_min_len = 3,
            context_size = 5,
            max_filesize = "1M",
            project_root_marker = ".git",
            project_root_fallback = true,
            search_casing = "--ignore-case",
            fallback_to_regex_highlighting = false,
            future_features = {
              backend = {
                use = "gitgrep-or-ripgrep",
              },
            },
          },
          transform_items = function(_, items)
            for _, item in ipairs(items) do
              item.labelDetails = {
                description = "(rg)",
              }
            end
            return items
          end,
        },
      },
    },

    appearance = {
      kind_icons = {
        Text = "Text",
        Method = "Meth",
        Function = "Func",
        Constructor = "Cons",

        Field = "Field",
        Variable = "Var",
        Property = "Prop",

        Class = "Clas",
        Interface = "Inte",
        Struct = "Stru",
        Module = "Modu",

        Unit = "Unit",
        Value = "Valu",
        Enum = "Enum",
        EnumMember = "Emem",

        Keyword = "Keyw",
        Constant = "Cons",

        Snippet = "Snip",
        Color = "Colr",
        File = "File",
        Reference = "Ref",
        Folder = "Fold",
        Event = "Even",
        Operator = "Oper",
        TypeParameter = "Type",
      },
    },
  },
}
