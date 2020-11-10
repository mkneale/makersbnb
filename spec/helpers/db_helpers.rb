def persisted_data(id:)
  connection = PG.connect(dbname: 'makersbnb_test')
  result = connection.query("SELECT * FROM space WHERE space_id = #{id};")
  result.first
end
