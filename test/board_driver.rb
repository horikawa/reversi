require 'sdl'
require './stone.rb'
require './board.rb'

WIDTH = 500
HEIGHT = 500

SDL.init(SDL::INIT_EVERYTHING)
screen = SDL.set_video_mode(WIDTH,HEIGHT,0,SDL::SWSURFACE)
screen.fill_rect(0,0,WIDTH,HEIGHT,[100,100,100])

board = Board.new

board.reverse_stone(3,3)

board.show(screen,50,50)

screen.update_rect(0,0,0,0)

sleep 5
