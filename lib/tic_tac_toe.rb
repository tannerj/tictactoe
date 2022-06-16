# frozen_string_literal: true

require_relative "tic_tac_toe/version"
require_relative "tic_tac_toe/application"
require_relative "tic_tac_toe/board"
require_relative "tic_tac_toe/game"

module TicTacToe
  class Error < StandardError; end
  class BoardError < Error; end
end
