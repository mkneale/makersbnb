# require 'database_helpers'
#
# describe 'create' do
#     it 'creates a new user' do
#         customer = Customer.create(email: 'test@example.com' , password: 'password123')
#
# persisted_data = persisted_data(table: :customer, customer_id: customer.id)
#   expect(customer).to be_a Customer
#   expect(customer.id).to eq persisted_data.first['id']
#   expect(customer.email).to eq 'test@example.com'
#
#
# end
# end
