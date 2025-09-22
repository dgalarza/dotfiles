return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    -- opts = {
    --   flavour = "frappe",
    -- },
    -- Remove this once the next version of catppuccin is released and the get is fixed
    opts = function(_, opts)
      local module = require("catppuccin.groups.integrations.bufferline")
      if module then
        module.get = module.get_theme
      end
      opts.flavour = "mocha"
      return opts
    end,
  },
}
