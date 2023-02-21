local lush = require('lush')
local hsl = lush.hsl

local palette = {
  base = hsl(37, 100, 91),
  surface = hsl(37, 58, 84),
  overlay = hsl(37, 64, 72),
  muted = hsl(257, 11, 65),
  subtle = hsl(248, 31, 74),
  -- text = hsl(285, 13, 54),
  -- text = hsl(300, 3, 64),
  -- text = hsl(330, 59, 68),
  -- text = hsl(330, 42, 68),
  -- text = hsl(248, 20, 58),
  text = hsl(290, 20, 66), -- mix
  text_alt = hsl(307, 2, 78),
  red = hsl(346, 87, 65),
  -- orange = hsl(356, 76, 70),
  orange = hsl(356, 70, 68), -- More pastel
  yellow = hsl(35, 87, 67),
  green = hsl(168, 42, 54),
  blue = hsl(191, 52, 63),
  purple = hsl(295, 52, 76),
	highlight_low = hsl(168, 34, 81),
	highlight_med = hsl(168, 44, 94), -- highl
	highlight_high = hsl(168, 54, 75),
  none = 'NONE',

  border = hsl(185, 45, 43),

  love = hsl(343, 76, 68),
	gold = hsl(35, 88, 72),
	rose = hsl(2, 66, 75),
	pine = hsl(197, 48, 47),
	foam = hsl(189, 43, 73),
	iris = hsl(267, 57, 78),
}

return palette
