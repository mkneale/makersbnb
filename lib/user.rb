require_relative './db_connection'

class Customer
  def self.create(email:, password:)
    
    result = DBConnection.query("INSERT INTO customer (email, password) VALUES('#{email}', '#{password}') RETURNING customer_id, email;")
    Customer.new(customer_id: result[0]['customer_id'], email: result[0]['email'])
   
  end

  attr_reader :customer_id, :email

  def initialize(customer_id:, email:)
    @customer_id = customer_id
    @email = email
  end
end