require 'warriorstats'

class Player

  def play_turn(warrior)
    # add your code here
    @max_hp = 20
    #heal = 0.10
    #sludge_max_hp = 12
    #thick_sludge_max_hp = 20
    #archer_max_hp = 7

    #if !half_hp?(warrior) and under_attack?(warrior)
    # defaults
    direction = :forward
    need_to_shoot = false

    # I'm hurt bad, let's run away so I have time to rest.
    if !half_hp?(warrior)
      # If I was running away forward, but haven't hit a wall, keep running
      if @last_move == :forward
        if !warrior.feel.wall?
          direction = :forward
        end
      # If I was running away backward, but haven't hit a wall, keep running
      else # Last move was backward
        if !warrior.feel(:backward).wall?
          direction = :forward
        end
      end
      space_clear = true

    # I don't want to get stuck in a loop, but make sure to check back of room.
    elsif warrior.feel(:backward).empty? and @last_move != :forward
      direction = :backward
      space_clear = true
    elsif warrior.feel(:backward).captive?
      direction = :backward
      space_clear = false
    elsif warrior.feel(:backward).enemy?
      direction = :backward
      space_clear = false

    # Continue searching forward if I'm healthy and nothing is behind me.
    elsif warrior.feel.empty?
      # The space directly in front of me is empty, let's look a little further.
      warrior.look.each { |space|
        if space.enemy?
          need_to_shoot = true
        end
      }
      direction = :forward
      space_clear = true
    # No where left to go forward, so go backwards.
    elsif warrior.feel.wall?
      direction = :backward
      space_clear = false
    end
    @last_move = direction

    if space_clear # Space I want to move to is empty
      if !full_hp?(warrior) and !under_attack?(warrior) # I'm hurt & not under attack
          warrior.rest!
      else # I'm full health
        if need_to_shoot
          warrior.shoot!
        else
          warrior.walk! (direction)
        end
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

  def half_hp?(warrior)
    if warrior.health >= 0.5*@max_hp
      result = true
    else
      result = false
    end
  end

end
