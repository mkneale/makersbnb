feature 'spaces page' do
  before(:each) do
    sign_up_and_sign_in
  end
  scenario 'button to go to list a space' do
    visit '/spaces'
    click_on('List a space')
    expect(page).to have_current_path('/spaces/new')
  end
  scenario 'list spaces within a range of dates' do
    populate_test_table
    visit '/spaces'
    fill_in 'start_date', with: '2020-11-22'
    fill_in 'end_date', with: '2020-11-28'
    click_on('List Spaces')
    expect(page).to have_content('Hairy Hotel')
    expect(page).not_to have_content('Hairier Hotel')
  end

  scenario 'spaces button should redirect to spaces page' do
    visit '/spaces'
    click_on 'Spaces'

    expect(page).to have_current_path('/spaces')
  end

  scenario 'requests button should redirect to requests page' do
    visit '/spaces'
    click_on 'Requests'

    expect(page).to have_current_path('/requests')
  end

  scenario 'sign out button should redirect to home page' do
    visit '/spaces'
    click_on 'Sign out'

    expect(page).to have_current_path('/')
  end

  scenario 'clicking on a space should take you to that spaces page' do
    space = Space.add(name: 'Hairy Hotel',
      description: 'Super hairy bro',
      ppn: 234,
      start_date: '2020-11-12',
      end_date: '2020-11-28')
    visit '/spaces'
    click_on('Hairy Hotel')
    expect(page).to have_current_path("/spaces/#{space.id}")
  end
end
feature 'show sign in information' do
  scenario 'sign_out button signs the user out' do
    @email = 'test@example.com'
    visit '/'
    fill_in('email', with: @email)
    fill_in('password', with: 'password123')
    fill_in('password_confirmation', with: 'password123')
    click_button('Sign up')
    visit '/login'
    fill_in 'email', with: @email
    fill_in 'password', with: 'password123'
    click_on('Login')
    expect(page).to have_current_path('/spaces')
    expect(page).to have_content("You are logged in as #{@email}")
    click_on('Sign out')
    visit('/spaces')
    expect(page).not_to have_content("You are logged in as #{@email}")
  end
end
