---@type LazySpec
return {
  "yetone/avante.nvim",
  optional = true,
  opts = {
    instructions_file = "avante.md",
    provider = "openrouter",
    providers = {
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        model = "x-ai/grok-4-fast:free",
        api_key_name = "OPENROUTER_API_KEY",
        extra_request_body = {
          temperature = 0.7,
        },
        use_react_xml = false, -- Use standard JSON for tool calls
      },
    },
  },
}
