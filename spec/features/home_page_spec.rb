feature 'home page' do
  before(:each) do
    sign_up_and_sign_in
    visit '/spaces'
    click_on('Sign out')
  end
  scenario 'log someone in' do
    visit '/login'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_on('Login')
    expect(page).to have_current_path('/spaces')
  end
  scenario 'click login' do
    visit '/'
    click_on('Login')
    expect(page).to have_current_path('/login')
  end
end
