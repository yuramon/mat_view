class UserTransactions < ApplicationRecord
  belongs_to :user

  def readonly?
    true
  end
end