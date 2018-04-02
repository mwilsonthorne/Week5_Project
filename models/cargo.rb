require_relative('../db/sql_runner.rb')

class Cargo

attr_reader :id, :description


def initialize( options )
  @id = options["id"].to_i if options["id"] #database creates id when we create a new opject so if statement required to ensure id is created as we don't call ited
  @description = options["description"]
end



end
