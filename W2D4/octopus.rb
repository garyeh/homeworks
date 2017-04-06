class Array
  def sluggish_eat
    wins = Hash.new(0)
    each_index do |idx1|
      each_index do |idx2|
        next if idx1 == idx2
        if self[idx1].length > self[idx2].length
          wins[idx1] += 1
        else
          wins[idx2] += 1
        end
      end
    end
    winner_idx = wins.sort_by {|k,v| v }.last.first
    self[winner_idx]
  end

  def dominant_eat
    prc = Proc.new { |x,y| x.length <=> y.length }
    merge_sort(&prc).last
  end

  def clever_eat
    record = first
    each do |el|
      record = el if el.length > record.length
    end
    record
  end

  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return self if count <= 1

    mid = count / 2
    left = take(mid).merge_sort(&prc)
    right = drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged + left + right
  end
end

def slow_dance(arrow, tiles_array)
  tiles_array.each_index do |tile_idx|
    return tile_idx if tiles_array[tile_idx] == arrow
  end
  -1
end

def fast_dance(arrow, tiles_hash)
  tiles_hash[arrow]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

tiles_hash = { "up" => 0,
               "right-up" => 1,
               "right" => 2,
               "right-down" => 3,
               "down" => 4,
               "left-down" => 5,
               "left" => 6,
               "left-up" => 7 }
p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)
