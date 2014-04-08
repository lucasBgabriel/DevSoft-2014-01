require_relative 'checking_account'

class StudentAccount < CheckingAccount

	def initialize
		super
    		@monthly_fee    = 0
	end

	def withdraw(amount)
    if(amount <= @balance)
      @balance -= amount
      log_transaction('Withdrawal', amount)
    else
      #Do Nothing
    end
  end
end
