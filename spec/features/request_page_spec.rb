require_relative '../helpers/sign_in'

feature 'request page' do
  before(:each) do


  end
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
  scenario 'clicking accept request changes the requests page listing to confirmed' do
    sign_up_and_sign_in
    visit('spaces/new')
    fill_in 'name', with: "Hairiest Hotel"
    fill_in 'description', with: "This is a well cool place"
    fill_in 'ppn', with: 50
    fill_in 'start_date', with: '2020-05-15'
    fill_in 'end_date', with: '2020-05-25'
    click_on('Submit')
    click_on('Sign out')
    sign_up_and_sign_in('testyboi@test.com')
    click_on('Hairiest Hotel')
    fill_in 'booking_date', with: '2020-11-25'
    click_on 'Request to book'
    click_on 'Sign out'
    visit '/login'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_on('Login')
    visit "/requests"
    click_on('Hairiest Hotel')
    click_on('Accept request')
    expect(page).to have_content('Confirmation: Confirmed')
  end
end
