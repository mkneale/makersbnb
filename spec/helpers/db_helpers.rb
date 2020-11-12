def persisted_data_booking(id:)
  connection = PG.connect(dbname: 'makersbnb_test')
  result = connection.query("SELECT * FROM booking WHERE booking_id = #{id};")
  result.first
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'makersbnb_test')
  result = connection.query("SELECT * FROM space WHERE space_id = #{id};")
  result.first
end

def persisted_data_customers(id:)

  connection = PG.connect(dbname: 'makersbnb_test')
  result = connection.query("SELECT * FROM customer WHERE customer_id = #{id};")
  result.first
end
