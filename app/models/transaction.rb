class Transaction < ApplicationRecord
  belongs_to :sender_account, class_name: 'Account'
  belongs_to :recipient_account, class_name: 'Account'

  after_create :update_balances

  private

  def update_balances
    ActiveRecord::Base.transaction do
      self.sender_account.update!(balance: self.sender_account.balance - amount)
      self.recipient_account.update!(balance: self.recipient_account.balance + amount)
    end
  end
end
