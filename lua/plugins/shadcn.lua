return {
  {
    "BibekBhusal0/nvim-shadcn",
    event = "VeryLazy",
    config = function()
      require("nvim-shadcn").setup {
        -- Options:
        auto_install = true, -- automatically installs components
        notify = true, -- enable notifications
      }
    end,
  },
}
