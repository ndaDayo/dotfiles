return {
  "phaazon/hop.nvim",
  branch = "v2", -- optional but strongly recommended
  opts = {
    keys = "etovxqpdygfblzhckisuran",
  },
  keys = function()
    local directions = require("hop.hint").HintDirection
    return {
      {
        "f",
        function()
          require("hop").hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end,
        desc = "Hop forward to character",
      },
      {
        "F",
        function()
          require("hop").hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end,
        desc = "Hop backward to character",
      },
      {
        "t",
        function()
          require("hop").hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
        end,
        desc = "Hop forward before character",
      },
      {
        "T",
        function()
          require("hop").hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
        end,
        desc = "Hop backward before character",
      },
      {
        "s",
        function()
          require("hop").hint_words()
        end,
        desc = "Hop to word",
      },
      {
        "S",
        function()
          require("hop").hint_patterns()
        end,
        desc = "Hop to pattern",
      },
    }
  end,
}
