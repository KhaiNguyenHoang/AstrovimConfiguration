---@type LazySpec
return {
  "folke/noice.nvim",
  optional = true,
  enabled = true,
  config = function()
    -- Patch LSP progress để tránh lỗi "attempt to concatenate field 'token' (a nil value)"
    local status_ok, noice_lsp = pcall(require, "noice.lsp.progress")
    if status_ok then
      local orig_handler = noice_lsp._on_progress
      noice_lsp._on_progress = function(...)
        local args = { ... }
        if args[1] and args[1].token == nil then args[1].token = "" end
        return orig_handler(unpack(args))
      end
    end

    -- Setup noice.nvim
    require("noice").setup {
      lsp = {
        hover = { enabled = false },
        signature = { enabled = false },
        progress = { enabled = false, view = "mini" }, -- hiển thị progress LSP
      },
      presets = {
        bottom_search = false, -- dùng classic bottom cmdline cho search
        command_palette = true, -- dùng command palette (dressing.nvim)
        long_message_to_split = false,
      },
      messages = {
        enabled = true,
        view_search = false, -- tắt view search count
      },
      routes = {
        {
          filter = { event = "msg_show", kind = "search_count" },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "Starting Supermaven" },
              { find = "Supermaven Free Tier" },
              { find = 'is deprecated. Run ":checkhealth vim.deprecated' },
            },
          },
          skip = true,
        },
        {
          filter = { event = "msg_showmode", find = "recording" },
          view = "mini",
          skip = true,
        },
        {
          filter = { event = "msg_show", find = "Hop %d char:" },
          view = "mini",
        },
        {
          filter = { event = "msg_showmode" },
          view = "mini",
        },
      },
    }
  end,
}
