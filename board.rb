require './stone.rb'

### Board Class ###
class Board

	#Board's constructor
	#=> foo = Board.new
	def initialize
		@board = []
		8.times do |row|
			ary = []
			8.times do |col|
				ary.push(nil)
			end
			@board.push(ary)
		end
		@board[3][3] = Stone.new(Stone::STATUS_WHITE)
		@board[3][4] = Stone.new(Stone::STATUS_BLACK)
		@board[4][3] = Stone.new(Stone::STATUS_BLACK)
		@board[4][4] = Stone.new(Stone::STATUS_WHITE)
	end

	def trace(r,c,rd,cd,status,rev)
		if r<0 or r>7 or c<0 or c>7 then
			return false
		end
		unless @board[r][c] then
			return false
		end
		if @board[r][c].status==status then
			return true
		end
		if trace(r+rd, c+cd, rd, cd, status, rev) then
			rev.push(@board[r][c])
		end
	end

	#can put on board
	#=> foo.putable?
	def putable?(row,col,status)
		if @board[row][col] then
			return false
		end
		rev = []
		trace(row-1, col-1, -1, -1, status,rev)
		trace(row, col-1, 0, -1, status, rev)
		trace(row+1, col-1, 1, -1, status, rev)
		trace(row-1, col, -1, 0, status, rev)
		trace(row+1 ,col, 1, 0, status, rev)
		trace(row-1, col+1, -1, 1, status, rev)
		trace(row, col+1, 0, 1, status, rev)
		trace(row+1, col+1, 1, 1, status, rev)

		rev.each do |stn|
			stn.reverse
		end

		if rev.length > 0 then
			return true
		else
			return false
		end
	end

	#put stone on board
	# row    : int
	# col    : int
	# status : Stone::STATUS_WHITE or Stone::STATUS_BLACK
	#=> foo.put_stone(2,4,Stone::STATUS_WHITE)
	def put_stone(row,col,status)
		if @board[row][col] then
			return false
		end
		@board[row][col] = Stone.new(status)
	end

	#reverse stone at @board[row][col]
	# row : int 
	# col : int
	#=> foo.reverse_stone(2,4)
	def reverse_stone(row,col)
		if @board[row][col] then
			@board[row][col].reverse
		end
	end

	#show board on Window
	# screen : SDL::Screen
	# left   : int
	# top    : int
	#=> foo.show(screen,50,50)
	def show(screen,left,top)
		screen.lock
		screen.fill_rect(left+4,top+4,400,400,[50,50,50])
		screen.fill_rect(left,top,400,400,[0,128,0])
		9.times do |idx|
			x = left + 50 * idx
			y = top
			screen.draw_line(x,y,x,y+400,[0,0,0])
		end
		9.times do |idx|
			x = left
			y = top + 50 * idx
			screen.draw_line(x,y,x+400,y,[0,0,0])
		end
		@board.each_with_index do |child,row|
			child.each_with_index do |stn,col|
				if stn then
					stn.show(screen,left+row*50+25,top+col*50+25)
				end
			end
		end
		screen.unlock
	end
end
