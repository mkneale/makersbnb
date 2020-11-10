require 'space'

RSpec.describe Space do
  describe '#add' do
    it 'adds a space to the listings' do
      space = Space.add(name: "Hairy Hotel", description: "Wow. Hair everywhere", ppn: 60, start_date: '2020-10-15', end_date: '2020-10-16')

      p_data = persisted_data(id: space.id)

      expect(p_data['name']).to eq("Hairy Hotel")
    end
  end
  describe '#all' do
    it 'lists all spaces' do
      space1 = Space.add(name: "Hairy Hotel", description: "Super Hairy", ppn: 59, start_date: '2020-10-15', end_date: '2020-10-15')
      space2 = Space.add(name: "Hairier Hotel", description: "Woah, This is crazy hairy", ppn: 60, start_date: '2020-11-16', end_date: '2020-11-17')
      expect(Space.all.first.name).to eq "Hairy Hotel"
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
