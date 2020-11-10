require_relative '../helpers/db_helpers'
require_relative '../../app'

feature 'list a space' do
  scenario 'give a space a name' do
    visit '/add_a_listing'
    expect(page).to have_content('List a space')
    fill_in 'name', with: "Hairy Hotel"
    click_on('Submit')
    expect(page).to have_content('Book a space')
    expect(page).to have_content('Hairy Hotel')
  end
end
