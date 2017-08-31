require_relative './bank_account.rb'
require_relative './transfer.rb'
require 'pry'


guy = BankAccount.new("guy")
girl = BankAccount.new('girl')
wow = Transfer.new(guy, girl, 100)


binding.pry

"bye"
