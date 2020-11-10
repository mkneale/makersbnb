def setup_test_database
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec('TRUNCATE customer;')
end