class Transaction < ApplicationRecord
  belongs_to :sender_account, class_name: 'Account'
  belongs_to :recipient_account, class_name: 'Account'

  validate :sender_not_equal_to_recipient
  after_create :update_balances

  private

  def update_balances
    sender_account.update!(balance: sender_account.balance - amount)
    recipient_account.update!(balance: recipient_account.balance + amount)
  end

  def sender_not_equal_to_recipient
    if sender_account.id == recipient_account.id
      errors.add("Recipient account can't be equal to sender account")
    end
  end
end
