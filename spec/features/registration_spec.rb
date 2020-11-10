feature 'registration' do
  scenario 'a user can sign up with right passwords' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('password_confirmation', with: 'password123')
    click_button('Sign up')

    expect(page).to have_content "Temporary test"
  end

  scenario 'a user can sign up with wrong passwords' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('password_confirmation', with: 'password321')
    click_button('Sign up')

    expect(page).to have_content "Password don't match"
  end
end