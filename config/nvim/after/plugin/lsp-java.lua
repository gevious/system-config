local jdtls = require("jdtls")

local home = os.getenv("HOME")
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
  cmd = {
    "jdtls", -- ensure it's in PATH
    "-data", workspace_dir
  },
  root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew"}),
  settings = {
    java = {}
  },
}

jdtls.start_or_attach(config)

