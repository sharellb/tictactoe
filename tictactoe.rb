require 'yaml'

class TicTacToe
	def initialize
		@board = (1..9).to_a
		@available_positions = @board
		@turns = 0
		@win = false
	end

	def play
		until @turns >= 9 || @win == true
			take_turn
		end
		display_board
		if @turns >= 9 
			puts "It's a tie!"
		elsif @win == true
			if @turns % 2 == 0
				puts "Player O won!"
			else
				puts "Player X won!"
			end
		end
	end
	
	def check_board #defines all of the winning conditions
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

	def display_board
		puts "#{@board[0]}|#{@board[1]}|#{@board[2]}"
		puts "#{@board[3]}|#{@board[4]}|#{@board[5]}"
		puts "#{@board[6]}|#{@board[7]}|#{@board[8]}"
	end

	def instructions(player_name)
		puts "It's your turn #{player_name}."
		puts "Choose your position by typing the number it represents on the board."
		puts "or type 'save' to save the game."
		display_board
	end

	def update_board(symbol)
		position = gets.chomp

		if position == 'save'
			save
			exit(0)
		else
			position = position.to_i
		end

		if !@available_positions.include?(position)
			puts "That is not a valid number. Try again!"
			take_turn
		else
			position -= 1
			@board[position] = symbol
			@turns += 1
		end
	end

	def take_turn
		if @turns % 2 == 0
			instructions("Player X")
			update_board("x")
		else
			instructions("Player O")
			update_board("o")
		end
		check_board
	end	
end

def save
	Dir.mkdir('games') unless Dir.exist? 'games'
	name = 'games/saved.yaml'
	File.open(name, 'w') do |file|
		file.puts YAML.dump(self)
	end
	puts "Game has been saved!"
end

def start_game
	puts "Welcome to TicTacToe. Do you want to load an old game? (y/n)"
	old_game = gets.chomp
	if old_game == "y" #load old game
		content = File.open('games/saved.yaml', 'r') {|file| file.read }
		game = YAML.load(content) 
		game.play
	elsif old_game == "n" #start new game
		game = TicTacToe.new
		game.play
	else
		puts "That's not an option. Try again!"
		start_game
	end
end

start_game