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




end
