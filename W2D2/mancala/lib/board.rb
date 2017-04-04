class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    @cups.each_index do |idx|
      next if idx == 6 || idx == 13
      4.times { @cups[idx] << :stone }
    end
  end

  def valid_move?(start_pos)
    if start_pos == 6 || start_pos >= 13 || start_pos < 0 ||
    @cups[start_pos].empty?
      raise 'Invalid starting cup'
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    index = start_pos

    until stones.empty?
      index += 1
      index = 0 if index > 13
      case index
      when 6
        @cups[index] << stones.pop if current_player_name == @name1
      when 13
        @cups[index] << stones.pop if current_player_name == @name2
      else
        @cups[index] << stones.pop
      end
    end
    render
    next_turn(index)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |cup_idx| @cups[cup_idx].empty? } ||
    (7..12).all? { |cup_idx| @cups[cup_idx].empty? }
  end

  def winner
    case @cups[6].count <=> @cups[13].count
    when -1
      @name2
    when 1
      @name1
    else
      :draw
    end
  end
end
