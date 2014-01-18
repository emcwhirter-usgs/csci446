class Player
  def play_turn(warrior)
    # add your code here
    max_hp = 20
    sludge_hp = 12
    heal = 0.10

    # If I'm missing 2 times the health I can heal in 1 turn.
    if warrior.health < (1-2*heal)*max_hp
        warrior.rest!
    elsif warrior.feel.empty?
        warrior.walk!
    else
        warrior.attack!
    end
  end
end
