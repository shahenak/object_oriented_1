class Paperboy
  attr_accessor :name, :experience, :side
  attr_reader :earnings

  def initialize(name, side, experience=0, earnings=0)
    @name = name
    @experience = experience
    @side = side
    @earnings = earnings
  end

  def quota
    return 50.0 + experience/2.0
  end

  def deliver(start_address, end_address)
    total_houses = 0

    if (side=="even" && start_address.even? && end_address.even?) || (side == "odd" && start_address.odd? && end_address.odd?)
      total_houses = ((end_address - start_address)/2+1)
    elsif (side == "even" && start_address.odd? && end_address.odd?) || (side == "odd" && start_address.even? && end_address.even?)
      total_houses = ((end_address-start_address)/2)
    #elsif (side == "even" && start_address.even? && end_address.odd?) || (side == "odd" && start_address.even? && end_address.odd?)
      #amount_paid(((end_address+1)-start_address)/2)
    elsif (side == "even" && start_address.odd? && end_address.even?) || (side == "even" && start_address.even? && end_address.odd?) || (side == "odd" && start_address.even? && end_address.odd?) || (side == "odd" && start_address.odd? && end_address.even?)
      total_houses = (((end_address+1)-start_address)/2)
    end
    amount_paid(total_houses.to_f)
  end


  def amount_paid(total_houses)
    puts total_houses
    if total_houses > quota
      amount = quota/4 + (total_houses - quota)/2
    elsif total_houses == quota
      amount = quota/4
    else
      amount = total_houses/4 - 2
    end

  @experience += total_houses
  @earnings += amount
  return amount

  end

  def report
    puts "I'm #{name}! I've delivered #{experience} papers and earned #{earnings.to_f} so far."
  end

end

tommy=Paperboy.new("Tommy", "even")
puts tommy.quota
puts "Please input the start_address"
#gets start_address
start_address = gets.to_i
puts "Please input the end_address"
end_address = gets.to_i
puts tommy.deliver(start_address, end_address)
puts tommy.report
