require('sinatra')
require('sinatra/contrib/all')
require_relative('models/transaction.rb')
require_relative('models/cargo.rb')

get '/transactions' do
  @transactions = Transaction.all #@transactions is linked to @transactions in index.erb
  @total = Transaction.total_value #@total links the self.total_value method in trans.rb and the @total in index.erb
  erb(:index)  #in erb the each method 'transaction' is the same as the below 'transaction'
end

get '/transactions/new' do
  @cargos = Cargo.all #calling for the cargo object as only embedded ruby in new.erb
  erb(:new)
end

post '/transactions' do
  Transaction.new(params).save
  redirect '/transactions'
end
