require_relative 'db_connection'

class Space

attr_reader :id, :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.add(name:)
    result = DBConnection.query("
      INSERT INTO space (name)
      VALUES ('#{name}')
      RETURNING space_id, name
    ")
    Space.new(id: result[0]['space_id'], name: result[0]['name'])
  end

  def self.all
    result = DBConnection.query("
      SELECT * FROM space
    ")
    result.map { |space| Space.new(id: space['space_id'], name: space['name']) }
  end
end
