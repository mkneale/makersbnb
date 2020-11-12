require_relative '../helpers/sign_in'
require_relative '../../lib/booking'

feature 'requests page has buttons' do
  before(:each) do
    sign_up_and_sign_in
  end

  scenario 'spaces button should redirect to spaces page' do
    visit '/requests'
    click_on 'Spaces'

    expect(page).to have_current_path('/spaces')
  end

  scenario 'requests button should redirect to requests page' do
    visit '/requests'
    click_on 'Requests'

    expect(page).to have_current_path('/requests')
  end

  scenario 'sign out button should redirect to home page' do
    visit '/requests'
    click_on 'Sign out'

    expect(page).to have_current_path('/')
  end
end

feature 'display my requests' do
  before(:each) do
    sign_up_and_sign_in
    @space = Space.add(name: 'Hairy Hotel',
      description: 'Super hairy bro',
      ppn: 234,
      start_date: '2020-11-12',
      end_date: '2020-11-28'
    )
  end
  scenario 'show name, confirmation and date of request' do
    visit "/spaces/#{@space.id}"
    fill_in 'booking_date', with: '2020-11-14'
    click_on "Request to book"
    expect(page).to have_current_path('/requests')
    expect(page).to have_content("#{@space.name}")
    expect(page).to have_content('Unconfirmed') # should be unconfirmed
    expect(page).to have_content('2020-11-14')
  end
end
