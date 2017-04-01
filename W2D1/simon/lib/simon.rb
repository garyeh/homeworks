class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    countdown
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless game_over
      round_success_message
      @sequence_length += 1
      sleep(1)
      system("clear")
      sleep(1)
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep(0.5)
      system("clear")
      sleep(0.5)
    end
  end

  def require_sequence
    player_seq = []
    @seq.length.times do
      player_seq << gets.chomp
      system("clear")
    end
    @game_over = true unless player_seq == @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You passed this round!"
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  private
  def countdown
    puts "Ready? 3..."
    sleep(1)
    system("clear")
    puts "Ready? 2..."
    sleep(1)
    system("clear")
    puts "Ready? 1..."
    sleep(1)
    system("clear")
  end
end

if __FILE__ == $PROGRAM_NAME
  simon = Simon.new
  simon.play
end
