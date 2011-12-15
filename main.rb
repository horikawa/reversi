require 'sdl'
require './window.rb'

WIDTH = 650
HEIGHT = 500
BOARD_LEFT= 50
BOARD_TOP=50
MENU_LEFT=500
MENU_TOP=50

window = Window.new
screen = window.screen

SDL::TTF.init

white = 2
black = 2
player = 1
board = [
	[0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0],
	[0,0,0,2,1,0,0,0],
	[0,0,0,1,2,0,0,0],
	[0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0]
]


loop do
	t1 = Time.now

	#event_settings
	while event = SDL::Event2.poll do
		case event
			when SDL::Event2::Quit
				exit
			when SDL::Event2::MouseButtonDown
			when SDL::Event2::MouseMotion
		end
	end

	window.paint

	#draw screen
	screen.lock

	#board_show
	board.each_with_index do |line,row|
		line.each_with_index do |elm,col|
			if elm!=0 then
				x = BOARD_LEFT + row * 50 + 25
				y = BOARD_TOP + col * 50 + 25
				if elm==1 then
					screen.draw_circle x+1,y+1,20,[255,255,255],true
					screen.draw_circle x,y,20,[0,0,0],true
				else
					screen.draw_circle x+1,y+1,20,[0,0,0],true
					screen.draw_circle x,y,20,[255,255,255],true
				end
			end
		end
	end

	#menu_show
	screen.draw_circle MENU_LEFT+25,MENU_TOP+25,20,[0,0,0],true
	screen.draw_circle MENU_LEFT+25,MENU_TOP+75,20,[255,255,255],true
	screen.draw_circle MENU_LEFT+50,MENU_TOP+210,20,[0,0,0],true

	#screen unlock
	screen.unlock

	#font_draw
	font = SDL::TTF.open("font/COLOA___.ttf", 32, 0)
	font.draw_solid_utf8 screen,"REVERSI",50,10,250,250,200
	font.close
	font = SDL::TTF.open("font/COLOA___.ttf",30,0)
	font.draw_solid_utf8 screen,sprintf("%02d",black),MENU_LEFT+60,MENU_TOP+10,255,255,255
	font.draw_solid_utf8 screen,sprintf("%02d",white),MENU_LEFT+60,MENU_TOP+60,255,255,255
	font.draw_solid_utf8 screen,"TURN",MENU_LEFT,MENU_TOP+150,255,255,200
	font.close

	#screen update
	screen.update_rect(0,0,0,0)
	
	#interval managemant
	t2 = Time.now
	diff = t2 - t1
	if diff < 0.015
		sleep 0.015 - diff
	end
end
