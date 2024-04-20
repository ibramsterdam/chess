require_relative "modules/base_piece"

class Queen
  include BasePiece
  WHITE_SYMBOL = "♕".freeze
  BLACK_SYMBOL = "♛".freeze

  def initialize color
    @color = color
  end

  def symbol
    @color == "white" ? WHITE_SYMBOL : BLACK_SYMBOL
  end
end
