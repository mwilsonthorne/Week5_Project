require_relative('../db/sql_runner.rb')

class Cargo

attr_reader :id, :description


def initialize( options )
  @id = options["id"].to_i if options["id"] #database creates id when we create a new opject so if statement required to ensure id is created as we don't call ited
  @description = options["description"]
end

def save()
 sql = "INSERT INTO cargos
  (
    description
  )
    VALUES
  (
    $1
  )
    RETURNING id"
  values = [@description]
  arr_hashes = SqlRunner.run(sql, values)
  # arr_hashes is [ {"description" => "fuel", "id" => "23"} ]
  arr_intergers = arr_hashes.map{|a_hash| a_hash["id"].to_i}
  # arr_intergers is [ 23 ]

  # you want: 23
  @id = arr_intergers.first
end

def self.delete_all()
  sql = "DELETE FROM cargos"
  # you don't want to return any values so no need to state values
  SqlRunner.run(sql)
end


def self.all()
  sql = "SELECT * FROM cargos"
  arr_hashes = SqlRunner.run(sql) # you are reading and not creating values so no values required
  # arr_hashes is [ {"description" => "fuel", "id" => "23"} ]
  arr_obj = arr_hashes.map{|a_hash| Cargo.new(a_hash)}
  # arr_obj is [ "fuel", 23]
  return arr_obj
end


end
