require_relative 'checking_account'

class SalaryAccount < CheckingAccount

	def initialize
		super
    		@monthly_fee    = MONTHLY_FEE*0.5
	end

	def seila()
		@monthly_fee = 10
	end

	def transfer(account, amount)
   		#Do Nothing
    end
end
