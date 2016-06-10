class Cat

  attr_reader :name, :preferred_food, :meal_time

  def initialize(name, preferred_food, meal_time)
    @name = name
    @preferred_food = preferred_food
    @meal_time = meal_time
  end

  def eats_at
    if meal_time == 0
      return "12 AM"
    elsif meal_time > 12
      return "#{meal_time - 12} PM"
    else
      return "#{meal_time} AM"
    end
  end

  def meow
    puts "My name is #{name}. I like #{preferred_food} and I eat at #{eats_at}."
  end
end

boots=Cat.new("Boots", "Tuna", 22)
whiskers=Cat.new("Whiskers", "Bacon", 12)

puts boots.meow
puts whiskers.meow
