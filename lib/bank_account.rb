# Kevin's Code
class BankAccount
  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def name
    @name
  end

  def balance
    @balance
  end

  def status
    @status
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