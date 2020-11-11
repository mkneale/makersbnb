feature 'registration' do
  scenario 'a user can sign up with right passwords' do
    visit '/'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('password_confirmation', with: 'password123')
    click_button('Sign up')

    expect(page).to have_current_path('/book_a_space')
  end

  scenario 'a user can sign up with wrong passwords' do
    visit '/'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('password_confirmation', with: 'password321')
    click_button('Sign up')

    expect(page).to have_content "Passwords don't match"
  end
end
