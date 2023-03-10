# frozen_string_literal: true

class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins)
    if pins == 10 # check for strike
      @rolls.push(pins, 0)
    else
      @rolls.push(pins)
    end
  end

  def score
    score = 0
    10.times do |frame|
      if strike?(frame)
        score += strike_bonus(frame)
        next
      end
      if spare?(frame)
        score += spare_bonus(frame)
      else
        score += frame_score(frame)
      end
    end
    score
  end

  def spare?(frame)
    @rolls[frame * 2] + @rolls[frame * 2 + 1] == 10
  end

  def strike?(frame)
    @rolls[frame * 2] == 10
  end

  def spare_bonus(frame)
    10 + @rolls[frame * 2 + 2]
  end

  def strike_bonus(frame)
    10 + @rolls[frame * 2 + 2] + @rolls[frame * 2 + 3]
  end

  def frame_score(frame)
    @rolls[frame * 2] + @rolls[frame * 2 + 1]
  end
end

# game = BowlingGame.new
# 10.times { game.roll(3) }
# game.roll(10)
# 2.times { game.roll(2) }
# 6.times { game.roll(1) }
# p game.score
