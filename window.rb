require 'sdl'
require './board.rb'

### Window Class ###
class Window
	WIDTH = 650
	HEIGHT = 500
	MENU_LEFT=500
	MENU_TOP=50

	attr_reader :screen

	# Window constructor
	def initialize
		SDL.init(SDL::INIT_EVERYTHING)
		@screen = SDL.set_video_mode(WIDTH,HEIGHT,0,SDL::SWSURFACE)
	end

	# draw background
	def draw_background
		@screen.fill_rect 0,0,WIDTH,HEIGHT,[100,100,100]
	end
end
