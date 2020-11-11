require 'space'

RSpec.describe Space do
  describe '.add' do
    it 'adds a space to the listings' do
      space = Space.add(name: "Hairy Hotel")

      p_data = persisted_data(id: space.id)

      expect(p_data['name']).to eq("Hairy Hotel") 
    end
  end
end
