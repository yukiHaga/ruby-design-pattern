# 経理部門
class Payroll
  def update(changed_employee)
    puts "#{changed_employee.name}のために小切手を切ります"
    puts "彼の給料は今#{changed_employee.salary}です"
  end
end

class Employee
  attr_reader :name
  attr_accessor :title, :salary

  def initialize(name, title, salary, payroll)
    @name = name
    @title = title
    @salary = salary
    @payroll = payroll
  end

  def salary=(new_salary)
    @salary = new_salary
    @payroll.update(self)
  end
end

payroll = Payroll.new
fred = Employee.new("Fred", "Engineer", 30000, payroll)
fred.salary = 40000
