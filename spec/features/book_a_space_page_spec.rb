feature 'book a space page' do
  scenario 'see all spaces' do
    visit '/add_a_listing'
    fill_in 'name', with: "Hairy Hotel"
    click_on('Submit')
    visit '/add_a_listing'
    fill_in 'name', with: "Hairier Hotel"
    click_on('Submit')
    visit '/book_a_space'
    expect(page).to have_content "Hairy Hotel"
    expect(page).to have_content "Hairier Hotel"
  end
end
