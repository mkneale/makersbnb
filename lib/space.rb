require_relative 'db_connection'

class Space

attr_reader :id, :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.add(name:)
    result = DBConnection.query("INSERT INTO space (name) values ('#{name}') RETURNING space_id, name")
    Space.new(id: result[0]['space_id'], name: result[0]['name'])
  end
end
