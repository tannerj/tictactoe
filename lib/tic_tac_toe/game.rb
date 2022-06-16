module TicTacToe
  class Game
    attr_reader :current_player, :turn_stack

    def initialize(args)
      @board = args.fetch(:board, TicTacToe::Board.new)
      @turn_stack = args.fetch(:turn_stack, [])
      @current_player = args.fetch(:current_player, set_initial_player())
    end

    def player_turn(cell:)
      @turn_stack.push([@current_player, cell])
      @board.update_state( cell: cell, value: @current_player )
      @current_player = get_next_player()
    end

    private 
    def set_initial_player
      rand(2) == 0 ? "X" : "O"
    end

    def get_next_player
      @current_player == "X" ? "O" : "X"
    end
  end
end
