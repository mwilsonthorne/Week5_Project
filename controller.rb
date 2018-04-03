require('sinatra')
require('sinatra/contrib/all')
require_relative('models/transaction.rb')
require_relative('models/cargo.rb')

get '/transactions' do
  @transactions = Transaction.all #@transactions is linked to @transactions in index.erb
  erb(:index)  #in erb the each method 'transaction' is the same as the below 'transaction'
end
