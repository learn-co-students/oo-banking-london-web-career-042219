# Jason's code
class Transfer

  attr_reader :sender, :receiver, :status, :amount

   def initialize(from, to, amount)
     @sender = from
     @receiver = to
     @status = "pending"
     @amount = amount
   end

   def valid?
     sender.valid? && receiver.valid?
   end

   def execute_transaction
     #@sender.balance = @sender.balnce - sdfsdf
     if @status == "pending"
       if sender.balance >= amount
         sender.balance -= amount
         receiver.balance += amount
         @status = "complete"
       else
         @status = "rejected"
         "Transaction rejected. Please check your account balance."
       end
     end
   end

   def reverse_transfer
     if status == "complete"
         sender.balance += amount
         receiver.balance -= amount
         @status = "reversed"
     else
     end
   end

end
