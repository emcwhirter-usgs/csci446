class WarriorStats
    def initialize
        @max_hp = 20
        @heal = 0.10
        @@health_begin = @max_hp
        @@health_end = @max_hp
        @@under_attack = false
    end

    def health_begin (health)
        @@health_begin = health
    end
    def health_end (health)
        @@health_end = health
    end

    def full_hp
        if @@health_begin >= @max_hp
            result = true
        else
            result = false
        end
    end

    def under_attack
        if @@health_end - @@health_begin > 0
            under_attack = true
        else
            under_attack = false
        end
    end
end
