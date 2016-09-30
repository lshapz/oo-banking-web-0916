require 'Pry'
class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount 

  def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @status  = "pending"
   @amount = amount  
  end 

  def valid?
    (@sender.valid? && @receiver.valid?) ? true : false
  end

  def execute_transaction
    if @sender.valid? != true || @sender.balance <= @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status != "complete"
      @status = "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
    end 
  end

  # def execute_transaction
  #   if @status == "pending" 
  #     if 
  #       @status = "rejected"
  #       return "Transaction rejected. Please check your account balance."
  #     elsif @sender.valid? == true
  #       @status = "complete"
  #       @sender.balance -= @amount
  #       @receiver.balance += @amount
  #     end
  #   else 
  #     nil
  #   end 
  # end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
    end 
    @status = "reversed"
  end

end