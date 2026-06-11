-- ~/.config/nvim/lua/matrix-theme/colors/matrix.lua
-- Esto permite usar :colorscheme matrix

local theme = require("matrix-theme")
theme.setup()

return {
    name = "matrix",
    -- Para compatibilidad con :colorscheme
    colors = theme.get_colors(),
}
