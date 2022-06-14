require 'spec_helper'

RSpec.describe TicTacToe::Board do
  it "renders tic tac toe board" do
    board = TicTacToe::Board.new
    expect { board.render() }.to output("test\n").to_stdout
  end
end
