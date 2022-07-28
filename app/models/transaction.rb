class Transaction < ApplicationRecord
  belongs_to :sender_account, class_name: 'Account'
  belongs_to :recipient_account, class_name: 'Account'

  validate :sender_not_equal_to_recipient
  after_create :update_balances

  private

  def update_balances
    ActiveRecord::Base.transaction do
      sender_account.update!(balance: sender_account.balance - amount)
      recipient_account.update!(balance: recipient_account.balance + amount)
      Scenic.database.refresh_materialized_view('user_transactions', concurrently: false, cascade: false)
    end
  end

  def sender_not_equal_to_recipient
    if sender_account.id == recipient_account.id
      errors.add(:recipient_account, "can't be equal to sender account")
    end
  end
end
