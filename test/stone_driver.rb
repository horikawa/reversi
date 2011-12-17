require 'sdl'
require './stone.rb'

WIDTH = 220
HEIGHT = 120

SDL.init(SDL::INIT_EVERYTHING)
screen = SDL.set_video_mode(WIDTH,HEIGHT,0,SDL::SWSURFACE)
screen.fill_rect(0,0,WIDTH,HEIGHT,[100,100,100])

hoge = Stone.new
fugo = Stone.new(Stone::STATUS_WHITE)

hoge.show(screen,30,30)
hoge.reverse
hoge.show(screen,30,80)
fugo.show(screen,80,30)

screen.update_rect(0,0,0,0)

loop do
	while event = SDL::Event2.poll do
		case event
		when SDL::Event2::Quit
				exit
		end
	end
end

