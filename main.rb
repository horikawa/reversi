require 'sdl'

WIDTH = 800
HEIGHT = 500
BOARD_LEFT= 50
BOARD_TOP=50
MENU_LEFT=500
MENU_TOP=50

SDL.init(SDL::INIT_EVERYTHING)
screen = SDL.set_video_mode(WIDTH,HEIGHT,0,SDL::SWSURFACE)

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

	#draw screen
	screen.lock

	#screen_initialize
	screen.fill_rect 0,0,WIDTH,HEIGHT,[100,100,100] #‹éŒ`“h‚è‚Â‚Ô‚µ
	
	#board_initialize
	screen.fill_rect BOARD_LEFT, BOARD_TOP, 400, 400, [0,128,0]
	9.times do |idx|
		x0 = BOARD_LEFT + 50 * idx
		y0 = BOARD_TOP
		screen.draw_line x0, y0, x0, y0 + 400, [0,0,0]
	end
	9.times do |idx|
		x0 = BOARD_LEFT
		y0 = BOARD_TOP + 50 * idx
		screen.draw_line x0, y0, x0 + 400, y0, [0,0,0]
	end	
	
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

	screen.draw_circle MENU_LEFT+25,MENU_TOP+25,20,[0,0,0],true
	screen.draw_circle MENU_LEFT+25,MENU_TOP+75,20,[255,255,255],true

	#screen unlock
	screen.unlock

	#screen update
	screen.update_rect(0,0,0,0)
	
	#interval managemant
	t2 = Time.now
	diff = t2 - t1
	if diff < 0.015
		sleep 0.015 - diff
	end
end
