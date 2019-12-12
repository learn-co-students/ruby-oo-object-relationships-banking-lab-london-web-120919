require "pry"
class BankAccount

  attr_reader :name, :balance, :status
  attr_writer :balance, :status


 
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
end



def deposit(cash)
  # binding.pry
  self.balance += cash
end

def display_balance
  "Your balance is $#{@balance}."
end

def valid?
  
  # binding.pry
  @status == 'open' && @balance > 0 ? true : false
end



  def close_account
    @status = "closed"
  end

end

#  binding.pry

