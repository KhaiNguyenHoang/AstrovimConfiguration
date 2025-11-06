return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async", -- Phụ thuộc bắt buộc
    },
    event = "BufReadPost", -- Tải plugin sau khi mở buffer
    opts = {
      -- Cấu hình tùy chọn cho nvim-ufo
      open_fold_hl_timeout = 150,
      provider_selector = function(bufnr, filetype, buftype)
        -- Ưu tiên Treesitter, fallback sang indent
        return { "treesitter", "indent" }
      end,
      close_fold_kinds_for_ft = {
        default = { "imports", "comment" },
        json = { "array" },
        c = { "comment", "region" },
      },
      preview = {
        win_config = {
          border = { "", "─", "", "", "", "─", "", "" },
          winhighlight = "Normal:Folded",
          winblend = 0,
        },
        mappings = {
          scrollU = "<C-u>",
          scrollD = "<C-d>",
          jumpTop = "[",
          jumpBot = "]",
          close = "q",
          switch = "<Tab>",
          trace = "<CR>",
        },
      },
    },
    init = function()
      -- Cấu hình các tùy chọn fold cần thiết
      vim.o.foldcolumn = "1" -- Hiển thị cột gấp
      vim.o.foldlevel = 99 -- Mở tất cả fold mặc định
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Ánh xạ phím tắt
      vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
      vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Close folds with level" })
      vim.keymap.set("n", "K", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover() -- Fallback sang LSP hover nếu không có fold
        end
      end, { desc = "Preview fold or LSP hover" })
    end,
  },
}
