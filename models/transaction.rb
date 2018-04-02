require_relative('../db/sql_runner.rb')

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


# SELECT SUM(aggregate_expression)
# FROM tables
# [WHERE conditions];



def total_value()
  sql = "SELECT SUM(value) FROM transactions"
  # arr_hashes  is [ { "total_spending" => "234" } ]
  arr_hashes = SqlRunner.run(sql, values)
  p arr_hashes.first
  # first_hash  is { "total_spending" => "234" }
  first_hash = arr_hashes.first
  total = first_hash['total_spending']
  return total
end

end
