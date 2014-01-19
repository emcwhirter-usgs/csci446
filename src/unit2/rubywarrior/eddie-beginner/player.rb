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

    #me = WarriorStats.new
    space_clear = warrior.feel.empty?

    #if under_attack(warrior.health)
    if warrior.health < @@health # under attack
      if warrior.health >= (1-8*@@heal)*@@max_hp and not space_clear # > 20% hp
        warrior.attack!
      else
        warrior.rest!
      end
    elsif space_clear
        #if not me.under_attack(warrior.health) and not me.full_hp(warrior.health)
        #if not under_attack(warrior.health) and not full_hp(warrior.health)
        if warrior.health < @@health and warrior.health < @@max_hp
            warrior.rest!
        else
            warrior.walk!
        end
    else
        warrior.attack!
    end

    #me.health = warrior.health
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
