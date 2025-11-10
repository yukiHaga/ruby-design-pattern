# 経理部門
class Payroll
  def update(changed_employee)
    puts "#{changed_employee.name}のために小切手を切ります"
    puts "彼の給料は今#{changed_employee.salary}です"
  end
end

class TaxMan
  def update(changed_employee)
    puts "#{changed_employee.name}に新しい税金の請求書を送ります"
  end
end

require_relative "./subject"

class Employee
  include Subject

  attr_reader :name
  attr_accessor :title, :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

payroll = Payroll.new
fred = Employee.new("Fred", "Engineer", 30000)
fred.add_observer(payroll)
fred.salary = 40000

tax_man = TaxMan.new
fred.add_observer(tax_man)
fred.salary = 50000
