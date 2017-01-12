
def print_greed(board)
  board.each_with_index do |row, row_index|
    board_fields = []
    row.each do |field|
      if field.nil?
        board_fields << ' - '
      else
        board_fields << " #{field} "
      end
    end
    puts board_fields.join("|")
    if row_index < board.size - 1
      11.times {print '-'}
    end
    puts
  end
end

board_a = [
  ["x", nil, nil],
  [nil, nil, 'o'],
  ['x', 'o', nil]]

print_greed(board_a)
