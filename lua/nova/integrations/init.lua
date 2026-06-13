local integrations = {
  require("nova.integrations.treesitter"),
  require("nova.integrations.gitgutter"),
  require("nova.integrations.easymotion"),
  require("nova.integrations.fzf"),
}

local function load()
  for _, integration in ipairs(integrations) do
    integration.setup()
  end
end

return { load = load }
