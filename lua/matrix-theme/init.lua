-- ~/.config/nvim/lua/matrix-theme/init.lua
local M = {}

-- Definición de colores
local colors = {
    -- Colores principales
    bg = "#0a120a",
    panel = "#0f1a0f",
    border = "#1a2a1a",
    fg = "#7fcc7f",
    dim = "#3f6a3f",
    accent = "#9fff9f",
    cursor = "#1a2e1a",
    selection = "#1f3a1f",
    statusbar = "#0f1a0f",
    status_fg = "#7fcc7f",
    mode_fg = "#0a120a",
    mode_bg = "#9fff9f",

    -- Prioridades
    pri_a = "#ff8c8c",
    pri_b = "#ffd66e",
    pri_c = "#9fff9f",
    pri_d = "#7fd0ff",
    pri_other = "#cf9fff",

    -- Etiquetas y fechas
    project = "#9fff9f",
    context = "#ffb56e",
    due = "#ffd66e",
    overdue = "#ff8c8c",
    today = "#ff8c8c",
    done = "#3f6a3f",
    selected = "#1f3a1f",
    matched = "#ffd66e",
}

-- Función para aplicar los highlights
function M.setup(opts)
    opts = opts or {}

    -- Permitir sobrescribir colores desde la configuración
    colors = vim.tbl_deep_extend("force", colors, opts.colors or {})

    -- Habilitar true colors
    vim.opt.termguicolors = true

    -- Aplicar highlights
    local highlights = {
        -- Editor básico
        Normal = { fg = colors.fg, bg = colors.bg },
        NormalNC = { fg = colors.fg, bg = colors.bg },
        NormalFloat = { fg = colors.fg, bg = colors.panel },
        FloatBorder = { fg = colors.border, bg = colors.panel },

        -- Números de línea
        LineNr = { fg = colors.dim, bg = colors.bg },
        CursorLineNr = { fg = colors.accent, bg = colors.bg },
        CursorLine = { bg = colors.selection },
        Cursor = { fg = colors.bg, bg = colors.cursor },

        -- Sintaxis
        Comment = { fg = colors.dim, italic = true },
        Constant = { fg = colors.pri_b },
        String = { fg = colors.pri_c },
        Character = { fg = colors.pri_c },
        Number = { fg = colors.pri_d },
        Boolean = { fg = colors.pri_d },
        Float = { fg = colors.pri_d },
        Identifier = { fg = colors.fg },
        Function = { fg = colors.accent },
        Statement = { fg = colors.pri_b },
        Conditional = { fg = colors.pri_b },
        Repeat = { fg = colors.pri_b },
        Label = { fg = colors.pri_b },
        Keyword = { fg = colors.pri_b },
        Exception = { fg = colors.pri_a },
        PreProc = { fg = colors.pri_other },
        Include = { fg = colors.pri_other },
        Define = { fg = colors.pri_other },
        Macro = { fg = colors.pri_other },
        PreCondit = { fg = colors.pri_other },
        Type = { fg = colors.pri_d },
        StorageClass = { fg = colors.pri_d },
        Structure = { fg = colors.pri_d },
        Typedef = { fg = colors.pri_d },
        Special = { fg = colors.pri_c },
        SpecialChar = { fg = colors.pri_c },
        Tag = { fg = colors.accent },
        Delimiter = { fg = colors.fg },
        SpecialComment = { fg = colors.dim },
        Debug = { fg = colors.pri_a },
        Underlined = { fg = colors.pri_d, underline = true },
        Ignore = { fg = colors.bg },
        Error = { fg = colors.pri_a, bg = colors.bg },
        Todo = { fg = colors.mode_bg, bg = colors.mode_fg },

        -- Selección y búsqueda
        Visual = { bg = colors.selection },
        VisualNOS = { bg = colors.selection },
        Search = { fg = colors.bg, bg = colors.matched },
        IncSearch = { fg = colors.bg, bg = colors.pri_b },

        -- Status line
        StatusLine = { fg = colors.status_fg, bg = colors.statusbar },
        StatusLineNC = { fg = colors.dim, bg = colors.statusbar },
        VertSplit = { fg = colors.border, bg = colors.bg },
        WinBar = { fg = colors.accent },
        WinBarNC = { fg = colors.dim },

        -- Pestañas
        TabLine = { fg = colors.dim, bg = colors.panel },
        TabLineFill = { fg = colors.dim, bg = colors.panel },
        TabLineSel = { fg = colors.accent, bg = colors.bg },

        -- Menús
        Pmenu = { fg = colors.fg, bg = colors.panel },
        PmenuSel = { fg = colors.mode_fg, bg = colors.mode_bg },
        PmenuSbar = { bg = colors.border },
        PmenuThumb = { bg = colors.accent },
        WildMenu = { fg = colors.mode_fg, bg = colors.mode_bg },

        -- Mensajes
        ModeMsg = { fg = colors.fg },
        MoreMsg = { fg = colors.pri_c },
        Question = { fg = colors.accent },
        WarningMsg = { fg = colors.pri_a },
        ErrorMsg = { fg = colors.pri_a },

        -- Marcadores
        SignColumn = { fg = colors.dim, bg = colors.bg },
        Folded = { fg = colors.dim, bg = colors.panel },
        FoldColumn = { fg = colors.dim, bg = colors.bg },

        -- Diff
        DiffAdd = { fg = colors.pri_c, bg = colors.dim },
        DiffChange = { fg = colors.pri_b, bg = colors.dim },
        DiffDelete = { fg = colors.pri_a, bg = colors.dim },
        DiffText = { fg = colors.accent, bg = colors.dim },

        -- Enlaces especiales
        TodoProject = { fg = colors.project },
        TodoContext = { fg = colors.context },
        TodoDate = { fg = colors.due },
        TodoPriority = { fg = colors.pri_a },
    }

    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end

    -- Establecer el nombre del colorscheme
    vim.g.colors_name = "matrix"

    -- Opcional: Crear comando para recargar
    vim.api.nvim_create_user_command("MatrixReload", function()
        M.setup(opts)
        vim.notify("Matrix theme reloaded", vim.log.levels.INFO)
    end, {})
end

-- Función para obtener los colores (útil para otros plugins)
function M.get_colors()
    return colors
end

return M
