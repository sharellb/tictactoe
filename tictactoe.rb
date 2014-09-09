class TicTacToe
	def initialize
		welcome
		#make this a loop later
		@board = [1,2,3,4,5,6,7,8,9]
		@available_positions = @board
		@turns = 0
		until @turns >= 9
			turn
		end
		game_over
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
			if !@available_positions.include?(o)
				puts "That is not a valid number."
				turn
			else
				o = o - 1
				@board[o] = "o"
				@turns += 1
			end
		end
	end
	
	def game_over
		puts "It's a tie!"
		exit(0)
	end
end

TicTacToe.new