class User < ApplicationRecord
  has_one :account, dependent: :destroy

  after_create :create_account

  validates_presence_of :name, :email

  private

  def create_account
    Account.create!(user: self)
  end
end
