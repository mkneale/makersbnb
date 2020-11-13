def sign_up_and_sign_in(email='test@example.com')
  visit '/'
  fill_in('email', with: email)
  fill_in('password', with: 'password123')
  fill_in('password_confirmation', with: 'password123')
  click_on('Sign up')
  Customer.find(email: email)
end
