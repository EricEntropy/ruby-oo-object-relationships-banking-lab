class BankAccount
    attr_accessor :balance, :status
    attr_reader :name 

    def initialize(name)
        @name = name 
        @balance = 1000
        @status = 'open'
    end 

    def deposit(deposit) 
        @balance = @balance + deposit
    end 

    def deduct(deduct) 
        @balance = @balance - deduct
    end

    def display_balance 
        return "Your balance is $#{@balance}."
    end 

    def valid? 
        if @status == "open" && @balance > 0
            return true
        else 
            @status == "closed"
            return false 
        end 
    end 

    def close_account
        @status = "closed"
        @balance = 0
    end 


end
