class WarriorStats
    @max_hp = 20
    attr_accessor :health
    @health = @max_hp

  def full_hp?(warrior)
    if warrior.health >= @max_hp
      result = true
    else
      result = false
    end
  end

  def under_attack?(warrior)
      if warrior.health < @health
        result = true
      else
        result = false
      end
  end
end
