require 'warriorstats'

class Player

  def play_turn(warrior)
    # add your code here
    @max_hp = 20
    #heal = 0.10
    #sludge_max_hp = 12
    #thick_sludge_max_hp = 20
    #archer_max_hp = 7

    if warrior.feel(:backward).empty? and @last_move != :forward
      direction = :backward
      space_clear = true
      @last_move = :backward
    elsif warrior.feel(:backward).captive?
      direction = :backward
      space_clear = false
      @last_move = :backward
    elsif warrior.feel.empty?
      direction = :forward
      space_clear = true
      @last_move = :forward
    else
      direction = :forward
      space_clear = false
      @last_move = :forward
    end
    #space_clear = warrior.feel.empty?

    if space_clear # Space I want to move to is empty
      if !full_hp?(warrior) and !under_attack?(warrior) # I'm hurt & not under attack
          warrior.rest!
      else # I'm full health
        warrior.walk! (direction)
      end
    else # Space I want to move to is occupied
      if warrior.feel(direction).captive?
        warrior.rescue! (direction)
      else
        warrior.attack! (direction)
      end
    end

    @health = warrior.health
  end

  def under_attack?(warrior)
      if warrior.health < @health
        result = true
      else
        result = false
      end
  end

  def full_hp?(warrior)
    if warrior.health >= @max_hp
      result = true
    else
      result = false
    end
  end

end
