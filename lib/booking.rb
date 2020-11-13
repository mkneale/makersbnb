require_relative 'db_connection'

class Booking
  attr_reader :id, :customer_id, :space_id, :confirmation, :booking_date
  def initialize(id:, customer_id:, space_id:, booking_date:, confirmation:)
    @id = id
    @customer_id = customer_id
    @space_id = space_id
    @booking_date = booking_date
    @confirmation = confirmation
  end

  def self.add(customer_id:, space_id:, booking_date:)
    result = DBConnection.query("
      INSERT INTO booking (customer_id, space_id, booking_date, confirmation)
      VALUES ('#{customer_id}', '#{space_id}', '#{booking_date}', false)
      RETURNING booking_id, customer_id, space_id, booking_date, confirmation
    ")
    booking = Booking.new(
      id: result[0]['booking_id'],
      customer_id: result[0]['customer_id'],
      space_id: result[0]['space_id'],
      booking_date: result[0]['booking_date'],
      confirmation: result[0]['confirmation']
    )
  end

  def self.all(customer_id: nil, host_id: nil, confirmation: nil) # add in host_id
    if host_id.nil?
      result = DBConnection.query("
        SELECT * FROM booking
        WHERE customer_id = '#{customer_id}' AND confirmation = '#{confirmation}'
      ")
    else
      result = DBConnection.query("
        SELECT booking.booking_id, space.customer_id, booking.booking_date, booking.confirmation, booking.space_id FROM booking, space
        WHERE booking.space_id = space.space_id AND space.customer_id = '#{host_id}'
      ")
    end
    result.map { |result| Booking.new(
      id: result['booking_id'],
      customer_id: result['customer_id'],
      space_id: result['space_id'],
      booking_date: result['booking_date'],
      confirmation: result['confirmation']
    ) }
  end

  def self.find(id:)
    result = DBConnection.query("
      SELECT * FROM booking WHERE booking_id = '#{id}'
    ")
    Booking.new(
      id: result[0]['booking_id'],
      customer_id: result[0]['customer_id'],
      space_id: result[0]['space_id'],
      booking_date: result[0]['booking_date'],
      confirmation: result[0]['confirmation']
    )
  end

  def self.confirm(id:)
    result = DBConnection.query("
      UPDATE booking
      SET confirmation = true
      WHERE booking_id = #{id}
      RETURNING booking_id, customer_id, space_id, booking_date, confirmation
    ")
    Booking.new(
      id: result[0]['booking_id'],
      customer_id: result[0]['customer_id'],
      space_id: result[0]['space_id'],
      booking_date: result[0]['booking_date'],
      confirmation: result[0]['confirmation']
    )
  end

end
