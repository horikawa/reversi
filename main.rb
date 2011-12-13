require 'sdl'

WIDTH = 640
HEIGHT = 400

SDL.init(SDL::INIT_EVERYTHING)
screen = SDL.set_video_mode(WIDTH,HEIGHT,0,SDL::SWSURFACE)

loop do
	t1 = Time.now

	#イベント処理
	while event = SDL::Event2.poll do
		case event
			when SDL::Event2::Quit
				exit
		end
	end

	screen.fill_rect(0,0,WIDTH,HEIGHT,[0,255,0]) #矩形塗りつぶし

puts "aaa"

	screen.update_rect(0,0,0,0) #画面更新

	t2 = Time.now
	diff = t2 - t1
	if diff < 0.015
		sleep 0.015 - diff
	end
end
