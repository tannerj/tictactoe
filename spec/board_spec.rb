require 'spec_helper'

RSpec.describe TicTacToe::Board do

  it "renders tic tac toe board" do
    expect { subject.render() }.to output("   1   2   3 \nA    |   |   \n  ---+---+---\nB    |   |   \n  ---+---+---\nC    |   |   \n").to_stdout

  end

  describe "Board::update_state" do
    it "udpates the state" do
      subject.update_state( cell: "A1", value: "X" )
      expect(subject.state[:A1]).to eq("X")
    end

    it "rejects out of bounds cells" do
      expect { subject.update_state( cell: "A5", value: "X" ) }.to(
        raise_error(TicTacToe::BoardError, "Cell out of bounds.") 
      )
    end

    it "rejects unauthorized values" do
      expect { subject.update_state( cell: "A1", value: "Z" ) }.to(
        raise_error(TicTacToe::BoardError, "Unauthorized value.")
      )
    end
  end
end
