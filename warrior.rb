ass Player
  def play_turn(warrior)
    if @health && @health > warrior.health
      if warrior.feel.empty?
        warrior.walk!
      else
        if warrior.feel.captive?
          warrior.rescue!
        else
          warrior.attack!
        end
      end
    else
        if !warrior.feel.empty?
           if warrior.feel.captive?
             warrior.rescue!
           else
              warrior.attack!
            end
        elsif warrior.health <20
          warrior.rest!
        else
          warrior.walk!
        end
      end
        @health = warrior.health
    # cool code goes here
  end
end
  

class Player
  def play_turn(warrior)
    if !warrior.feel.empty?
      if warrior.feel.captive?
        warrior.rescue!
      else
        warrior.attack!
      end
    elsif @last_health && @last_health >  warrior.health
          warrior.walk!
    elsif warrior.health < 20
          warrior.rest!
    else
          warrior.walk!
    end
    
    @last_health = warrior.health
  end
end
class Player
  def play_turn(warrior)
    @direction ||= :forward
    if !warrior.feel(@direction).empty?
      if warrior.feel(@direction).captive?
        warrior.rescue!(@direction)
      elsif warrior.feel(@direction).wall?
      @direction = @direction == :forward ? :backward : :forward
      warrior.pivot!(@direction)
      #warrior.walk!(@direction)
      else
        warrior.attack!(@direction)
      end
    elsif @last_health && @last_health >  warrior.health
     if warrior.health < 10
      @direction = @direction == :forward ? :backward : :forward
     end
     warrior.walk!(@direction)
   elsif warrior.health < 20
     warrior.rest!
   else
     warrior.walk!(@direction)
   end
    
    @last_health = warrior.health
  end
end