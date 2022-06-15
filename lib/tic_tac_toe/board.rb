require 'io/console'

module TicTacToe
class Board
  attr_reader :state

  def initialize
    @state = {
      A1: " ",
      A2: " ",
      A3: " ",
      B1: " ",
      B2: " ",
      B3: " ",
      C1: " ",
      C2: " ",
      C3: " "
    }
  end

  def render
    puts "   1   2   3 "
    puts "A  #{state[:A1]} | #{state[:A2]} | #{state[:A3]} "
    puts "  ---+---+---"
    puts "B  #{state[:B1]} | #{state[:B2]} | #{state[:B3]} "
    puts "  ---+---+---"
    puts "C  #{state[:C1]} | #{state[:C2]} | #{state[:C3]} "
  end

def update_state(cell:, value:)
  raise TicTacToe::BoardError.new("Cell out of bounds.") if !@state.has_key? cell.to_sym
  raise TicTacToe::BoardError.new("Unauthorized value.") unless value.to_s.upcase == "X" || value.to_s.upcase == "O"
  @state[cell.to_sym] = value.upcase
end

  def clear
    $stdout.clear_screen
  end
end
end
