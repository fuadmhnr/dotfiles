return {
	"catgoose/nvim-colorizer.lua",
	lazy = true,
	event = { "BufRead", "InsertEnter", "BufNewFile" },
	opts = {
		user_default_options = {
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = true, -- "Name" codes like Blue
			RRGGBBAA = false, -- #RRGGBBAA hex codes
			rgb_fn = false, -- CSS rgb() and rgba() functions
			hsl_fn = false, -- CSS hsl() and hsla() functions
			css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			-- Available modes: foreground, background
			mode = "background", -- Set the display mode.
		},
		filetypes = {
			"*", -- Highlight all files, but customize some others.
			css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
			html = { names = false }, -- Disable parsing "names" like Blue or Gray
		},
	},
}
