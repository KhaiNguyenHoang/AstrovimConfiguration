return {
  "quffe/nvim-nuget",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required dependency
  },
  config = function() require("nuget").setup() end,
}
