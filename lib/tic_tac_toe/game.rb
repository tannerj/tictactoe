module TicTacToe
  class Game
    attr_reader :current_player, :turn_stack, :game_state
    
    GAME_STATE_OPEN   = "open"
    GAME_STATE_CLOSED = "closed"
    SOLUTION_SETS = [
      [:A1, :A2, :A3],
      [:B1, :B2, :B3],
      [:C1, :C2, :C3],
      [:A1, :B1, :C1],
      [:A2, :B2, :C2],
      [:A3, :B3, :C3],
      [:A1, :B2, :C3],
      [:A3, :B2, :C1]
    ]

    def initialize(args={})
      initial_player = set_initial_player()
      @board = args.fetch(:board, TicTacToe::Board.new)
      @turn_stack = args.fetch(:turn_stack, [])
      @current_player = args.fetch(:current_player, initial_player)
      @game_state = GAME_STATE_OPEN
    end

    def player_turn(cell:)
      if @game_state == GAME_STATE_OPEN
        @turn_stack.push([@current_player, cell])
        @board.update_state( cell: cell, value: @current_player )
        update_game_state()
      end

      @current_player = get_next_player() 
    end

    private 
    def set_initial_player
      rand(2) == 0 ? "X" : "O"
    end

    def get_next_player
      if @game_state == GAME_STATE_OPEN
        @current_player == "X" ? "O" : "X"
      end
    end

    def update_game_state()
      win_string = @current_player * 3
      SOLUTION_SETS.each do |set|
        solution_state = ""
        solution_state << @board.state[set[0]] << @board.state[set[1]] << @board.state[set[2]]
        @game_state = GAME_STATE_CLOSED if solution_state = win_string
      end
    end
  end
end
