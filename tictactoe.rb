class TicTacToe
	def initialize
		welcome
		#make this a loop later
		@board = [1,2,3,4,5,6,7,8,9]
		@available_positions = @board
		@winning_positions = [[0,1,2], [1,4,8], [3,4,5], [6,7,8], [2,5,8], [0,3,6], [1,4,7], [2,4,6]]
		@player_x_positions = []
		@player_o_positions = []
		@turns = 0
		@win = false
		until @turns >= 9 || @win == true
			turn
		end
		game_over
	end

	# refactor this
	def win_game
		if @board[0] == @board[1] && @board[0] == @board[2]
			@win = true
		elsif @board[0] == @board[4] && @board[0] == @board[8]
			@win = true
		elsif @board[3] == @board[4] && @board[3] == @board[5]
			@win = true
		elsif @board[6] == @board[7] && @board[6] == @board[8]
			@win = true
		elsif @board[2] == @board[5] && @board[2] == @board[8]
			@win = true
		elsif @board[0] == @board[3] && @board[0] == @board[6]
			@win = true
		elsif @board[1] == @board[4] && @board[1] == @board[7]
			@win = true
		elsif @board[2] == @board[4] && @board[2] == @board[6]
			@win = true
		end
	end

	def welcome
		puts "Welcome to TicTacToe"
	end

	#make this a loop later
	def display_board
		puts "#{@board[0]}|#{@board[1]}|#{@board[2]}"
		puts "#{@board[3]}|#{@board[4]}|#{@board[5]}"
		puts "#{@board[6]}|#{@board[7]}|#{@board[8]}"
	end

	def instructions(player_name)
		puts "It's your turn #{player_name}."
		puts "Choose your position by typing the number it represents on the board."
		display_board
	end

	def turn
		if @turns % 2 == 0
			instructions("Player X")
			x = gets.chomp.to_i
			@player_x_positions.push(x)
			if !@available_positions.include?(x)
				puts "That is not a valid number. Try again!"
				turn
			else
				x = x - 1
				@board[x] = "x"
				@turns += 1
			end
		else
			instructions("Player O")
			o = gets.chomp.to_i
			@player_o_positions.push(o)
			if !@available_positions.include?(o)
				puts "That is not a valid number."
				turn
			else
				o = o - 1
				@board[o] = "o"
				@turns += 1
			end
		end
		win_game
	end
	
	def game_over
		display_board
		if @turns >= 9 
			puts "It's a tie!"
			exit(0)
		elsif @win == true
			puts "You won!"
			exit(0)
		end
	end
end

TicTacToe.new