return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup {
        groups = { -- mặc định các group sẽ clear bg
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        extra_groups = {}, -- có thể thêm highlight group khác
        exclude_groups = {}, -- giữ lại group không xoá bg
      }
    end,
  },
}
