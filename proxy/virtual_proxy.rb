require_relative 'bank_account'

class VirtualProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def deposit(amount)
    subject.deposit(amount)
  end

  def withdraw(amount)
    subject.withdraw(amount)
  end

  def balance
    subject.balance
  end

  def subject
    @subject ||= @creation_block.call
  end
end

if __FILE__ == $0
  virtual_proxy = VirtualProxy.new { BankAccount.new(100) }
  virtual_proxy.deposit(50)
  virtual_proxy.withdraw(20)
  puts virtual_proxy.balance
end
