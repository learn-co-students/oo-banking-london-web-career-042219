class BankAccount
  
  
  #setting attr_reader allows us to shorten the code and remove the existing 'getters'
  attr_reader :name, :balance, :status
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end
  
  def balance=(balance)
    @balance = balance
  end
  
  def status=(status)
    @status = status
  end
  
  
  def deposit(amount)
    @balance = balance + amount
  end
  
  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    if status == 'open'
      balance > 0
    else
      false
    end
  end
  
  def close_account
    @status = 'closed'
  end
end