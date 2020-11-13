require_relative 'db_connection'

class Space

attr_reader :id, :name, :description, :ppn, :start_date, :end_date

  def initialize(id:, name:, description:, ppn:, start_date:, end_date:, customer_id:)
    @id = id
    @name = name
    @description = description
    @ppn = ppn
    @start_date = start_date
    @end_date = end_date
    @customer_id = customer_id
  end

  def self.add(name:, description:, ppn:, start_date:, end_date:, customer_id:)
    result = DBConnection.query("
      INSERT INTO space (name, description, ppn, start_date, end_date, customer_id)
      VALUES ('#{name}', '#{description}', '#{ppn}', '#{start_date}', '#{end_date}', '#{customer_id}')
      RETURNING space_id, name, description, ppn, start_date, end_date, customer_id
    ")
    Space.new(
      id: result[0]['space_id'],
      name: result[0]['name'],
      description: result[0]['description'],
      ppn: result[0]['ppn'],
      start_date: result[0]['start_date'],
      end_date: result[0]['end_date'],
      customer_id: result[0]['customer_id']
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
      end_date: result[0]['end_date'],
      customer_id: result[0]['customer_id']
    )
  end

  def self.all(start_date=nil, end_date=nil)
    if start_date == nil && end_date == nil
      result = DBConnection.query("
        SELECT * FROM space
      ")
    else
      result = DBConnection.query("
        SELECT * FROM space WHERE '#{start_date}'::date BETWEEN start_date AND end_date
        OR '#{end_date}'::date BETWEEN start_date AND end_date
      ")
    end
    result.map { |space| Space.new(id: space['space_id'], name: space['name'], description: space['description'], ppn: space['ppn'], start_date: space['start_date'], end_date: space['end_date'], customer_id: space['customer_id']) }
  end

  # def self.all(start_date=nil, end_date=nil)
  #   if start_date == nil && end_date == nil
  #     result = DBConnection.query("
  #       SELECT * FROM space
  #     ")
  #   else
  #     result = DBConnection.query("
  #       SELECT * FROM space WHERE start_date BETWEEN '#{start_date}'::date AND '#{end_date}'::date
  #       OR end_date BETWEEN '#{start_date}'::date AND '#{end_date}'::date
  #     ")
  #   end
  #   result.map { |space| Space.new(id: space['space_id'], name: space['name'], description: space['description'], ppn: space['ppn'], start_date: space['start_date'], end_date: space['end_date']) }
  # end
end
