return {
  "elmcgill/springboot-nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-jdtls",
    "nvim-tree/nvim-tree.lua",
  },
  config = function()
    local springboot_nvim = require "springboot-nvim"
    springboot_nvim.setup {
      -- callback of type fun(result: table[]): nil called on JDTLS compilation result,
      -- nil defaults to opening a quickfix list if there are errors
      -- see :h jdtls.compile
      on_compile_result = nil,
    }
  end,
}
