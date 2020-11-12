feature 'requests page has buttons' do
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
