class player
  attr_reader :score, :name, :wins, :losses

  def initialize(name)
    @name = name
    @score = 0
    @wins = 0
    @losses = 0
  end

  def start_game
    @score = 0
  end

  def start_turn
    @turn_score = 0
    @turn_over = false
  end

  def record_roll(roll)
    if roll == 1
      @turn_score = 0
      @turn_over = true
    else
      @turn_score += roll
    end
  end

  def end_turn
    @score += @turn_score
  end

  def end_game
    if score >= 100
      @wins += 1
    else
      @losses += 1
    end
  end

  def roll_again?
    !@turn_over
  end
end

class cautiousplayer < player
  def roll_again?
    super && @turn_score < 2
  end
end

class fiftyplayer < player
  def roll_again?
    super && rand(2) == 1
  end
end

class badplayer < player
  def roll_again?
    super && record_roll(2)
  end
end

class betterplayer < player
  def roll_again?
    super && @turn_score <1
  end
end

class slickchance < player
  def roll_again?
    super && rand(3) == 1
  end
end

class playerend < player
  def roll_again?
    super && @turn_score < 3 && @wins < 900
  end
end
## TODO add your own player subclasses here
