class Player
  def play_turn(warrior)
    # add your code here
    max_hp = 20
    sludge_hp = 12
    heal = 0.10

    if warrior.feel.empty?
        if warrior.health < max_hp
            warrior.rest!
        else
            warrior.walk!
        end
    else
        warrior.attack!
    end
  end
end
