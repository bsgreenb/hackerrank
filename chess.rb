# https://www.hackerrank.com/challenges/simplified-chess-engine-ii/problem
class Board
  def initialize(white_pieces, black_pieces, num_moves = 0, white_to_move = true)
    @white_board = Array.new(4) { Array.new(4) }
    @black_board = Array.new(4) { Array.new(4) }
    @chessToArr = {
      "4"=> 0,
      "3"=> 1,
      "2"=> 2,
      "1"=> 3,
      "A"=> 0,
      "B"=> 1,
      "C"=> 2,
      "D"=> 3
    }

    white_pieces.each do |piece|
      @white_board[@chessToArr[piece[2]]][@chessToArr[piece[1]]] = piece[0]
    end

    black_pieces.each do |piece|
      @black_board[@chessToArr[piece[2]]][@chessToArr[piece[1]]] = piece[0]
    end

    puts @white_board.inspect
    puts @black_board.inspect
  end

  def self.white_won?

  end

  def self.possible_boards
    possible_boards = []
    if white_to_move
      @white_board.each_with_index do |white_board_row, i|
        white_board_row.each do |piece, j|
          next if piece.nil?
          if (piece == "Q")
            # Vertical up

            while (i )
            # Vertical down

            #Horizontal left
            #Horizontal right

            #Diagonal up right
            #Diagonal up left
            #Diagonal down right
            #Diagonal down left

          end
        end

      end
    else
      # handle black case
    end
  end
end

game = Board.new([["Q", "B", "1"], ["P", "B", "3"]], [["Q", "A", "4"]])
