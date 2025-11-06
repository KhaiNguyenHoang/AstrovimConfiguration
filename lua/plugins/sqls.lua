---@type LazySpec
return {
  "nanotee/sqls.nvim",
  optional = true,
  enabled = false,
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        sqls_attach = {},
      },
    },
  },
}
