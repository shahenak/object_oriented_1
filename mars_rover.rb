class Rover

attr_accessor :x_coordinate, :y_coordinate, :direction, :plateau_array_x, :plateau_array_y

#initialize x and y coordinates at origin
  # def initialize(x_coordinate = 0, y_coordinate = 0, direction, plateau_array_x, plateau_array_y)
  def initialize
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
    @plateau_array_x = plateau_array_x
    @plateau_array_y = plateau_array_y
  end #end initialize

  def interface
    puts "What is the plateau size? (row, col)"
    plateau_array = gets.chomp.split(" ")
    @plateau_array_x = plateau_array[0].to_i
    @plateau_array_y = plateau_array[1].to_i

    puts "What are the initial coordinates? (row, col, N/S/E/W)"
    initial_coordinates = gets.chomp.split(" ")
    @x_coordinate = initial_coordinates[0].to_i
    @y_coordinate = initial_coordinates[1].to_i
    @direction = initial_coordinates[2]

    read_instruction

    #p "x: #{x_coordinate}, y: #{y_coordinate},dir: #{direction}"

  end

  def read_instruction
    puts "What are the series of moves for the rover? (i.e. LRMLRMMRRL)"
    move_command = gets.chomp.split("")
    move_command.each do |i|
      if i=="L" || i=="R"
        turn(i)
      elsif i=="M"
         move
      end #end if statements
    end #end do loop
    p "#{x_coordinate}, #{y_coordinate}, #{direction}"
  end #end read_instruction

  def turn(i)
      if (i == "L" && @direction == "N") || (i == "R" && @direction == "S")
        @direction = "W"
      elsif (i == "L" && @direction == "S") || (i = "R" && @direction == "N")
        @direction = "E"
      elsif (i == "L" && @direction == "W") || (i == "R" && @direction == "E")
        @direction = "S"
      elsif (i == "L" && @direction == "E") || (i == "R" && @direction == "W")
        @direction = "N"
      end #end if statements
  end #end turn function

  def move
      if (@direction == "N" && @x_coordinate <= @plateau_array_x && @y_coordinate <= @plateau_array_y)
        @y_coordinate += 1
      elsif (@direction == "S" && @x_coordinate <= @plateau_array_x && @y_coordinate <= @plateau_array_y)
        @y_coordinate -= 1
      elsif (@direction == "W" && @x_coordinate <= @plateau_array_x && @y_coordinate <= @plateau_array_y)
        @x_coordinate -= 1
      elsif (@direction == "E" && @x_coordinate <= @plateau_array_x && @y_coordinate <= @plateau_array_y)
        @x_coordinate += 1
      else
        p "Move not possible. Try again!"
      end #end if statements
  end #end move function

end #end class


# rover1  = Rover.new(initial_coordinates[0].to_i, initial_coordinates[1].to_i, initial_coordinates[2].to_i, plateau_array[0], plateau_array[1])
rover1 = Rover.new
rover1.interface
