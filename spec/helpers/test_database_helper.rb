def truncate_table(table_name)
  begin
      con = PG.connect(dbname: 'makersbnb_test')
      con.exec "TRUNCATE TABLE #{table_name} CASCADE;"
  rescue PG::Error => e
      puts e.message
  ensure
      con.close if con
  end
end
def populate_test_table
  space_list = [
    { name: 'Hairy Hotel',
      description: 'Super hairy bro',
      ppn: 234,
      start_date: '2020-11-12',
      end_date: '2020-11-28' },
    { name: 'Hairier Hotel',
      description: 'EVEN HAIRIER',
      ppn: 280,
      start_date: '2020-11-16',
      end_date: '2020-11-21' }
  ]
  space_list.each do |space|
    Space.add(
      name: space[:name],
      description: space[:description],
      ppn: space[:ppn],
      start_date: space[:start_date],
      end_date: space[:end_date]
    )
  end
end
