feature 'space pages' do
  scenario 'show space information' do
    space = Space.add(name: 'Hairy Hotel',
      description: 'Super hairy bro',
      ppn: 234,
      start_date: '2020-11-12',
      end_date: '2020-11-28')
    visit ("/book_a_space/#{space.id}")
    expect(page).to have_content("#{space.name}")
    expect(page).to have_content("#{space.description}")
    expect(page).to have_content('Pick a date:')
  end
end
