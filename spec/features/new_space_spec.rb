require_relative '../helpers/db_helpers'
require_relative '../../app'



feature 'add a space' do
  before(:each) do
    sign_up_and_sign_in
  end
  # scenario 'give a space a name' do
  #   visit '/spaces/new'
  #   expect(page).to have_content('List a space')
  #   fill_in 'name', with: "Hairy Hotel"
  #   click_on('Submit')
  #   expect(page).to have_content('Book a space')
  #   expect(page).to have_content('Hairy Hotel')
  # end
  scenario 'give a space a description' do
    visit '/spaces/new'
    fill_in 'name', with: "Hairiest Hotel"
    fill_in 'description', with: "This is a well cool place"
    fill_in 'ppn', with: 50
    fill_in 'start_date', with: '2020-05-20'
    fill_in 'end_date', with: '2020-05-21'
    click_on('Submit')
    expect(page).to have_content("Hairiest Hotel")
    expect(page).to have_content("This is a well cool place")
    expect(page).to have_content(50)
    expect(page).to have_content('2020-05-20')
    expect(page).to have_content('2020-05-21')
  end

  scenario 'spaces button should redirect to spaces page' do
    visit '/spaces/new'
    click_on 'Spaces'

    expect(page).to have_current_path('/spaces')
  end

  scenario 'requests button should redirect to requests page' do
    visit '/spaces/new'
    click_on 'Requests'

    expect(page).to have_current_path('/requests')
  end

  scenario 'sign out button should redirect to home page' do
    visit '/spaces/new'
    click_on 'Sign out'

    expect(page).to have_current_path('/')
  end
end
