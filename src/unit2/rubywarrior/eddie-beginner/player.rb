require 'warriorstats'

class Player

  def play_turn(warrior)
    # add your code here
    sludge_max_hp = 12
    thick_sludge_max_hp = 20
    archer_max_hp = 7

    me = WarriorStats.new
    me.health_begin warrior.health

    if warrior.feel.empty?
        if not me.full_hp and not me.under_attack
            warrior.rest!
        else
            warrior.walk!
        end
    else
        warrior.attack!
    end

    me.health_end warrior.health

  end

end
