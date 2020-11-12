feature 'login page' do
  before(:each) do
    visit '/'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('password_confirmation', with: 'password123')
    click_button('Sign up')
  end
  scenario 'log the user in and have the customer_id available in the session' do
    @email = 'test@example.com'
    visit '/login'
    fill_in 'email', with: @email
    fill_in 'password', with: 'password123'
    click_on('Login')
    expect(page).to have_current_path('/spaces')
    expect(page).to have_content("You are logged in as #{@email}")
  end
  # scenario 'fail the login if password is wrong' do
  #   visit '/login'
  #   fill_in 'email', with: 'test@example.com'
  #   fill_in 'password', with: 'password321'
  #   click_on('Login')
  #   expect(page).to have_current_path('/login')
  #   expect(page).to have_content('Incorrect password, try again')
  # end
end
