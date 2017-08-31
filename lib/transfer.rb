class Transfer

  attr_accessor :sender, :receiver, :status
  attr_reader :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    (sender.valid? && receiver.valid?) && sender.balance >= amount ? true : false
  end

  def execute_transaction
    #puts self.valid?
    #binding.pry
    if self.status == "pending" && self.valid?
      sender.deposit(-amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if status == "complete" && self.valid?
      receiver.deposit(-amount)
      sender.deposit(amount)
      self.status = "reversed"
    end
    #binding.pry
  end

end
