require 'sdl'

class Label

	def initialize(text, size, color, fontname='COLOA___')
		SDL::TTF.init
		@text = text
		@size = size
		@fontname = fontname
		@color = color
	end

	def show(screen,left,top)
		r = @color[0]
		g = @color[1]
		b = @color[2]
		font = SDL::TTF.open("font/#{@fontname}.ttf",@size,0)
		font.draw_solid_utf8(screen, @text, left+3, top+3, r/2, g/2, b/2)
		font.draw_solid_utf8(screen, @text, left, top, r, g, b)
		font.close
	end
end	
