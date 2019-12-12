require "pry"

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender,receiver, amount)
    @sender = sender #sender = Bank.new("sender") HOW DO IT KNOW THAT????
    @receiver = receiver
    @amount =  amount
    @status = "pending"
  end
  def valid?
    @sender.valid? && @receiver.valid?
  end
  def execute_transaction
      if @status == "pending" && self.valid? && @sender.balance > @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
      end
      "Transaction rejected. Please check your account balance."
    end
  def reverse_transfer
    if status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
    end
    @status = "reversed"
  end
  # binding.pry
  # 0
end
