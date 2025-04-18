return {
  "saghen/blink.cmp",
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
      default = { "lsp", "path", "snippets", "buffer" },
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
