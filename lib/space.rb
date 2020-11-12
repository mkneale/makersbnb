require_relative 'db_connection'

class Space

attr_reader :id, :name, :description, :ppn, :start_date, :end_date

  def initialize(id:, name:, description:, ppn:, start_date:, end_date:)
    @id = id
    @name = name
    @description = description
    @ppn = ppn
    @start_date = start_date
    @end_date = end_date
  end

  def self.add(name:, description:, ppn:, start_date:, end_date:)
    result = DBConnection.query("
      INSERT INTO space (name, description, ppn, start_date, end_date)
      VALUES ('#{name}', '#{description}', '#{ppn}', '#{start_date}', '#{end_date}')
      RETURNING space_id, name, description, ppn, start_date, end_date
    ")
    Space.new(
      id: result[0]['space_id'],
      name: result[0]['name'],
      description: result[0]['description'],
      ppn: result[0]['ppn'],
      start_date: result[0]['start_date'],
      end_date: result[0]['end_date']
    )
  end

  def self.find(id:)
    result = DBConnection.query("
      SELECT * FROM space
      WHERE space_id = #{id}
    ")
    Space.new(
      id: result[0]['space_id'],
      name: result[0]['name'],
      description: result[0]['description'],
      ppn: result[0]['ppn'],
      start_date: result[0]['start_date'],
      end_date: result[0]['end_date']
    )
  end

  def self.all(start_date=nil, end_date=nil)
    if start_date == nil && end_date == nil
      result = DBConnection.query("
        SELECT * FROM space
      ")
    else
      result = DBConnection.query("
        SELECT * FROM space WHERE start_date <= '#{start_date}'::date AND end_date >= '#{end_date}'::date
      ")
    end
    result.map { |space| Space.new(id: space['space_id'], name: space['name'], description: space['description'], ppn: space['ppn'], start_date: space['start_date'], end_date: space['end_date']) }
  end
end
