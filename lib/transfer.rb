require "pry"
class Transfer

  attr_accessor :sender, :receiver, :status, :amount

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver= receiver
      @status = "pending"
      @amount = amount
    end

    def valid?
      self.sender.valid? && self.receiver.valid? ? true:false
    end

    def execute_transaction
      if self.valid? && self.sender.balance > self.amount && self.status == "pending" 
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
       
      else
        self.status =  "rejected"
       
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if self.valid? && self.receiver.balance > self.amount && self.status == "complete" 
        self.sender.balance += amount
        self.receiver.balance -= amount
        self.status = "reversed"
       
      else
        self.status =  "rejected"
       
        "Transaction rejected. Please check your account balance."
      end

    end

end
