require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos


  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos unless prev_move_pos == nil

  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.


  def children


    results = []
    @board.each do |y|
      @row.each do |x|
        if @board[y][x].nil?
          dupe_board = @board.dup
          dupe_board([x,y], @next_mover_mark)
          result << dupe_board
        end
      end
    end

    results
  end


end
