-- ~/.config/nvim/ftplugin/java.lua

local ok, jdtls = pcall(require, "jdtls")
if not ok then
  vim.notify("JDTLS not found, install with :MasonInstall jdtls", vim.log.levels.ERROR)
  return
end

-- Mason JDTLS path
local jdtls_path = vim.fn.stdpath "data" .. "/mason/packages/jdtls"
local path_to_plugins = jdtls_path .. "/plugins/"
local path_to_jar = vim.fn.glob(path_to_plugins .. "org.eclipse.equinox.launcher_*.jar")
local lombok_path = path_to_plugins .. "lombok.jar"
local path_to_config = jdtls_path .. "/config_linux"

-- Find project root
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then return end

-- Workspace folder
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath "data" .. "/jdtls-workspace/" .. project_name
vim.fn.mkdir(workspace_dir, "p")

-- Basic config
local config = {
  cmd = {
    "/usr/lib/jvm/java-25-jdk/bin/java", -- adjust to your JDK
    "-javaagent:" .. lombok_path,
    "-jar",
    path_to_jar,
    "-configuration",
    path_to_config,
    "-data",
    workspace_dir,
  },
  root_dir = root_dir,
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "Java-25",
            path = "/usr/lib/jvm/java-25-jdk/",
          },
        },
      },
    },
  },
}

require("jdtls").start_or_attach(config)
