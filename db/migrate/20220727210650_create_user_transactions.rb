class CreateUserTransactions < ActiveRecord::Migration[7.0]
  def change
    create_view :user_transactions, materialized: true
  end
end
