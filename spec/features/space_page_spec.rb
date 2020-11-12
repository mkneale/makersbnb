feature 'space pages' do
  before(:each) do
    @space = Space.add(name: 'Hairy Hotel',
      description: 'Super hairy bro',
      ppn: 234,
      start_date: '2020-11-12',
      end_date: '2020-11-28'
    )
  end
  scenario 'show space information' do
    visit ("/spaces/#{@space.id}")
    expect(page).to have_content("#{@space.name}")
    expect(page).to have_content("#{@space.description}")
    expect(page).to have_content('Pick a date:')
  end
  scenario 'spaces button should redirect to spaces page' do
    visit "/spaces/#{@space.id}"
    click_on 'Spaces'

    expect(page).to have_current_path('/spaces')
  end

  scenario 'requests button should redirect to requests page' do
    visit "/spaces/#{@space.id}"
    click_on 'Requests'

    expect(page).to have_current_path('/requests')
  end

  scenario 'sign out button should redirect to home page' do
    visit "/spaces/#{@space.id}"
    click_on 'Sign out'

    expect(page).to have_current_path('/')
  end
end
