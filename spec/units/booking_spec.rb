require 'booking'
require 'user'
require 'space'
require_relative '../helpers/db_helpers'

RSpec.describe Booking do
  describe '#add' do
    before(:each) do
      @customer1 = Customer.create(email: 'test@example.com', password: 'test123')
      @space1 = Space.add(
        name: "Hairy Hotel",
        description: "Wow. Hair everywhere",
        ppn: 60, start_date: '2020-10-15',
        end_date: '2020-10-16'
      )
    end
    it 'adds a booking to the database' do
      booking = Booking.add(
        customer_id: @customer1.customer_id,
        space_id: @space1.id,
        booking_date: '2020-11-25'
      )
      persisted_data = persisted_data_booking(id: booking.id)
      expect(persisted_data['booking_id']).to eq booking.id
    end
  end
end
