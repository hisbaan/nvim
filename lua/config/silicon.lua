return {
  "krivahtoo/silicon.nvim",
  enabled = require('flags').plugins.silicon,
  build = "./install.sh",
  opts = {
    font = "MesloLGS Nerd Font Mono",
    theme = "Catppuccin-mocha",
    output = {
      file = "",
      clipbaord = true,
      path = ".",
      format = "silicon_[year][month][day]_[hour][minute][second].png",
    },
    background = "#00000000",
    pad_horiz = 0,
    pad_vert = 0,
    line_number = false,
    line_pad = 2,
    tab_width = 2,
    gobble = false,
    round_corner = false,
    window_controls = false,
    window_title = nil,
    watermark = {
      text = nil,
    }
  }
}
