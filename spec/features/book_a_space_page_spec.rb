feature 'book a space page' do
  scenario 'button to go to list a space' do
    visit '/book_a_space'
    click_on('List a space')
    expect(page).to have_current_path('/add_a_listing')
  end
  scenario 'list spaces within a range of dates' do
    populate_test_table
    visit '/book_a_space'
    fill_in 'start_date', with: '2020-11-15'
    fill_in 'end_date', with: '2020-11-18'
    click_on('List Spaces')
    expect(page).to have_content('Hairy Hotel')
    expect(page).not_to have_content('Hairier Hotel')
  end

  scenario 'spaces button should redirect to spaces page' do
    visit '/book_a_space'
    click_on 'Spaces'

    expect(page).to have_current_path('/book_a_space')
  end

  scenario 'requests button should redirect to requests page' do
    visit '/book_a_space'
    click_on 'Requests'

    expect(page).to have_current_path('/requests')
  end

  scenario 'sign out button should redirect to home page' do
    visit '/book_a_space'
    click_on 'Sign out'

    expect(page).to have_current_path('/')
  end

  scenario 'clicking on a space should take you to that spaces page' do
    space = Space.add(name: 'Hairy Hotel',
      description: 'Super hairy bro',
      ppn: 234,
      start_date: '2020-11-12',
      end_date: '2020-11-28')
    visit '/book_a_space'
    click_on('Hairy Hotel')
    expect(page).to have_current_path("/book_a_space/#{space.id}")
  end
end
