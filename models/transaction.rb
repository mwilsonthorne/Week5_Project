require_relative('../db/sql_runner.rb')
require('pry')

class Transaction

attr_reader :id
attr_accessor :vendor_name, :planet_name, :value, :cargo_id

def initialize( options )
  @id = options["id"].to_i if options["id"]
  @vendor_name = options["vendor_name"]
  @planet_name = options["planet_name"]
  @value = options["value"].to_i
  @cargo_id = options["cargo_id"].to_i
end

def save()
  sql = "INSERT INTO transactions
  (
    vendor_name,
    planet_name,
    value,
    cargo_id
  )
    VALUES
  (
    $1,$2,$3,$4
  )
    RETURNING id
  "
  values = [@vendor_name, @planet_name, @value, @cargo_id]
  arr_hashes = SqlRunner.run(sql, values)
  arr_intergers = arr_hashes.map{|a_hash| a_hash["id"].to_i}
  @id = arr_intergers.first
end

def self.delete_all()
  sql = "DELETE FROM transactions"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM transactions"
  arr_hashes = SqlRunner.run(sql)
  arr_obj = arr_hashes.map{|a_hash| Transaction.new(a_hash)}
  return arr_obj
end

# get Cargo object for this transaction
def get_cargo()
  sql = "SELECT * FROM cargos WHERE id = $1" #link between tables: id = $1 and values = [@cargo_id]
  values = [@cargo_id]
  arr_hashes = SqlRunner.run(sql, values)
  cargo_obj = Cargo.new(arr_hashes.first) #remember Cargo.new(arr_hashes.first) = initialize(options) hash already passed through
  return cargo_obj # only one value passed through array so only first method required ($1). If multiple ($1,$2,$3) then use map.
end




def self.total_value() #self calling for all transactions not one specific. Can now use in controller as Transaction.total_value
  sql = "SELECT SUM(value) FROM transactions"
  arr_hashes = SqlRunner.run(sql)
  # # arr_hashes  is [ { "sum" => "1775" } ]
  first_hash = arr_hashes.first
  # # first_hash  is { "sum" => "1775" }
  total = first_hash['sum'] # use SUM in sql function
  return total
end

end
