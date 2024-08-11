return {
  "folke/noice.nvim",
  config = function()
    local noice = require("noice")

    local function myMiniView(pattern, kind)
      kind = kind or ""
      return {
        view = "mini",
        filter = {
          event = "msg_show",
          kind = kind,
          find = pattern,
        },
      }
    end

    noice.setup({
      messages = {
        view_search = "mini",
      },
      routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
        {
          filter = {
            event = "notify",
            warning = true,
            find = "failed to run generator.*is not executable",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "AutoSave: saved",
          },
          opts = { skip = true }, -- このメッセージを完全にスキップ
        },
        myMiniView("Config Change Detected. Reloading..."),
        myMiniView("Already at .* change"),
        myMiniView("written"),
        myMiniView("yanked"),
        myMiniView("more lines?"),
        myMiniView("fewer lines?"),
        myMiniView("fewer lines?", "lua_error"),
        myMiniView("change; before"),
        myMiniView("change; after"),
        myMiniView("line less"),
        myMiniView("lines indented"),
        myMiniView("No lines in buffer"),
        myMiniView("search hit .*, continuing at", "wmsg"),
        myMiniView("E486: Pattern not found", "emsg"),
      },
    })
  end,
}
