require 'etc'
require_relative 'bank_account'

class ProtectionProxy
  def initialize(real_account, owner_name)
    @subject = real_account
    @owner_name = owner_name
  end

  def deposit(amount)
    check_access
    @subject.deposit(amount)
  end

  def withdraw(amount)
    check_access
    @subject.withdraw(amount)
  end

  def balance
    check_access
    @subject.balance
  end

  def check_access
    if Etc.getlogin != @owner_name
      raise "Illegal access: #{Etc.getlogin} cannot access account"
    end
  end
end

if __FILE__ == $0
  account = BankAccount.new(300)

  protection_proxy = ProtectionProxy.new(account, 'trump')
  protection_proxy.deposit(100)
  protection_proxy.withdraw(20)
  puts protection_proxy.balance
end
