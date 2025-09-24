return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "scalameta/nvim-metals",
  },
  opts = function()
    local dap = require("dap")

    dap.configurations.scala = {
      {
        type = "scala",
        request = "launch",
        name = "Run or Test Target",
        metals = {
          runType = "runOrTestFile",
        },
      },
    }

    -- Register the scala adapter
    dap.adapters.scala = function(callback, config)
      local metals = require("metals")
      if config.metals then
        metals.setup_dap()
      end
      callback({
        type = "server",
        host = "127.0.0.1",
        port = 5005,
      })
    end
  end,
}
