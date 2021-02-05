class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  @@token = 0
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 

  def valid?
    if sender.valid? && receiver.valid?
      return true 
    else 
      false 
    end 
  end 

  def execute_transaction
    @@token = 1
    if !sender.valid? || !receiver.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif sender.balance < amount 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "pending" 
      receiver.deposit(amount)
      sender.deduct(amount)
      @status = "complete"
    end
  end 

  def reverse_transfer
    if @status == "complete"
      reversed = Transfer.new(receiver, sender, amount)
      reversed.execute_transaction
      @status = "reversed"
    end
  end
end
