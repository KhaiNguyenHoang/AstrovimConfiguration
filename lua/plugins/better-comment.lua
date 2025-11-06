return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true, -- hiển thị icon bên lề
    sign_priority = 8,
    keywords = {
      FIX = {
        icon = " ", -- icon cho FIX
        color = "error", -- highlight group
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- từ khóa thay thế
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    gui_style = {
      fg = "NONE", -- style cho chữ
      bg = "BOLD", -- style cho nền
    },
    merge_keywords = true, -- merge keywords với opts bên ngoài
    highlight = {
      multiline = true, -- highlight cho nhiều dòng
      multiline_pattern = "^.", -- pattern để bắt đầu multiline
      multiline_context = 10, -- số dòng context
      before = "", -- highlight trước keyword
      keyword = "wide", -- highlight keyword
      after = "fg", -- highlight text sau keyword
      pattern = [[.*<(KEYWORDS)\s*:]], -- regex để tìm todo comment
      comments_only = true, -- chỉ tìm trong comment
      max_line_len = 400,
      exclude = {}, -- filetype loại trừ
    },
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticInfo", "#2563EB" },
      hint = { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      test = { "Identifier", "#FF00FF" },
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      pattern = [[\b(KEYWORDS):]], -- regex cho search
    },
  },
}
