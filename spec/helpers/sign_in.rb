def sign_up_and_sign_in
  visit '/'
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  fill_in('password_confirmation', with: 'password123')
  click_on('Sign up')
  visit '/login'
  fill_in 'email', with: 'test@example.com'
  fill_in 'password', with: 'password123'
  click_on('Login')
end
