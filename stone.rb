class Stone
	BLACK=[0,0,0]
	WHITE=[255,255,255]
	STATUS_BLACK=1
	STATUS_WHITE=2

	#constructor
	#=> foo = Stone.new
	#=> foo = Stone.new(Stone::STATUS_WHITE)
	def initialize(status=STATUS_BLACK)
		@status = status
		case @status
		when STATUS_BLACK
			black
		when STATUS_WHITE
			white
		end
	end

	#upper black
	def black
		@upper = BLACK
		@lower = WHITE
	end
	
	#upper white
	def white
		@upper = WHITE
		@lower = BLACK
	end

	#reverse this stone
	#=> foo.reverse
	def reverse
		case @status
		when STATUS_BLACK
			@status = STATUS_WHITE
			white
		when STATUS_WHITE
			@status = STATUS_BLACK
			black
		end
	end

	#draw stone on screen
	#=> foo.show(screen, 100, 100)
	def show(screen,x,y)
		screen.lock
		screen.draw_circle(x+1,y+1,20,@lower,true)
		screen.draw_circle(x,y,20,@upper,true)
		screen.unlock
	end
end

