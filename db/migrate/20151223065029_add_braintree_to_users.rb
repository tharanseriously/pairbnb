class AddBraintreeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :braintree_id, :string
    add_column :users, :braintree_transaction_id, :string
  end
end
