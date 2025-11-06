return {
  "iamt4nk/smm.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = {
    premium = true,
    icons = true, -- Whether to use nerdfonts

    -- debug = true,                    -- These can be used in case there are any issues and you need to debug.
    -- file = '/tmp/smm_debug.log'

    playback = {
      timer_update_interval = 250, -- How often the timer itself is  updated in ms
      timer_sync_interval = 5000, -- How often sync requests are sent to the server in ms
      playback_pos = "BottomRight", -- Options { 'TopLeft', 'TopRight', 'BottomLeft', 'BottomRight' }
      playback_width = 40, -- Width of the playback window
      progress_bar_width = 35, -- Width of the progress bar
    },

    spotify = {
      api_retry_max = 3, -- The number of times to retry before failing out.
      api_retry_backoff = 2000,
      auth = { -- These are the only absolutely required configurations.
        client_id = "<your client id>",
        callback_url = "<your callback URL>",
        callback_port = "<your callback port>",
      },
    },
  },
}
