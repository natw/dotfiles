local colors = {
  yellow               = "#ffc66d",
  oxford_blue          = "#000033",
  white                = "#ffffff",
  teal                 = "#9cffd3",
  onyx                 = "#444444",
  dark_grey            = "#202020",
  purple               = "#5f005f",
  violet_blue          = "#7980D2",
  air_superiority_blue = "#6d9cbe",
  cadet                = "#5F6B73",
  light_slate          = "#84919A",
  blue2                = "#D0D0FF",
  jeans                = "#57ADEB",
  navy_blue            = "#00005f",
  sapphire             = "#335771",
  red                  = "#af0000",
  davys_grey           = "#4e4e4e",
  eerie_black          = "#1c1c1c",
  black2               = "#262626",
  royal_purple         = "#875faf",
  bud_green            = "#87af5f",
  jet                  = "#303030",
}


local railscasts = {
  normal = {
    a = { fg = colors.oxford_blue, bg = colors.yellow, gui = 'bold' },
    b = { fg = colors.white,     bg = colors.onyx },
    c = { fg = colors.teal,      bg = colors.dark_grey },
  },
  insert = {
    a = { fg = colors.navy_blue, bg = colors.light_slate, gui = "bold" },
    c = function(_)
          return {
            fg = vim.bo.modified and colors.white or colors.teal,
            bg = vim.bo.modified and colors.purple or colors.dark_grey,
          }
        end
  },
  visual = {
  },
  replace = {
  },
  command = {
    a = { fg = colors.navy_blue, bg = colors.bud_green, gui = 'bold' },
  },
  inactive = {
    a = { fg = colors.davys_grey, bg = colors.eerie_black },
    b = { fg = colors.davys_grey, bg = colors.black2 },
    c = function(_)
          return { fg = vim.bo.modified and colors.royal_purple or colors.davys_grey, bg = colors.jet }
        end
  },
}

require("lualine").setup {
  options = {
    icons_enabled = false,
    theme = railscasts,
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
  },
}


