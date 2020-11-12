require_relative './db_connection'
require 'bcrypt'

class Customer
  attr_reader :customer_id, :email

  def initialize(customer_id:, email:)
    @customer_id = customer_id
    @email = email
  end

  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DBConnection.query("
      INSERT INTO customer (email, password)
      VALUES('#{email}', '#{encrypted_password}')
      RETURNING customer_id, email;
    ")
    Customer.new(customer_id: result[0]['customer_id'],
      email: result[0]['email'])
  end

  def self.find(email:)
    result = DBConnection.query("
      SELECT * FROM customer
      WHERE email='#{email}';
    ")
    Customer.new(customer_id: result[0]['customer_id'],
      email: result[0]['email'])
  end
end
