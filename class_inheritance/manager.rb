require_relative "employee"

class Manager < Employee

  attr_reader :subordinates

  def initialize(name, title, salary, boss)
    super
    @subordinates = []
  end

  def bonus(multiplier)
    total_salary = subordinates.map(&:salary).reduce(:+)
    total_salary * multiplier
  end

  def add_subordinate(employee)
    @subordinates << employee
  end

end

ned = Employee.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

darren.add_subordinate(shawna)
darren.add_subordinate(david)

puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
