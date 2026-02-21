-- lua/plugin_loader.lua

local plugin_specs = {}

-- 1. Ask Neovim to find all Lua files inside the 'lua/plugins/' directory
-- The 'true' argument tells it to return all matches across the runtimepath
local plugin_files = vim.api.nvim_get_runtime_file("lua/plugins/*.lua", true)

-- 2. Iterate through the found files
for _, file_path in ipairs(plugin_files) do

  -- Extract just the filename without the '.lua' extension
  -- e.g., "/nix/store/.../lua/plugins/conform.lua" -> "conform"
  local file_name = file_path:match("([^/\\]+)%.lua$")

  if file_name then
    -- Require the file and insert its returned table into our list
    local spec = require("plugins." .. file_name)
    table.insert(plugin_specs, spec)
  end

end

-- 3. Feed the dynamically generated list to lz.n
require("lz.n").load(plugin_specs)
