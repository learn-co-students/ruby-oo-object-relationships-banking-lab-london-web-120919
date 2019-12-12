class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  # def execute_transaction
  #   if @status == "pending"
  #     if self.valid? && @sender.balance >= @amount
  #       @sender.balance -= @amount
  #       @receiver.balance += @amount
  #       @status = "complete"
  #     else
  #       @status = "rejected"
  #       "Transaction rejected. Please check your account balance."
  #     end
  #   end
  # end

  def execute_transaction
    if @status == "pending" && @sender.balance >= @amount && self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end


end
