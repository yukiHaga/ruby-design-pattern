class BankAccount
  attr_reader :balance

  def initialize(starting_balance = 0)
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class BankAccountPloxy
  def initialize(real_bank_account)
    @real_bank_account = real_bank_account
  end

  def method_missing(name, *args)
    @real_bank_account.send(name, *args)
  end
end

bank_account = BankAccount.new(100)
bank_account_proxy = BankAccountPloxy.new(bank_account)
bank_account_proxy.deposit(50)
bank_account_proxy.withdraw(25)
puts bank_account_proxy.balance # => 125

