local theme = {
  fill = 'TabLineFill',
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}

require('tabby.tabline').set(function(line)
  return {
    {
      { ' 󰣇 ', hl = theme.head },
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep(' ', hl, theme.fill),
        tab.is_current() and '' or '',
        tab.name(),
        line.sep(' ', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    hl = theme.fill,
  }
end)
