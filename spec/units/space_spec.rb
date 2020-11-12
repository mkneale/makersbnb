require 'space'

RSpec.describe Space do
  describe '#add' do
    it 'adds a space to the listings' do
      space = Space.add(
        name: "Hairy Hotel",
        description: "Wow. Hair everywhere",
        ppn: 60, start_date: '2020-10-15',
        end_date: '2020-10-16'
      )

      p_data = persisted_data(id: space.id)

      expect(p_data['name']).to eq("Hairy Hotel")
    end
  end
  describe '#all' do
    it 'lists all spaces' do
      populate_test_table
      expect(Space.all.first.name).to eq "Hairy Hotel"
    end

    it 'only lists spaces within specified dates' do
      populate_test_table
      names = Space.all('2020-11-09', '2020-11-14').map{ |space| space.name}
      expect(names).to include 'Hairy Hotel'
      expect(names).not_to include 'Hairier Hotel'
    end

  end
  describe '#find' do
    it 'returns a single space object based on an id' do
      space = Space.add(name: 'Hairy Hotel',
        description: 'Super hairy bro',
        ppn: 234,
        start_date: '2020-11-12',
        end_date: '2020-11-28')
      expect(Space.find(id: space.id).name).to eq 'Hairy Hotel'
    end
  end
  # describe '#all' do
  #   it 'lists all spaces alternative' do
  #     space1 = Space.add(name: "Hairy Hotel")
  #     space2 = Space.add(name: "Hairier Hotel")
  #     persisted_data1 = PG.connect(dbname: 'makersbnb').query("SELECT * FROM space WHERE space_id=#{space1.id};")
  #     persisted_data2 = PG.connect(dbname: 'makersbnb').query("SELECT * FROM space WHERE space_id=#{space2.id};")
  #     var = Space.all
  #     expect(var[0].id).to eq persisted_data1['id']
  #     expect(var[1].id).to eq persisted_data2['id']
  #   end
  # end
end
