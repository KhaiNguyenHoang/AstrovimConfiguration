-- ~/.config/nvim/lua/plugins/web-devicons.lua
return {
  "nvim-tree/nvim-web-devicons",
  lazy = false, -- chỉ load khi plugin khác cần
  config = function()
    -- Setup mặc định
    require("nvim-web-devicons").setup()
  end,
}
