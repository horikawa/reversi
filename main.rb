require 'sdl'
require './window.rb'
require './board.rb'
require './stone.rb'
require './label.rb'

WIDTH = 650
HEIGHT = 500
BOARD_LEFT= 50
BOARD_TOP=50
MENU_LEFT=500
MENU_TOP=50

window = Window.new
screen = window.screen
board = Board.new

SDL::TTF.init

#data
FIND=[1,2,3,6,7,8,11,12,13,16,17,18,21,22,23,26,27,28,31,32,33,36,37,38]
white_num = 2
black_num = 2
player = 1

#stons
black = Stone.new(Stone::STATUS_BLACK)
white = Stone.new(Stone::STATUS_WHITE)
turn = Stone.new(Stone::STATUS_BLACK)

#labels
title = Label.new("Reversi",40,[100,200,0])
slabel = Label.new("Score",40,[100,200,0])
tlabel = Label.new("Tuen",40,[100,200,0])

loop do
	t1 = Time.now

	#event_settings
	while event = SDL::Event2.poll do
		case event
			when SDL::Event2::Quit
				exit
			when SDL::Event2::MouseButtonDown
				x = event.x
				y = event.y
				bx = (x - BOARD_LEFT)/10
				by = (y - BOARD_TOP)/10
				if FIND.include?(bx) and FIND.include?(by) then 
					row = bx/5
					col = by/5
					if board.putable?(row,col,turn.status) then
						board.put_stone(row,col,turn.status)
						turn.reverse
					end
				end
			when SDL::Event2::MouseMotion
				x = event.x
				y = event.y
		end
	end

	#show background
	window.draw_background

	#show board
	board.show(screen,BOARD_LEFT,BOARD_TOP)

	#show stones
	black.show(screen,MENU_LEFT+25,MENU_TOP+25)
	white.show(screen,MENU_LEFT+25,MENU_TOP+75)
	turn.show(screen,MENU_LEFT+50,MENU_TOP+205)

	#show labels
	title.show(screen,52,5)
	slabel.show(screen,480,5)
	tlabel.show(screen,480,190)

	#screen update
	screen.update_rect(0,0,0,0)
	
	#interval managemant
	t2 = Time.now
	diff = t2 - t1
	if diff < 0.015
		sleep 0.015 - diff
	end
end
