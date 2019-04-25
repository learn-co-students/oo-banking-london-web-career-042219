require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sending_account, receiving_account, amount)
    @sender = sending_account
    @receiver = receiving_account
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? == true && @receiver.valid? == true ? true : false
  end

  def execute_transaction
    if self.valid? == true && @status == "pending" && @sender.balance >= @amount
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
end
