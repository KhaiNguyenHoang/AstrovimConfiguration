return {
  "mistweaverco/kulala.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function() require("kulala").setup() end,
}
