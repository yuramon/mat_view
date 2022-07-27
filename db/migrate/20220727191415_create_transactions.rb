class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.integer :sender_account_id, null: false
      t.integer :recipient_account_id, null: false

      t.timestamps
    end

    add_foreign_key :transactions, :accounts, column: :sender_account_id
    add_foreign_key :transactions, :accounts, column: :recipient_account_id
  end
end
