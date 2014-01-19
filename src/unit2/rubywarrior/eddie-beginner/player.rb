require 'warriorstats'



class Player

  def play_turn(warrior)
    # add your code here
    @@max_hp = 20
    @@heal = 0.10
    @@health = @@max_hp
    #sludge_max_hp = 12
    #thick_sludge_max_hp = 20
    #archer_max_hp = 7

    space_clear = warrior.feel.empty?

    if space_clear # Space I want to move to is empty
      if warrior.health < @@max_hp # I'm hurt
        if warrior.health >= @@health # not under attack
          warrior.rest!
        else # I'm under attack
          warrior.walk!
        end
      else # I'm full health
        warrior.walk!
      end
    else # Space I want to move to is occupied
      warrior.attack!
    end

    @health = warrior.health
  end

  def under_attack(current_health)
        if current_health.to_i < @health.to_i
            result = true
        else
            result = false
        end
  end

  def full_hp (current_health)
      if current_health.to_i >= @max_hp.to_i
          result = true
      else
          result = false
      end
  end

end
