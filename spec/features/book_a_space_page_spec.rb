feature 'book a space page' do
#   scenario 'see all spaces' do
#     visit '/add_a_listing'
#     fill_in 'name', with: "Hairy Hotel"
#
#     click_on('Submit')
#     visit '/add_a_listing'
#     fill_in 'name', with: "Hairier Hotel"
#     click_on('Submit')
#     visit '/book_a_space'
#     expect(page).to have_content "Hairy Hotel"
#     expect(page).to have_content "Hairier Hotel"
#   end
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

end
