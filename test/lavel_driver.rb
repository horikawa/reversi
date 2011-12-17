require 'sdl'
require './label.rb'

WIDTH = 500
HEIGHT = 500

SDL.init(SDL::INIT_EVERYTHING)
screen = SDL.set_video_mode(WIDTH,HEIGHT,0,SDL::SWSURFACE)
screen.fill_rect(0,0,WIDTH,HEIGHT,[200,200,200])

lv =  Label.new("Hello",30)
lv.show(screen,10,10)

lv = Label.new("World",50)
lv2 = Label.new("V|jZhr",40,'COLOK___')
lv2.color=[0,200,255]
lv.show(screen,10,80)
lv2.show(screen,10,200)

screen.update_rect(0,0,0,0)

sleep 10
