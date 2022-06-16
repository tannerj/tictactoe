require 'spec_helper'

RSpec.describe TicTacToe::Game do
  
  subject { TicTacToe::Game.new(board: TicTacToe::Board.new) }

  it "Adds a player turn to turn_stack" do
    current_player = subject.current_player
    expect{ subject.player_turn(cell: "A1") }.to change { subject.turn_stack.count }.by(1)
    expect(subject.turn_stack).to match_array( [[current_player, "A1"]] )
  end

  it "updates the current_player after each player_turn" do
    subject { TicTacToe::Game.new(board: TicTacToe::Board.new, current_player: "X") }
    subject.player_turn(cell: "B2")
    expect(subject.current_player).to eq("O")
    subject.player_turn(cell: "A1")
    expect(subject.current_player).to eq("X")
  end
end
