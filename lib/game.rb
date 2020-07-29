class Game
  def initialize
    @board = [*1..9]
  end

  def start_game
    print 'Player 1: '
    @plyr1 = gets.chomp
    print 'Player 2: '
    @plyr2 = gets.chomp
    # validate player input

  end

  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '---------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    

  end

  def player_input(player)
    print "#{player}'s Turn: "
    @user_input = gets.chomp.to_i

    get_num = true

    while get_num
      if @user_input <= 0 or @user_input > 9
        print "#{player}, Pls give a number between 1 and 9: "
        @user_input = gets.chomp.to_i
      end
      @user_input.positive? && @user_input < 10 ? get_num = false : nil
    end
    if player == @plyr1
      @board[@user_input - 1] = "X"
    else   
      @board[@user_input - 1] = "Y"  
    end
  end

  def position_taken?(idx)
    !(@board[idx].nil? || @board[idx] == " ")
  end

  def valid_move?(idx)
    idx.between?(0,8) && !position_taken?(idx)
  end

  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "Y"
        turn += 1
      end
    end
    return turn
  end

  def playing
    game_on = true
    i = 0
    while game_on
      display_board
      player_input(@plyr1)
      display_board
      player_input(@plyr2)
      num = @board.count{ |x| x.is_a?(Numeric)}
      if num == 0
        puts 'Game is over'
        game_on = false
      end
      i += 1
    end
  end
end
