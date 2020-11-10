require 'pg'

def persisted_data (customer_id:)
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("SELECT *FROM customer WHERE customer_id =#{customer_id};")
    result.first
end