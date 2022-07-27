class Account < ApplicationRecord
  belongs_to :user
  has_many :sender_transactions, class_name: 'Transaction', foreign_key: 'sender_account_id'
  has_many :recipient_transactions, class_name: 'Transaction', foreign_key: 'recipient_account_id'

  def add_balance(amount)
    self.update!(balance: self.balance += amount)
  end
end
