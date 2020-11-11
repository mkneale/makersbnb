feature 'home page' do
  before(:each) do
    visit '/'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('password_confirmation', with: 'password123')
    click_on('Sign up')
  end
  scenario 'log someone in' do
    visit '/login'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_on('Login')
    expect(page).to have_current_path('/book_a_space')
  end
  scenario 'click login' do
    visit '/'
    click_on('Login')
    expect(page).to have_current_path('/login')
  end
end
