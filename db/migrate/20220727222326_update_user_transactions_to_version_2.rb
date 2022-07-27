class UpdateUserTransactionsToVersion2 < ActiveRecord::Migration[7.0]
  def change
    update_view :user_transactions, materialized: true, version: 2, revert_to_version: 1
  end
end
