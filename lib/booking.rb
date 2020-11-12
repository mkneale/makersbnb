require_relative 'db_connection'

class Booking
  attr_reader :id, :customer_id, :space_id
  def initialize(id:, customer_id:, space_id:)
    @id = id
    @customer_id = customer_id
    @space_id = space_id
  end

  def self.add(customer_id:, space_id:, booking_date:)
    result = DBConnection.query("
      INSERT INTO booking (customer_id, space_id, booking_date)
      VALUES ('#{customer_id}', '#{space_id}', '#{booking_date}')
      RETURNING booking_id, customer_id, space_id
    ")
    Booking.new(id: result[0]['booking_id'], customer_id: result[0]['customer_id'], space_id: result[0]['space_id'])
  end
end
