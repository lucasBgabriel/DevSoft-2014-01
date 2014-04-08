require_relative 'bank_account'

class CheckingAccount < BankAccount
  def deposit(amount)
    @balance += amount
    log_transaction('Deposit', amount)
  end

  def withdraw(amount)
    if(amount <= @balance + CREDIT_LINE )
      @balance -= amount
      log_transaction('Withdrawal', amount)
    else
      #Do Nothing
    end
  end

  def transfer(account, amount)
    if @balance-(amount+8) >= 0
      self.withdraw(amount)
      account.deposit(amount)
      self.withdraw(8)
      log_transaction('Transfer', amount)
    end
  end

end
