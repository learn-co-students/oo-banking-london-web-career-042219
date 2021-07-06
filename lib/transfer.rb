class Transfer
  attr_reader :sender, :receiver, :status, :amount

  @@all = []
  
  def initialize(person1, person2, amount)
    @sender = person1
    @receiver = person2
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if(@@all.include?(self) || @sender.status == "closed" || @receiver.status == "closed" || @sender.balance - @amount < 0)
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
    @@all << self
  end

  def reverse_transfer
    if(@@all.include?(self))
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
  
end
