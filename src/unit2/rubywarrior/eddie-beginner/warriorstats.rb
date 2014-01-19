class WarriorStats
    @max_hp = 20
    attr_accessor :health
    @@health = @max_hp

    def initialize
        @max_hp = 20
        @heal = 0.10
    end

    def full_hp ( current_health )
        if current_health >= @max_hp
            result = true
        else
            result = false
        end
    end

    def under_attack ( current_health )
        if current_health <= @@health
            result = true
        else
            result = false
        end
    end
end
