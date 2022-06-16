module TicTacToe
  class Application
    
    def initialize
      @game = TicTacToe::Game.new
    end
    
    def run
      puts "Welcome to TicTacToe!"
      puts "#{@game.current_player} goes first."
      puts " "
      @game.board.render
      puts "\n#{@game.current_player} chooses cell: (ex: A1)"
      user_input = gets.chomp
      @game.player_turn cell: user_input
      @game.board.clear

      while @game.game_state == TicTacToe::Game::GAME_STATE_OPEN
        puts "#{@game.current_player}'s move:\n\n"
        @game.board.render
        puts "\n#{@game.current_player} chooses cell: (ex: A1)"
        user_input = gets.chomp
        @game.player_turn cell: user_input
        @game.board.clear
      end
      puts "Game Over! #{@game.current_player} wins!!!"
    end
  end
end
