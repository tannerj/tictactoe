require 'spec_helper'

RSpec.describe TicTacToe::Game do

  it "sets game_state to open" do
    expect(subject.game_state).to eq(TicTacToe::Game::GAME_STATE_OPEN)
  end
  
  it "Adds a player turn to turn_stack" do
    current_player = subject.current_player
    expect{ subject.player_turn(cell: "A1") }.to change { subject.turn_stack.count }.by(1)
    expect(subject.turn_stack).to match_array( [[current_player, "A1"]] )
  end

  it "updates the current_player after each player_turn" do
    current_player = subject.current_player
    subject.player_turn(cell: "B2")
    expect(subject.current_player).to_not eq(current_player)
  end

  it "calls Board#update_state" do
    board = double()
    allow(board).to receive(:state).and_return(TicTacToe::Board.new.state)
    game = TicTacToe::Game.new( board: board )
    expect(board).to receive(:update_state).with(cell: "A1", value: game.current_player)

    game.player_turn( cell: "A1" )
  end

  it "detects a winning move" do
    board = TicTacToe::Board.new
    board.update_state(cell: "A1", value: "X")
    board.update_state(cell: "A2", value: "X")
    game = TicTacToe::Game.new( board: board, current_player: "X" )
    game.player_turn( cell: "A3" )

    expect(game.game_state).to eq(TicTacToe::Game::GAME_STATE_CLOSED)
  end

  it "detects a drawn board" do
    subject.player_turn( cell: "A1" )
    subject.player_turn( cell: "A2" )
    subject.player_turn( cell: "A3" )
    subject.player_turn( cell: "C3" )
    subject.player_turn( cell: "B1" )
    subject.player_turn( cell: "B2" )
    subject.player_turn( cell: "B3" )
    subject.player_turn( cell: "C1" )
    subject.player_turn( cell: "C2" )

    # Drawn game...
    expect(subject.game_state).to eq(TicTacToe::Game::GAME_STATE_DRAW)
  end
end
