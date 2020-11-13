require_relative '../helpers/sign_in'

feature 'request page' do
  scenario 'show request information' do
    @customer = sign_up_and_sign_in
    @space = Space.add(name: 'Hairy Hotel',
      description: 'Super hairy bro',
      ppn: 234,
      start_date: '2020-11-12',
      end_date: '2020-11-28',
      customer_id: @customer.customer_id
    )
    @booking = Booking.add(
      customer_id: @customer.customer_id,
      space_id: @space.id,
      booking_date: '2020-11-26'
    )
    visit "/requests/#{@booking.id}"
    expect(page).to have_content("#{@space.name}")
    expect(page).to have_content("Unconfirmed")
    expect(page).to have_content("#{@booking.booking_date}")
    expect(page).to have_content("#{@customer.email}")
  end
end
